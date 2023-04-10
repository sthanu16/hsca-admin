import 'package:json_annotation/json_annotation.dart';

part 'add_appliances_request_model.g.dart';

@JsonSerializable()
class AddAppliancesRequestModel {
  String? houseId;
  String? regridgerator;
  String? dishWasher;
  String? washer;
  String? ac;
  String? furnace;

  AddAppliancesRequestModel({this.houseId, this.regridgerator, this.dishWasher, this.washer, this.ac, this.furnace});

  factory AddAppliancesRequestModel.fromJson(Map<String, dynamic> json) => _$AddAppliancesRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddAppliancesRequestModelToJson(this);
}

