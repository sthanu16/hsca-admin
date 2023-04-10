import 'package:json_annotation/json_annotation.dart';

part 'add_other_request_model.g.dart';

@JsonSerializable()
class AddOtherRequestModel {
  String? houseId;
  String? basement;
  String? finished;
  String? garage;

  AddOtherRequestModel({this.houseId, this.basement, this.finished, this.garage});

  factory AddOtherRequestModel.fromJson(Map<String, dynamic> json) => _$AddOtherRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddOtherRequestModelToJson(this);
}

