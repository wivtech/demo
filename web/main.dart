//import 'dart:html';
import 'package:demo/demolib.dart';

void main() {
  LocalStorage localStorage = LocalStorage();

  Sidebar sidebar = Sidebar();
  sidebar.showDashboard();

  Create create = Create();
  create.showCreateBottleInfoForm();

  Tokenize tokenize = Tokenize();
  CreateBottleInfo createBottleInfo = CreateBottleInfo(localStorage);
  CreateBottle createBottle = CreateBottle(localStorage, tokenize);
  CreateStock createStock = CreateStock(localStorage, tokenize);

  User courtier = User(1, "Courtier", true);
  localStorage.addUser(courtier);

  User chateau = User(2, "Chateau", false);
  localStorage.addUser(chateau);

}
