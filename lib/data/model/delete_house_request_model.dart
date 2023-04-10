import 'package:json_annotation/json_annotation.dart';

part 'delete_house_request_model.g.dart';

@JsonSerializable()
class DeleteHouseRequestModel {
  num? houseId;

  DeleteHouseRequestModel({this.houseId});

  factory DeleteHouseRequestModel.fromJson(Map<String, dynamic> json) => _$DeleteHouseRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteHouseRequestModelToJson(this);
}

