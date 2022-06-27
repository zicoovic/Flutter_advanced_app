//onboarding models

class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject(
    this.title,
    this.subTitle,
    this.image,
  );
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(
    this.sliderObject,
    this.numOfSlides,
    this.currentIndex,
  );
}

//Login Models

class Customer {
  String id;
  String name;
  int numOfNotitfications;
  Customer(this.id, this.name, this.numOfNotitfications);
}

class Contacts {
  String phone;
  String email;
  String link;
  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;
  Authentication(this.customer, this.contacts);
}

class Service {
  String id;
  String title;
  String image;

  Service(this.id, this.title, this.image);
}

class BannerAd {
  String id;
  String title;
  String image;
  String link;

  BannerAd(this.id, this.title, this.image, this.link);
}

class Store {
  String id;
  String title;
  String image;

  Store(this.id, this.title, this.image);
}

class HomeData {
  List<Service> servies;
  List<Store> stores;
  List<BannerAd> banners;

  HomeData(this.servies, this.stores, this.banners);
}

class HomeObject {
  HomeData? data;
  HomeObject(this.data);
}
