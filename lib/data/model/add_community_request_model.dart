import 'package:json_annotation/json_annotation.dart';

part 'add_community_request_model.g.dart';

@JsonSerializable()
class AddCommunityRequestModel {
  String? houseId;
  String? schools;
  String? shopping;
  String? distanceToAirport;
  String? distanceToGo;
  String? publicTransport;

  AddCommunityRequestModel({this.houseId, this.schools, this.shopping, this.distanceToAirport, this.distanceToGo, this.publicTransport});

  factory AddCommunityRequestModel.fromJson(Map<String, dynamic> json) => _$AddCommunityRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCommunityRequestModelToJson(this);
}

