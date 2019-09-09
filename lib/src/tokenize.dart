part of demolib;

class Tokenize {

  Tokenize();

  void addBottle(Bottle bottle, BottleInfo bottleInfo, bool isTokenized) {
    TableElement tokenizeTable = querySelector("#tokenize-table");
    TableRowElement tr = tokenizeTable.insertRow(-1);
    TableCellElement tc1 = tr.insertCell(0);
    tc1.text = bottleInfo.brandName;

    TableCellElement tc2 = tr.insertCell(1);
    tc2.text = bottleInfo.wineName;

    TableCellElement tc3 = tr.insertCell(2);
    tc3.text = bottle.price.toString();

    TableCellElement tc4 = tr.insertCell(3);
    tc4.text = "Bottle";

    TableCellElement tc5 = tr.insertCell(4);
    tc5.text = "[ ]";
    if(isTokenized){
      tc5.text = "[x]";
    }
  }

  void addStock(Stock stock, BottleInfo bottleInfo, bool isTokenized) {

    TableElement tokenizeTable = querySelector("#tokenize-table");
    TableRowElement tr = tokenizeTable.insertRow(-1);
    TableCellElement tc1 = tr.insertCell(0);
    tc1.text = bottleInfo.brandName;

    TableCellElement tc2 = tr.insertCell(1);
    tc2.text = bottleInfo.wineName;

    TableCellElement tc3 = tr.insertCell(2);
    tc3.text = stock.price.toString();

    TableCellElement tc4 = tr.insertCell(3);
    tc4.text = "Stock";

    TableCellElement tc5 = tr.insertCell(4);
    tc5.text = "[ ]";
    if(isTokenized){
      tc5.text = "[x]";
    }
  }

}