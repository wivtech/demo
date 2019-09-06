part of demolib;

class Create
{

  Create() {
    querySelector("#create-bottle-info-tab").onClick.listen((event) => showCreateBottleInfoForm());
    querySelector("#create-bottle-tab").onClick.listen((event) => showCreateBottleForm());
    querySelector("#create-stock-tab").onClick.listen((event) => showCreateTrunkForm());
  }

  void showCreateBottleInfoForm() {
    hideAllCreateForms();
    querySelector("#create-bottle-info-form").style.display = "block";
    querySelector("#create-bottle-info-tab").classes.add('active');
  }

  void showCreateBottleForm() {
    hideAllCreateForms();
    querySelector("#create-bottle-form").style.display = "block";
    querySelector("#create-bottle-tab").classes.add('active');
  }

  void showCreateTrunkForm() {
    hideAllCreateForms();
    querySelector("#create-stock-form").style.display = "block";
    querySelector("#create-stock-tab").classes.add('active');
  }

  void hideAllCreateForms() {
    querySelector("#create-bottle-info-form").style.display = "none";
    querySelector("#create-bottle-form").style.display = "none";
    querySelector("#create-stock-form").style.display = "none";

    querySelector("#create-bottle-info-tab").classes.remove('active');
    querySelector("#create-bottle-tab").classes.remove('active');
    querySelector("#create-stock-tab").classes.remove('active');
  }

}