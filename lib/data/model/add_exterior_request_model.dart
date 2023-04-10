import 'package:json_annotation/json_annotation.dart';

part 'add_exterior_request_model.g.dart';

@JsonSerializable()
class AddExteriorRequestModel {
  String? houseId;
  String? view;
  String? landScaping;
  String? lawnF;
  String? lawnB;
  String? brick;
  String? viny1;
  String? deck;
  String? patio;
  String? garage;
  String? windows;
  String? doors;
  String? roof;
  String? fence;

  AddExteriorRequestModel({this.houseId, this.view, this.landScaping, this.lawnF, this.lawnB, this.brick, this.viny1, this.deck, this.patio, this.garage, this.windows, this.doors, this.roof, this.fence});

  factory AddExteriorRequestModel.fromJson(Map<String, dynamic> json) => _$AddExteriorRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddExteriorRequestModelToJson(this);
}

