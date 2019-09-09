part of demolib;

class LocalStorage {

  List<BottleInfo> _bottleInfoList;
  List<Bottle> _bottleList;
  List<Stock> _stockList;
  List<User> _userList;

  LocalStorage() {
    _bottleInfoList = List<BottleInfo>();
    _bottleList = List<Bottle>();
    _stockList = List<Stock>();
    _userList = List<User>();


    if(window.localStorage['bottleInfoList'] == null) {
      print('bottleInfoList is null');
    } else if(_bottleInfoList.isEmpty){
      var bil = json.decode(window.localStorage['bottleInfoList']);
      for(var bi in bil){
        BottleInfo bottlei = BottleInfo.fromJson(bi);
        _bottleInfoList.add(bottlei);
      }
    }

    if(window.localStorage['bottleList'] == null) {
      print('bottleList is null');
    } else if (_bottleList.isEmpty){
      var bottles = json.decode(window.localStorage['bottleList']);
      for(var bottle in bottles){
        Bottle b = Bottle.fromJson(bottle);
        _bottleList.add(b);
      }
    }

    if(window.localStorage['stockList'] == null) {
      print('stockList is null');
    } else if (_stockList.isEmpty){
      var stocks = json.decode(window.localStorage['stockList']);
      for(var stock in stocks){
        Stock s = Stock.fromJson(stock);
        _stockList.add(s);
      }
    }

    if(window.localStorage['userList'] == null) {
      print('userList is null');
    } else if (_userList.isEmpty){
      var users = json.decode(window.localStorage['userList']);
      for(var user in users){
        User u = User.fromJson(user);
        _userList.add(u);
      }
    }

  }

  //************************
  // BottleInfo
  //************************

  void addBottleInfo(BottleInfo bi){
    try{
      int num = 1;
      if(_bottleInfoList.isNotEmpty){
        num = _bottleInfoList.last.id + 1;
      }

      bi.id = num;
      _bottleInfoList.add(bi);
      window.localStorage['bottleInfoList'] = json.encode(_bottleInfoList);
    }catch(e) {
      throw Exception("Could not add bottle info. Message: $e");
    }
  }

  void removeBottleInfo(BottleInfo bi){
    try{
      _bottleInfoList.remove(bi);
      window.localStorage['bottleInfoList'] = json.encode(_bottleInfoList);
    }catch(e) {
      throw Exception("Could not add bottle info. Message: $e");
    }
  }
  
  List getAllBottleInfos(){
    return _bottleInfoList;
  }

  BottleInfo getBottleInfoById(int id){
    for(BottleInfo bi in _bottleInfoList){
      if(bi.id == id) {
        return bi;
      }
    }
    return null;
  }

  bool isBottleInfoListNotEmpty() {
    return _bottleInfoList.isNotEmpty;
  }

  //************************
  // Bottle
  //************************

  void addBottle(Bottle bottle){
    try{
      var num = 1;
      if(_bottleList.isNotEmpty){
        num = _bottleList.last.id + 1;
      }
      bottle.id = num;
      _bottleList.add(bottle);
      window.localStorage['bottleList'] = json.encode(_bottleList);
    }catch(exception) {
      throw Exception("Could not add bottle info");
    }
  }

  void removeBottle(Bottle bottle){
    try{
      _bottleList.remove(bottle);
      window.localStorage['bottleList'] = json.encode(_bottleList);
    }catch(exception) {
      throw Exception("Could not add bottle info");
    }
  }

  List getAllBottles(){
    return _bottleList;
  }

  Bottle getBottleById(int id){
    for(Bottle b in _bottleList){
      if(b.id == id) return b;
    }
    return null;
  }

  bool isBottleListNotEmpty() {
    return _bottleList.isNotEmpty;
  }

  void setBottleTX(int id){
    int index = 0;
    var bottles = getAllBottles();
    for(Bottle b in bottles) {
      if(b.id == id){
        break;
      }
      index++;
    }

    var uuid = Uuid();
    _bottleList[index].txHash = "0x" + uuid.toString();
  }

  void saveBottle() {
    window.localStorage['bottleList'] = json.encode(_bottleList);
  }


  //************************
  // Stock
  //************************

  void addStock(Stock stock){
    try{
      var num = 1;
      if(_stockList.isNotEmpty){
        num = _stockList.last.id + 1;
      }

      stock.id = num;
      _stockList.add(stock);
      window.localStorage['stockList'] = json.encode(_stockList);
    }catch(exception) {
      throw Exception("Could not add bottle info");
    }
  }

  void removeStock(Bottle bottle){
    try{
      _stockList.remove(bottle);
      window.localStorage['stockList'] = json.encode(_stockList);
    }catch(exception) {
      throw Exception("Could not add bottle info");
    }
  }

  List getAllStocks(){
    return _stockList;
  }

  Stock getStockById(int id){
    for(Stock s in _stockList){
      if(s.id == id) return s;
    }
    return null;
  }

  bool isStockListNotEmpty() {
    return _stockList.isNotEmpty;
  }

  void setStockTX(int id){
    int index = 0;
    var stocks = getAllStocks();
    for(Stock s in stocks) {
      if(s.id == id){
        break;
      }
      index++;
    }

    var uuid = Uuid();
    _stockList[index].txHash = "0x" + uuid.toString();
  }

  void saveStock() {
    window.localStorage['stockList'] = json.encode(_stockList);
  }

  //************************
  // User
  //************************

  void addUser(User user){
    try{
      if(getUserById(user.id) == null){
        _userList.add(user);
        window.localStorage['userList'] = json.encode(_userList);
      }
    }catch(exception) {
      throw Exception("Could not add bottle info");
    }
  }

  void removeUser(User user){
    try{
      _userList.remove(user);
      window.localStorage['userList'] = json.encode(_userList);
    }catch(exception) {
      throw Exception("Could not add bottle info");
    }
  }

  List getAllUsers(){
    return _userList;
  }

  User getUserById(int id){
    for(User u in _userList){
      if(u.id == id) return u;
    }
    return null;
  }

  User getActiveUser(){
    for(User u in _userList){
      if(u.active == true) return u;
    }
    return null;
  }

  User getInactiveUser(){
    for(User u in _userList){
      if(u.active == false) return u;
    }
    return null;
  }

  bool isUserListNotEmpty() {
    return _userList.isNotEmpty;
  }

}