import 'package:json_annotation/json_annotation.dart';

part 'delete_realtor_model.g.dart';

@JsonSerializable()
class DeleteRealtorModel {
  bool? status;
  dynamic data;
  String? message;

  DeleteRealtorModel({this.status, this.data, this.message});

  factory DeleteRealtorModel.fromJson(Map<String, dynamic> json) => _$DeleteRealtorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteRealtorModelToJson(this);
}

