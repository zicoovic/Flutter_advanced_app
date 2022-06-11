// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part "responses.g.dart";

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "numOfNotification")
  int? numOfNotification;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "id")
  String? id;
  CustomerResponse(this.id, this.name, this.numOfNotification);
  //from Json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactResponse {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;
  ContactResponse(this.phone, this.email, this.link);

  //from Json
  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactResponse? contacts;
  AuthenticationResponse(this.customer, this.contacts);

  //from Json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
  //to Json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
