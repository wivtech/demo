part of demolib;

class BottleInfo {

  int id;
  String brandName;
  String wineName;
  String producer;
  String vineyard;
  String appellation;
  String designation;
  String subBrand;
  String wineType;
  String grape;
  int price;
  int year;
  int bottleUnit;
  int classification;

  BottleInfo();

  BottleInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        brandName = json['brandName'],
        wineName = json['wineName'],
        producer = json['producer'],
        vineyard = json['vineyard'],
        appellation = json['appellation'],
        designation = json['designation'],
        subBrand = json['subBrand'],
        wineType = json['wineType'],
        grape = json['grape'],
        price = json['price'],
        year = json['year'],
        bottleUnit = json['bottleUnit'],
        classification = json['classification'];

  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'brandName' : brandName,
        'wineName' : wineName,
        'producer' : producer,
        'vineyard' : vineyard,
        'appellation' : appellation,
        'designation' : designation,
        'subBrand' : subBrand,
        'wineType' : wineType,
        'grape' : grape,
        'price' : price,
        'year' : year,
        'bottleUnit' : bottleUnit,
        'classification' : classification
      };

}