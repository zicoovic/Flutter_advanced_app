import '/app/constants.dart';
import '/data/response/responses.dart';
import '/domain/model/models.dart';
import '/app/extentsions.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.numOfNotification.orZero() ?? Constants.zero,
    );
  }
}

extension ContactsResponseMapper on ContactResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support.orEmpty() ?? Constants.empty;
  }
}

extension ServiesResponseMapper on ServiceResponse {
  Service toDomain() {
    return Service(
      id.orEmpty(),
      title.orEmpty(),
      image.orEmpty(),
    );
  }
}

extension StoreResponseMapper on StoreResponse {
  Store toDomain() {
    return Store(
      id.orEmpty(),
      title.orEmpty(),
      image.orEmpty(),
    );
  }
}

extension BannerResponseMapper on BannersResponse {
  BannerAd toDomain() {
    return BannerAd(
      id.orEmpty(),
      title.orEmpty(),
      image.orEmpty(),
      link.orEmpty(),
    );
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Service> services = (this
                ?.data
                ?.servies
                ?.map((serviceResponse) => serviceResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Service>()
        .toList();
    List<BannerAd> banners = (this
                ?.data
                ?.servies
                ?.map((bannerResponse) => bannerResponse.toDomain()) ??
            const Iterable.empty())
        .cast<BannerAd>()
        .toList();
    List<Store> stores = (this
                ?.data
                ?.servies
                ?.map((storeResponse) => storeResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Store>()
        .toList();

    var data = HomeData(services, stores, banners);
    return HomeObject(data);
  }
}
