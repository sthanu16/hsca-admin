import 'package:dio/dio.dart';
import 'package:hsca/ui/dashboard/dashboard/user/model/user_list_model.dart';
import 'package:hsca/ui/dashboard/house/model/house_detail_model.dart';
import 'package:hsca/ui/dashboard/house/model/sent_report_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../common/constant/app_config.dart';
import '../../data/model/get_dashboard_model.dart';
import '../../data/model/get_retailer_model.dart';
import '../../data/model/login_model.dart';
import '../../ui/dashboard/dashboard/user/model/delete_realtor_model.dart';
import '../../ui/dashboard/dashboard/user/model/delete_user_model.dart';
import '../../ui/dashboard/dashboard/user/model/update_realtor_model.dart';
import '../../ui/dashboard/dashboard/user/model/user_detail_model.dart';
import '../../ui/dashboard/house/model/common_model.dart';
import '../../ui/dashboard/settings/model/app_update_model.dart';
import '../../ui/dashboard/settings/model/app_update_response_model.dart';
import '../../ui/dashboard/settings/model/change_password_model.dart';
import '../../ui/dashboard/settings/model/forgot_password_model.dart';
import '../../ui/realtor/model/add_realtor_model.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST(AppConfig.login)
  Future<LoginModel> loginUser(@Header("Content-Type") String contentType,@Body() Map<String, dynamic> data);

  @GET(AppConfig.realtor)
  Future<GetRetailerModel> realtorList(@Query('keyword') String keyword,@Query('page') String page);

  @POST(AppConfig.addRealtor)
  Future<AddRealtorModel> addRealtor(@Body() Map<String, dynamic> data);

  @PATCH(AppConfig.changePassword)
  Future<ChangePasswordModel> changePassword(@Body() Map<String, dynamic> data);

  @PATCH(AppConfig.updateRealtor)
  Future<UpdateRealtorModel> updateRealtor(@Body() Map<String, dynamic> data);

  @GET(AppConfig.userList)
  Future<UserListModel> userList(@Header("Content-Type") String contentType,@Query("keyword",) String keyword,@Query("page",) String page);

  @GET(AppConfig.dashboard)
  Future<GetDashboardModel> dashboardData(@Header("Content-Type") String contentType);

  @GET(AppConfig.userDetail)
  Future<UserDetailModel> userDetail(@Query('userId') String userId);

  @GET(AppConfig.houseDetail)
  Future<HouseDetail> houseDetail(@Query('houseId') String houseId,);

    @GET(AppConfig.downloadReport)
    Future<CommonModel> downloadReport(@Query('realtorId') String realtorId,);

  @GET(AppConfig.mixingData)
  Future<AppUpdateResponseModel> getMixingData(@Header("Content-Type") String contentType);

  @POST(AppConfig.appUpdate)
  Future<AppUpdateModel> appUpdate(@Body() Map<String, dynamic> data);

  @POST(AppConfig.sentReport)
  Future<SentReportModel> sentReport(@Body() Map<String, dynamic> data);

  @POST(AppConfig.forgotPassword)
  Future<ForgotPasswordModel> emailForgotPassword(@Body() Map<String, dynamic> data);


  @DELETE(AppConfig.deleteUser)
  Future<DeleteUserModel>userDelete(@Query('userId') String userId);

  @DELETE(AppConfig.deleteHouse)
  Future<DeleteUserModel>houseDelete(@Query('houseId') String houseId);

  @DELETE(AppConfig.deleteRealtor)
  Future<DeleteRealtorModel>  deleteRealtor(@Query('realtorId') String realtorId);

}