import 'package:injectable/injectable.dart';

import '../../../../data/model/get_dashboard_model.dart';
import '../../../../data/model/get_retailer_model.dart';
import '../../../../data/model/login_model.dart';
import '../../../../ui/dashboard/dashboard/user/model/delete_realtor_model.dart';
import '../../../../ui/dashboard/dashboard/user/model/delete_user_model.dart';
import '../../../../ui/dashboard/dashboard/user/model/update_realtor_model.dart';
import '../../../../ui/dashboard/dashboard/user/model/user_detail_model.dart';
import '../../../../ui/dashboard/dashboard/user/model/user_list_model.dart';
import '../../../../ui/dashboard/house/model/house_detail_model.dart';
import '../../../../ui/dashboard/house/model/sent_report_model.dart';
import '../../../../ui/dashboard/settings/model/app_update_model.dart';
import '../../../../ui/dashboard/settings/model/app_update_response_model.dart';
import '../../../../ui/dashboard/settings/model/change_password_model.dart';
import '../../../../ui/realtor/model/add_realtor_model.dart';
import '../../../network/result.dart';
import '../../../service/auth_service.dart';
import '../base_repository.dart';

@lazySingleton
class AuthRepository extends BaseRepository {
  Future<Result<LoginModel>> getLogin(
          {required String password, required String email}) async =>
      safeCall(AuthService(await dio).loginUser("application/json", {
        "email": email,
        "password": password,
      }));


  Future<Result<GetRetailerModel>> getRealtor(
          {String? keyword, String? page}) async =>
      safeCall(AuthService(await dio).realtorList(
          keyword!,page!
      ));

  Future<Result<GetDashboardModel>> getDashboard() async =>
      safeCall(AuthService(await dio).dashboardData("application/json",));


  Future<Result<AddRealtorModel>> addRealtor(
          {required String realtorId,
          required String firstName,
          required String lastName,
          required String phone,
          required String email,
          required String streetAddress,
          required String streetAddress2,
          required String city,
          required String state,
          required String zipcode,
          required String country}) async =>
      safeCall(AuthService(await dio).addRealtor({
        "realtorId": realtorId,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "streetAddress": streetAddress,
        "streetAddress2": streetAddress2,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
      }));


  Future<Result<SentReportModel>> submitReport(
      {required String userId,
        required String email}) async =>
      safeCall(AuthService(await dio).sentReport({
        "userId": userId,
        "email": email
      }));

  Future<Result<AppUpdateResponseModel>> getAppUpdateData() async =>
      safeCall(AuthService(await dio).getMixingData("application/json"));

  Future<Result<AppUpdateModel>> appUpdate({
    required String androidVersion,
    required String iosVersion,
    required String androidCode,
    required String iosCode,
    required String forceAndroidUpdate,
    required String forceIosUpdate,
    required String anroidDescription,
    required String androidPackageName,
    required String iosPackageName,
    required String iosDescription,
  }) async =>
      safeCall(AuthService(await dio).appUpdate({
        "androidVersion": androidVersion,
        "iosVersion": iosVersion,
        "androidCode": androidCode,
        "iosCode": iosCode,
        "forceAndroidUpdate": forceAndroidUpdate,
        "forceIosUpdate": forceIosUpdate,
        "androidDescription": anroidDescription,
        "androidPackageName": androidPackageName,
        "iosPackageName": iosPackageName,
        "iosDescription": iosDescription,
      }));

  Future<Result<ChangePasswordModel>> changePassword(
          {required String oldPassword, required String newPassword}) async =>
      safeCall(AuthService(await dio).changePassword(
          {"oldPassword": oldPassword, "newPassword": newPassword}));

  Future<Result<UpdateRealtorModel>> updateRealtor(
          {required String realtorId,
          required String firstName,
          required String lastName,
          required String phone,
          required String email,
          required String streetAddress,
          required String streetAddress2,
          required String city,
          required String state,
          required String zipcode,
          required String country}) async =>
      safeCall(AuthService(await dio).updateRealtor({
        "realtorId": realtorId,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "streetAddress": streetAddress,
        "streetAddress2": streetAddress2,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,

      }));

  Future<Result<UserListModel>> getUserList(String keyword, String page,) async =>
      safeCall(AuthService(await dio).userList(
        "application/json",
          keyword,
         page,
      ));


  Future<Result<UserDetailModel>> getUserDetail(String? userId) async =>
      safeCall(AuthService(await dio).userDetail(
          userId??""
      ));

  Future<Result<HouseDetail>> getHouseDetail(String houseId) async =>
      safeCall(AuthService(await dio).houseDetail(houseId));

  Future<Result<DeleteUserModel>> deleteUser(dynamic userId) async =>
      safeCall(AuthService(await dio).userDelete(
          userId
      ));

  Future<Result<DeleteUserModel>> deleteHouse(dynamic houseId) async =>
      safeCall(AuthService(await dio).houseDelete(
          houseId
      ));

  Future<Result<DeleteRealtorModel>> deleteRealtor(String realtorId) async =>
      safeCall(AuthService(await dio).deleteRealtor(realtorId));

}
