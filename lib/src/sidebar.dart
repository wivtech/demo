part of demolib;

class Sidebar
{
    Sidebar() {
        querySelector("#dashboard-sb").onClick.listen((event) => showDashboard());
        querySelector("#create-sb").onClick.listen((event) => showCreate());
        querySelector("#buy-sb").onClick.listen((event) => showBuy());
        querySelector("#sell-sb").onClick.listen((event) => showSell());
        querySelector("#analrep-sb").onClick.listen((event) => showAnalRep());
        querySelector("#tracktrace-sb").onClick.listen((event) => showTrackTrace());

        querySelector("#dashboard-nb").onClick.listen((event) => showDashboard());
        querySelector("#create-nb").onClick.listen((event) => showCreate());
        querySelector("#buy-nb").onClick.listen((event) => showBuy());
        querySelector("#sell-nb").onClick.listen((event) => showSell());
        querySelector("#analrep-nb").onClick.listen((event) => showAnalRep());
        querySelector("#tracktrace-nb").onClick.listen((event) => showTrackTrace());
    }

    void showDashboard() {
        hideAllPages();
        querySelector("#dashboard-page").style.display = "block";
        querySelector("#dashboard-sb").classes.add('active');
    }

    void showCreate() {
        hideAllPages();
        querySelector("#create-page").style.display = "block";
        querySelector("#create-sb").classes.add('active');
    }

    void showBuy() {
        hideAllPages();
        querySelector("#buy-page").style.display = "block";
        querySelector("#buy-sb").classes.add('active');
    }

    void showSell() {
        hideAllPages();
        querySelector("#sell-page").style.display = "block";
        querySelector("#sell-sb").classes.add('active');
    }

    void showAnalRep() {
        hideAllPages();
        querySelector("#analrep-page").style.display = "block";
        querySelector("#analrep-sb").classes.add('active');
    }

    void showTrackTrace() {
        hideAllPages();
        querySelector("#tracktrace-page").style.display = "block";
        querySelector("#tracktrace-sb").classes.add('active');
    }

    void hideAllPages() {
        querySelector("#dashboard-page").style.display = "none";
        querySelector("#create-page").style.display = "none";
        querySelector("#buy-page").style.display = "none";
        querySelector("#sell-page").style.display = "none";
        querySelector("#analrep-page").style.display = "none";
        querySelector("#tracktrace-page").style.display = "none";

        querySelector("#dashboard-sb").classes.remove('active');
        querySelector("#create-sb").classes.remove('active');
        querySelector("#buy-sb").classes.remove('active');
        querySelector("#sell-sb").classes.remove('active');
        querySelector("#analrep-sb").classes.remove('active');
        querySelector("#tracktrace-sb").classes.remove('active');
    }

}