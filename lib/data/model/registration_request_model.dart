import 'package:json_annotation/json_annotation.dart';

part 'registration_request_model.g.dart';

@JsonSerializable()
class RegistrationRequestModel {
  String? realtorId;
  String? firstName;
  String? lastName;
  num? age;
  String? email;
  String? streetAddress;
  String? streetAddress2;
  String? city;
  String? state;
  String? zipcode;
  String? country;
  String? cellPhone;
  String? homePhone;
  num? minPrice;
  num? maxPrice;
  String? buildingType;
  String? deviceId;
  String? deviceType;

  RegistrationRequestModel({this.realtorId, this.firstName, this.lastName, this.age, this.email, this.streetAddress, this.streetAddress2, this.city, this.state, this.zipcode, this.country, this.cellPhone, this.homePhone, this.minPrice, this.maxPrice, this.buildingType, this.deviceId, this.deviceType});

  factory RegistrationRequestModel.fromJson(Map<String, dynamic> json) => _$RegistrationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationRequestModelToJson(this);
}

