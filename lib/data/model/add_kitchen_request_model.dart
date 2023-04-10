import 'package:json_annotation/json_annotation.dart';

part 'add_kitchen_request_model.g.dart';

@JsonSerializable()
class AddKitchenRequestModel {
  String? houseId;
  String? cabinets;
  String? flooring;
  String? microOven;
  String? backSplash;
  String? island;

  AddKitchenRequestModel({this.houseId, this.cabinets, this.flooring, this.microOven, this.backSplash, this.island});

  factory AddKitchenRequestModel.fromJson(Map<String, dynamic> json) => _$AddKitchenRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddKitchenRequestModelToJson(this);
}

