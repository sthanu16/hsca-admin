import 'package:json_annotation/json_annotation.dart';

part 'get_retailer_model.g.dart';

@JsonSerializable()
class GetRetailerModel {
  bool? status;
  List<DataBean>? data;
  dynamic totalPage;
  num? totalLength;
  String? message;

  GetRetailerModel({this.status, this.data, this.totalPage, this.totalLength, this.message});

  factory GetRetailerModel.fromJson(Map<String, dynamic> json) => _$GetRetailerModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetRetailerModelToJson(this);
}

@JsonSerializable()
class DataBean {
  num? id;
  dynamic realtor_id;
  String? first_name;
  String? last_name;
  String? email;
  String? phone;
  String? street_address;
  String? street_address2;
  String? city;
  String? zipcode;
  String? state;
  String? country;
  String? created_at;
  String? deleted_at;
  dynamic buyerCount;

  DataBean({this.id, this.realtor_id, this.first_name, this.last_name, this.email, this.phone, this.street_address, this.street_address2, this.city, this.zipcode, this.state, this.country, this.created_at, this.deleted_at, this.buyerCount});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

