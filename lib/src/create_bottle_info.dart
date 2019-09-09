part of demolib;

class CreateBottleInfo {
  LocalStorage localStorage;

  CreateBottleInfo(LocalStorage localStorage) {
    this.localStorage = localStorage;

    //fill the list over bottleinfos stored
    fillSelectBottleInfo();

    //Listen to events
    querySelector("#create-bottle-info-form-submit").onClick.listen((event) => addNewBottleInfo());

    querySelector("#create-bottle-info-form-selectbottle").onChange.listen((event) => selectBottleInfoFromSelectList());
  }

  void fillSelectBottleInfo(){
    if(localStorage.isBottleInfoListNotEmpty()) {
      querySelector('#create-bottle-info-form-selectbottle').children.clear();
      List bottleInfoList = localStorage.getAllBottleInfos();
      var selectBottleInfo = OptionElement();
      selectBottleInfo.innerHtml = "SELECT BottleInfo";
      querySelector('#create-bottle-info-form-selectbottle').children.add(selectBottleInfo);

      for(BottleInfo bi in bottleInfoList) {
        var el = OptionElement();
        el.value = bi.id.toString();
        el.innerHtml = bi.brandName + " - " + bi.wineName + " - " + bi.year.toString();
        querySelector('#create-bottle-info-form-selectbottle').children.add(el);
      }
    }else {
      querySelector('#create-bottle-info-form-selectbottle').children.clear();
      var el = Element.option();
      el.innerHtml = "Empty List";
      querySelector('#create-bottle-info-form-selectbottle').children.add(el);
    }
  }

  void selectBottleInfoFromSelectList(){
    SelectElement select = querySelector("#create-bottle-info-form-selectbottle");
    int selectedId = int.parse(select.value);
    BottleInfo bottleInfo = localStorage.getBottleInfoById(selectedId);
    fillBottleInfoFormWithBottleInfo(bottleInfo);
  }

  void fillBottleInfoFormWithBottleInfo(BottleInfo bottleInfo){
    InputElement brand = querySelector('#create-bottle-info-form-brand');
    brand.value = bottleInfo.brandName;

    InputElement winename = querySelector('#create-bottle-info-form-winename');
    winename.value = bottleInfo.wineName;

    InputElement producer = querySelector('#create-bottle-info-form-producer');
    producer.value = bottleInfo.producer;

    InputElement vineyard = querySelector('#create-bottle-info-form-vineyard');
    vineyard.value = bottleInfo.vineyard;

    InputElement appellation = querySelector('#create-bottle-info-form-appellation');
    appellation.value = bottleInfo.appellation;

    InputElement designation = querySelector('#create-bottle-info-form-designation');
    designation.value = bottleInfo.designation;

    InputElement subbrand = querySelector('#create-bottle-info-form-subbrand');
    subbrand.value = bottleInfo.subBrand;

    SelectElement type = querySelector('#create-bottle-info-form-type');
    type.value = bottleInfo.wineType == "Red" ? "Red" : "White";

    SelectElement grape = querySelector('#create-bottle-info-form-grape');
    grape.value = bottleInfo.grape;

    InputElement year = querySelector('#create-bottle-info-form-year');
    year.value = bottleInfo.year.toString();

    SelectElement bottleunit = querySelector('#create-bottle-info-form-bottleunit');
    bottleunit.value = bottleInfo.bottleUnit.toString();

    InputElement price = querySelector('#create-bottle-info-form-price');
    price.value = bottleInfo.price.toString();

    SelectElement classification = querySelector('#create-bottle-info-form-classification');
    classification.value = bottleInfo.classification.toString();
  }

  void addNewBottleInfo(){

    try {
      //get all fields
      InputElement brand = querySelector('#create-bottle-info-form-brand');
      InputElement winename = querySelector(
          '#create-bottle-info-form-winename');
      InputElement producer = querySelector(
          '#create-bottle-info-form-producer');
      InputElement vineyard = querySelector(
          '#create-bottle-info-form-vineyard');
      InputElement appellation = querySelector(
          '#create-bottle-info-form-appellation');
      InputElement designation = querySelector(
          '#create-bottle-info-form-designation');
      InputElement subbrand = querySelector(
          '#create-bottle-info-form-subbrand');
      SelectElement type = querySelector('#create-bottle-info-form-type');
      SelectElement grape = querySelector('#create-bottle-info-form-grape');
      InputElement year = querySelector('#create-bottle-info-form-year');
      SelectElement bottleunit = querySelector(
          '#create-bottle-info-form-bottleunit');
      InputElement price = querySelector('#create-bottle-info-form-price');
      SelectElement classification = querySelector(
          '#create-bottle-info-form-classification');

      BottleInfo bottleInfo = BottleInfo();
      bottleInfo.brandName = brand.value;
      bottleInfo.wineName = winename.value;
      bottleInfo.producer = producer.value;
      bottleInfo.vineyard = vineyard.value;
      bottleInfo.appellation = appellation.value;
      bottleInfo.designation = designation.value;
      bottleInfo.subBrand = subbrand.value;
      bottleInfo.wineType = type.value;
      bottleInfo.grape = grape.value;
      bottleInfo.year = int.parse(year.value);
      bottleInfo.bottleUnit = int.parse(bottleunit.value);
      bottleInfo.price = int.parse(price.value);
      if(classification.value == "classification"){
        bottleInfo.classification = 0;
      }else{
        bottleInfo.classification = int.parse(classification.value);
      }


      localStorage.addBottleInfo(bottleInfo);
    }catch(e){
      print('Saving bottleInfo failed. Error: $e');
    }

    fillSelectBottleInfo();

    //empty fields
    InputElement brand = querySelector('#create-bottle-info-form-brand');
    brand.value = "";

    InputElement winename = querySelector('#create-bottle-info-form-winename');
    winename.value = "";

    InputElement producer = querySelector('#create-bottle-info-form-producer');
    producer.value = "";

    InputElement vineyard = querySelector('#create-bottle-info-form-vineyard');
    vineyard.value = "";

    InputElement appellation = querySelector('#create-bottle-info-form-appellation');
    appellation.value = "";

    InputElement designation = querySelector('#create-bottle-info-form-designation');
    designation.value = "";

    InputElement subbrand = querySelector('#create-bottle-info-form-subbrand');
    subbrand.value = "";

    SelectElement type = querySelector('#create-bottle-info-form-type');
    type.value = "Red/White";

    SelectElement grape = querySelector('#create-bottle-info-form-grape');
    grape.value = "Grape varieties";

    InputElement year = querySelector('#create-bottle-info-form-year');
    year.value = "";

    SelectElement bottleunit = querySelector('#create-bottle-info-form-bottleunit');
    bottleunit.value = "Bottle Unit (ml)";

    InputElement price = querySelector('#create-bottle-info-form-price');
    price.value = "";

    SelectElement classification = querySelector('#create-bottle-info-form-classification');
    classification.value = "classification";

  }

}