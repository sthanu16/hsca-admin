import 'package:json_annotation/json_annotation.dart';

part 'user_detail_model.g.dart';

@JsonSerializable()
class UserDetailModel {
  bool? status;
  DataBean? data;
  String? message;

  UserDetailModel({this.status, this.data, this.message});

  factory UserDetailModel.fromJson(Map<String, dynamic> json) => _$UserDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailModelToJson(this);
}

@JsonSerializable()
class DataBean {
  num? id;
  dynamic realtor_id;
  String? first_name;
  String? last_name;
  String? email;
  String? age;
  String? street_address;
  String? street_address2;
  String? city;
  String? state;
  String? zipcode;
  String? country;
  String? cell_phone;
  String? home_phone;
  String? min_price;
  String? max_price;
  String? building_type;
  String? device_id;
  String? device_type;
  String? created_at;
  dynamic deleted_at;
  dynamic realtor_first_name;
  dynamic realtor_last_name;
  String? rating;
  List<HouseDataBean>? houseData;

  DataBean({this.id, this.realtor_id, this.first_name, this.last_name, this.email, this.age, this.street_address, this.street_address2, this.city, this.state, this.zipcode, this.country, this.cell_phone, this.home_phone, this.min_price, this.max_price, this.building_type, this.device_id, this.device_type, this.created_at, this.deleted_at, this.realtor_first_name, this.realtor_last_name, this.rating, this.houseData});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class HouseDataBean {
  num? id;
  num? rating;
  String? house_id;
  String? address;
  String? realtor_id;
  String? created_at;
  String? first_name;
  String? last_name;

  HouseDataBean({this.id, this.rating, this.house_id, this.address, this.realtor_id, this.created_at, this.first_name, this.last_name});

  factory HouseDataBean.fromJson(Map<String, dynamic> json) => _$HouseDataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HouseDataBeanToJson(this);
}

