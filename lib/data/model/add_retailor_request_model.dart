import 'package:json_annotation/json_annotation.dart';

part 'add_retailor_request_model.g.dart';

@JsonSerializable()
class AddRealtorRequestModel {
  String? realtorId;
  String? firstName;
  String? lastName;
  String? age;
  String? email;
  String? address;
  String? fullAddress;
  String? city;
  String? pinCode;
  String? state;
  String? telephone;
  String? mobile;
  String? priceMin;
  String? priceMax;
  String? building;
  String? country;

  AddRealtorRequestModel({this.realtorId, this.firstName, this.lastName, this.age, this.email, this.address, this.fullAddress, this.city, this.pinCode, this.state, this.telephone, this.mobile, this.priceMin, this.priceMax, this.building, this.country});

  factory AddRealtorRequestModel.fromJson(Map<String, dynamic> json) => _$AddRealtorRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddRealtorRequestModelToJson(this);
}

