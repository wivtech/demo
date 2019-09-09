part of demolib;

class Stock {

  int id;
  int bottleInfoId;
  int userID;
  int price;
  int unitsOfBottles;
  String txHash;
  bool withdraw;

  Stock();

  Stock.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        bottleInfoId = json['bottleInfoId'],
        userID = json['userID'],
        price = json['price'],
        unitsOfBottles = json['unitsOfBottles'],
        txHash = json['txHash'],
        withdraw = json['withdraw'];

  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'bottleInfoId' : bottleInfoId,
        'price' : price,
        'unitsOfBottles' : unitsOfBottles,
        'txHash' : txHash,
        'withdraw' : withdraw
      };

}