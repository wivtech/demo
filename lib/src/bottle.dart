part of demolib;

class Bottle {

  int id;
  int bottleInfoId;
  int userID;
  int price;
  String txHash;
  bool withdraw;

  Bottle();

  Bottle.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        bottleInfoId = json['bottleInfoId'],
        userID = json['userID'],
        price = json['price'],
        txHash = json['txHash'],
        withdraw = json['withdraw'];

  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'bottleInfoId' : bottleInfoId,
        'price' : price,
        'txHash' : txHash,
        'withdraw' : withdraw
      };

}