import 'package:json_annotation/json_annotation.dart';

part 'update_realtor_model.g.dart';

@JsonSerializable()
class UpdateRealtorModel {
  String? realtorId;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? streetAddress;
  String? streetAddress2;
  String? city;
  String? state;
  String? zipcode;
  String? country;

  UpdateRealtorModel({this.realtorId, this.firstName, this.lastName, this.phone, this.email, this.streetAddress, this.streetAddress2, this.city, this.state, this.zipcode, this.country});

  factory UpdateRealtorModel.fromJson(Map<String, dynamic> json) => _$UpdateRealtorModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateRealtorModelToJson(this);
}

