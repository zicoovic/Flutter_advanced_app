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
