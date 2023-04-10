import 'package:json_annotation/json_annotation.dart';

part 'add_house_request_model.g.dart';

@JsonSerializable()
class AddHouseRequestModel {
  String? address;
  String? housePrice;
  num? bedrooms;
  num? bathrooms;
  String? annualTax;
  String? SQfeet;
  String? neighborhood;
  num? builtYear;

  AddHouseRequestModel({this.address, this.housePrice, this.bedrooms, this.bathrooms, this.annualTax, this.SQfeet, this.neighborhood, this.builtYear});

  factory AddHouseRequestModel.fromJson(Map<String, dynamic> json) => _$AddHouseRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddHouseRequestModelToJson(this);
}

