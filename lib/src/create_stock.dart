part of demolib;

class CreateStock {
  LocalStorage localStorage;
  Tokenize tokenize;
  int selectedBottleInfo;

  CreateStock(LocalStorage localStorage, Tokenize tokenize) {
    this.localStorage = localStorage;
    this.tokenize = tokenize;
    selectedBottleInfo = 0;

    //fill the list over bottleinfos stored
    fillSelectBottleInfo();
    tableUnbtokenizedStocks();

    //Listen to events
    querySelector("#create-bottle-info-form-submit").onClick.listen((event) => fillSelectBottleInfo());

    querySelector("#create-stock-form-submit").onClick.listen((event) => addNewStock());

    querySelector("#create-stock-form-selectbottle").onChange.listen((event) => selectBottleInfoFromSelectList());

    querySelector("#tokenize-submit").onClick.listen((event) => tokenizeWine());
  }

  void fillSelectBottleInfo(){
    if(localStorage.isBottleInfoListNotEmpty()) {
      querySelector('#create-stock-form-selectbottle').children.clear();
      List bottleInfoList = localStorage.getAllBottleInfos();
      var selectBottleInfo = OptionElement();
      selectBottleInfo.innerHtml = "SELECT BottleInfo";
      querySelector('#create-stock-form-selectbottle').children.add(selectBottleInfo);

      for(BottleInfo bi in bottleInfoList) {
        var el = OptionElement();
        el.value = bi.id.toString();
        el.innerHtml = bi.brandName + " - " + bi.wineName + " - " + bi.year.toString();
        querySelector('#create-stock-form-selectbottle').children.add(el);
      }
    }else {
      querySelector('#create-stock-form-selectbottle').children.clear();
      var el = Element.option();
      el.innerHtml = "Empty List";
      querySelector('#create-stock-form-selectbottle').children.add(el);
    }
  }

  void selectBottleInfoFromSelectList(){
    SelectElement select = querySelector("#create-stock-form-selectbottle");
    int selectedId = int.parse(select.value);
    BottleInfo bottleInfo = localStorage.getBottleInfoById(selectedId);
    selectedBottleInfo = bottleInfo.id;
    fillStockFormWithBottleInfo(bottleInfo);
  }
  
  void tableUnbtokenizedStocks(){
    List<Stock> allStocks = localStorage.getAllStocks();
    for(Stock stock in allStocks){
      if(stock.txHash == ""){
        tokenize.addStock(stock, localStorage.getBottleInfoById(stock.bottleInfoId), false);
      }
    }
  }

  void fillStockFormWithBottleInfo(BottleInfo bottleInfo){
    InputElement brand = querySelector('#create-stock-form-brand');
    brand.value = bottleInfo.brandName;

    InputElement winename = querySelector('#create-stock-form-winename');
    winename.value = bottleInfo.wineName;

    InputElement producer = querySelector('#create-stock-form-producer');
    producer.value = bottleInfo.producer;

    InputElement vineyard = querySelector('#create-stock-form-vineyard');
    vineyard.value = bottleInfo.vineyard;

    InputElement appellation = querySelector('#create-stock-form-appellation');
    appellation.value = bottleInfo.appellation;

    InputElement designation = querySelector('#create-stock-form-designation');
    designation.value = bottleInfo.designation;

    InputElement subbrand = querySelector('#create-stock-form-subbrand');
    subbrand.value = bottleInfo.subBrand;

    SelectElement type = querySelector('#create-stock-form-type');
    type.value = bottleInfo.wineType == "Red" ? "Red" : "White";

    SelectElement grape = querySelector('#create-stock-form-grape');
    grape.value = bottleInfo.grape;

    InputElement year = querySelector('#create-stock-form-year');
    year.value = bottleInfo.year.toString();

    SelectElement bottleunit = querySelector('#create-stock-form-bottleunit');
    bottleunit.value = bottleInfo.bottleUnit.toString();

    InputElement price = querySelector('#create-stock-form-price');
    price.value = bottleInfo.price.toString();

    SelectElement classification = querySelector('#create-stock-form-classification');
    classification.value = bottleInfo.classification.toString();
  }

