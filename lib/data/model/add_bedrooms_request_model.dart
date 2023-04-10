import 'package:json_annotation/json_annotation.dart';

part 'add_bedrooms_request_model.g.dart';

@JsonSerializable()
class AddBedroomsRequestModel {
  String? houseId;
  List<BedroomsBean>? bedrooms;

  AddBedroomsRequestModel({this.houseId, this.bedrooms});

  factory AddBedroomsRequestModel.fromJson(Map<String, dynamic> json) => _$AddBedroomsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddBedroomsRequestModelToJson(this);
}

@JsonSerializable()
class BedroomsBean {
  String? roomType;
  String? size;
  String? carpetFloor;
  String? woodFloor;
  String? closetWN;
  String? bathroom;
  String? standing;
  String? tub;

  BedroomsBean({this.roomType, this.size, this.carpetFloor, this.woodFloor, this.closetWN, this.bathroom, this.standing, this.tub});

  factory BedroomsBean.fromJson(Map<String, dynamic> json) => _$BedroomsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BedroomsBeanToJson(this);
}

