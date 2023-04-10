import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppUtils {
  String token = "token";

  Future<void> setToken(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(token, data);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(token)??"";
    return data;
  }

  Future logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('user_logged_in', false);
    prefs.setString('token', '');
  }

  void setUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('user_logged_in', true);
  }

  Future<bool> getUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('user_logged_in') ?? false;
    return isLoggedIn;
  }

  void setUserFName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('first_name', name);
  }

  Future<String> getUserFName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('first_name') ?? "";
    return name;
  }

  void setUserLName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('last_name', name);
  }

  Future<String> getUserLName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('last_name') ?? "";
    return name;
  }

  void setUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? "";
    return email;
  }

  void setPhoneNumber(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone_number', number);
  }

  Future<String> getPhoneNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String number = prefs.getString('phone_number') ?? "";
    return number;
  }
}
