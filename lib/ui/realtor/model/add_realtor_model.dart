import 'package:json_annotation/json_annotation.dart';

part 'add_realtor_model.g.dart';

@JsonSerializable()
class AddRealtorModel {
  bool? status;
  dynamic data;
  String? message;

  AddRealtorModel({this.status, this.data, this.message});

  factory AddRealtorModel.fromJson(Map<String, dynamic> json) => _$AddRealtorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddRealtorModelToJson(this);
}