  void addNewStock(){

    try {
      //get price
      InputElement bottleprice = querySelector('#create-stock-form-price');
      InputElement bottlenumber = querySelector('#create-stock-form-bottlenumber');
      Stock stock = Stock();
      stock.price = int.parse(bottleprice.value);
      stock.unitsOfBottles = int.parse(bottlenumber.value);
      stock.bottleInfoId = selectedBottleInfo;
      stock.txHash = "";
      stock.withdraw = false;
      stock.userID = localStorage.getActiveUser().id;

      localStorage.addStock(stock);
      tokenize.addStock(stock, localStorage.getBottleInfoById(selectedBottleInfo), false);

      var uuid = Uuid();
      stock.txHash = "0x" + uuid.toString();
      var priceNew = stock.price * 0.8;
      stock.price = priceNew.floor();
      stock.userID = localStorage.getInactiveUser().id;
      localStorage.addStock(stock);

    }catch(e){
      print('Saving stock failed. Error: $e');
    }

    fillSelectBottleInfo();

    //empty fields
    InputElement brand = querySelector('#create-stock-form-brand');
    brand.value = "";

    InputElement winename = querySelector('#create-stock-form-winename');
    winename.value = "";

    InputElement producer = querySelector('#create-stock-form-producer');
    producer.value = "";

    InputElement vineyard = querySelector('#create-stock-form-vineyard');
    vineyard.value = "";

    InputElement appellation = querySelector('#create-stock-form-appellation');
    appellation.value = "";

    InputElement designation = querySelector('#create-stock-form-designation');
    designation.value = "";

    InputElement subbrand = querySelector('#create-stock-form-subbrand');
    subbrand.value = "";

    SelectElement type = querySelector('#create-stock-form-type');
    type.value = "Red/White";

    SelectElement grape = querySelector('#create-stock-form-grape');
    grape.value = "Grape varieties";

    InputElement year = querySelector('#create-stock-form-year');
    year.value = "";

    SelectElement bottleunit = querySelector('#create-stock-form-bottleunit');
    bottleunit.value = "Bottle Unit (ml)";

    InputElement price = querySelector('#create-stock-form-price');
    price.value = "";

    SelectElement classification = querySelector('#create-stock-form-classification');
    classification.value = "classification";

  }

  //Hack
  void tokenizeWine(){
    int stockCount = 0;
    int bottleCount = 0;
    List<Stock> stocksToTokenize = List<Stock>();
    List<Bottle> bottlesToTokenize = List<Bottle>();

    List<Stock> allStocks = localStorage.getAllStocks();
    for(Stock stock in allStocks){
      if(stock.txHash == ""){
        stockCount++;
        stocksToTokenize.add(stock);
      }
    }

    List<Bottle> allBootles = localStorage.getAllBottles();
    for(Bottle bottle in allBootles){
      if(bottle.txHash == ""){
        bottleCount++;
        bottlesToTokenize.add(bottle);
      }
    }

    int totalRows = stockCount + bottleCount;
    for(int i = 1; i <= totalRows; i++){
      TableElement tokenizeTable = querySelector("#tokenize-table");
      tokenizeTable.deleteRow(i);
    }

    for(Stock stock in stocksToTokenize){
      if(stock.txHash == ""){
        localStorage.setStockTX(stock.id);
        tokenize.addStock(stock, localStorage.getBottleInfoById(stock.bottleInfoId), true);
      }
    }

    for(Bottle bottle in bottlesToTokenize){
      if(bottle.txHash == ""){
        localStorage.setBottleTX(bottle.id);
        tokenize.addBottle(bottle, localStorage.getBottleInfoById(bottle.bottleInfoId), true);
      }
    }

    localStorage.saveBottle();
    localStorage.saveStock();

  }

}