import 'package:json_annotation/json_annotation.dart';

part 'add_interior_request_model.g.dart';

@JsonSerializable()
class AddInteriorRequestModel {
  String? houseId;
  String? painting;
  String? ceiling;
  String? windows;
  String? flooring;
  String? stairs;
  String? livingRoom;
  String? size;
  String? carpet;
  String? wood;
  String? familyRoom;
  String? dinningRoom;
  String? powderRoom;

  AddInteriorRequestModel({this.houseId, this.painting, this.ceiling, this.windows, this.flooring, this.stairs, this.livingRoom, this.size, this.carpet, this.wood, this.familyRoom, this.dinningRoom, this.powderRoom});

  factory AddInteriorRequestModel.fromJson(Map<String, dynamic> json) => _$AddInteriorRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddInteriorRequestModelToJson(this);
}

