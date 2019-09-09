part of demolib;

class CreateBottle {
  LocalStorage localStorage;
  Tokenize tokenize;
  int selectedBottleInfo;

  CreateBottle(LocalStorage localStorage, Tokenize tokenize) {
    this.localStorage = localStorage;
    this.tokenize = tokenize;
    selectedBottleInfo = 0;

    //fill the list over bottleinfos stored
    fillSelectBottleInfo();
    tableUnbtokenizedBottles();

    //Listen to events
    querySelector("#create-bottle-info-form-submit").onClick.listen((event) => fillSelectBottleInfo());
    querySelector("#create-bottle-form-submit").onClick.listen((event) => addNewBottle());

    querySelector("#create-bottle-form-selectbottle").onChange.listen((event) => selectBottleInfoFromSelectList());
  }

  void fillSelectBottleInfo(){
    if(localStorage.isBottleInfoListNotEmpty()) {
      querySelector('#create-bottle-form-selectbottle').children.clear();
      List bottleInfoList = localStorage.getAllBottleInfos();
      var selectBottleInfo = OptionElement();
      selectBottleInfo.innerHtml = "SELECT BottleInfo";
      querySelector('#create-bottle-form-selectbottle').children.add(selectBottleInfo);

      for(BottleInfo bi in bottleInfoList) {
        var el = OptionElement();
        el.value = bi.id.toString();
        el.innerHtml = bi.brandName + " - " + bi.wineName + " - " + bi.year.toString();
        querySelector('#create-bottle-form-selectbottle').children.add(el);
      }
    }else {
      querySelector('#create-bottle-form-selectbottle').children.clear();
      var el = Element.option();
      el.innerHtml = "Empty List";
      querySelector('#create-bottle-form-selectbottle').children.add(el);
    }
  }

  void selectBottleInfoFromSelectList(){
    SelectElement select = querySelector("#create-bottle-form-selectbottle");
    int selectedId = int.parse(select.value);
    BottleInfo bottleInfo = localStorage.getBottleInfoById(selectedId);
    selectedBottleInfo = bottleInfo.id;
    fillBottleFormWithBottleInfo(bottleInfo);
  }

  void tableUnbtokenizedBottles(){
    List<Bottle> allBootles = localStorage.getAllBottles();
    for(Bottle bottle in allBootles){
      if(bottle.txHash == ""){
        tokenize.addBottle(bottle, localStorage.getBottleInfoById(bottle.bottleInfoId), false);
      }
    }
  }

  void fillBottleFormWithBottleInfo(BottleInfo bottleInfo){
    InputElement brand = querySelector('#create-bottle-form-brand');
    brand.value = bottleInfo.brandName;

    InputElement winename = querySelector('#create-bottle-form-winename');
    winename.value = bottleInfo.wineName;

    InputElement producer = querySelector('#create-bottle-form-producer');
    producer.value = bottleInfo.producer;

    InputElement vineyard = querySelector('#create-bottle-form-vineyard');
    vineyard.value = bottleInfo.vineyard;

    InputElement appellation = querySelector('#create-bottle-form-appellation');
    appellation.value = bottleInfo.appellation;

    InputElement designation = querySelector('#create-bottle-form-designation');
    designation.value = bottleInfo.designation;

    InputElement subbrand = querySelector('#create-bottle-form-subbrand');
    subbrand.value = bottleInfo.subBrand;

    SelectElement type = querySelector('#create-bottle-form-type');
    type.value = bottleInfo.wineType == "Red" ? "Red" : "White";

    SelectElement grape = querySelector('#create-bottle-form-grape');
    grape.value = bottleInfo.grape;

    InputElement year = querySelector('#create-bottle-form-year');
    year.value = bottleInfo.year.toString();

    SelectElement bottleunit = querySelector('#create-bottle-form-bottleunit');
    bottleunit.value = bottleInfo.bottleUnit.toString();

    InputElement price = querySelector('#create-bottle-form-price');
    price.value = bottleInfo.price.toString();

    SelectElement classification = querySelector('#create-bottle-form-classification');
    classification.value = bottleInfo.classification.toString();
  }

  void addNewBottle(){

    try {
      //get price
      InputElement brand = querySelector('#create-bottle-form-price');
      Bottle bottle = Bottle();
      bottle.price = int.parse(brand.value);
      bottle.bottleInfoId = selectedBottleInfo;
      bottle.txHash = "";
      bottle.withdraw = false;
      bottle.userID = localStorage.getActiveUser().id;

      localStorage.addBottle(bottle);
      tokenize.addBottle(bottle, localStorage.getBottleInfoById(selectedBottleInfo), false);
    }catch(e){
      print('Saving bottleInfo failed. Error: $e');
    }

    fillSelectBottleInfo();

    //empty fields
    InputElement brand = querySelector('#create-bottle-form-brand');
    brand.value = "";

    InputElement winename = querySelector('#create-bottle-form-winename');
    winename.value = "";

    InputElement producer = querySelector('#create-bottle-form-producer');
    producer.value = "";

    InputElement vineyard = querySelector('#create-bottle-form-vineyard');
    vineyard.value = "";

    InputElement appellation = querySelector('#create-bottle-form-appellation');
    appellation.value = "";

    InputElement designation = querySelector('#create-bottle-form-designation');
    designation.value = "";

    InputElement subbrand = querySelector('#create-bottle-form-subbrand');
    subbrand.value = "";

    SelectElement type = querySelector('#create-bottle-form-type');
    type.value = "Red/White";

    SelectElement grape = querySelector('#create-bottle-form-grape');
    grape.value = "Grape varieties";

    InputElement year = querySelector('#create-bottle-form-year');
    year.value = "";

    SelectElement bottleunit = querySelector('#create-bottle-form-bottleunit');
    bottleunit.value = "Bottle Unit (ml)";

    InputElement price = querySelector('#create-bottle-form-price');
    price.value = "";

    SelectElement classification = querySelector('#create-bottle-form-classification');
    classification.value = "classification";

  }

}