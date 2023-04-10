import 'package:json_annotation/json_annotation.dart';

part 'get_dashboard_model.g.dart';

@JsonSerializable()
class GetDashboardModel {
  bool? status;
  List<DataBean>? data;
  UserRowsBean? userRows;
  num? totalHouse;
  num? totalRealtor;
  String? message;

  GetDashboardModel({this.status, this.data, this.userRows, this.totalHouse, this.totalRealtor, this.message});

  factory GetDashboardModel.fromJson(Map<String, dynamic> json) => _$GetDashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetDashboardModelToJson(this);
}

@JsonSerializable()
class UserRowsBean {
  num? id;
  num? totalUsers;
  num? minPriceAvg;
  num? maxPriceAvg;

  UserRowsBean({this.id, this.totalUsers, this.minPriceAvg, this.maxPriceAvg});

  factory UserRowsBean.fromJson(Map<String, dynamic> json) => _$UserRowsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$UserRowsBeanToJson(this);
}

@JsonSerializable()
class DataBean {
  num? id;
  dynamic realtor_id;
  num? totalHomes;
  String? registration_number;
  String? first_name;
  String? last_name;
  String? created_at;

  DataBean({this.id, this.realtor_id, this.totalHomes, this.registration_number, this.first_name, this.last_name, this.created_at});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

