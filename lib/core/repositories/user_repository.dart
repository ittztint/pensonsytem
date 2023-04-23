import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as getx;
import 'package:pensionsystem/UI/constant/sizeconfig.dart';
import 'package:pensionsystem/UI/responsiveState/base_view_model.dart';
import 'package:pensionsystem/core/apis/api_route.dart';
import 'package:pensionsystem/core/mixins/validators.dart';
import 'package:pensionsystem/core/model/admin_profile_model.dart';
import 'package:pensionsystem/core/model/fetch_staffs_model.dart';
import 'package:pensionsystem/services/cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../UI/constant/colors.dart';
import '../../UI/responsiveState/view_state.dart';
import '../apis/api_helper.dart';

class UserProvider extends BaseNotifier with Validators {
  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  Future<Map<String, String>> headerWithToken() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString("token")!;
    log("this is the auth token ${await SessionManager().getString("AToken")}");

    Map<String, String> headerToken = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Token ${await SessionManager().getString("AToken")}',
    };
    return headerToken;
  }

  List<OrganizationStaffModel> fetchStaffsModel = [];
  AdminProfileModel adminProfileModel = AdminProfileModel();

  Future<bool> adminLogin(
    String? email,
    String? password,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(ViewState.Busy);
    try {
      Map val = {
        "email": email,
        "password": password,
      };
      var responsebody =
          await API().post(apiRoute.adminLogin, header, jsonEncode(val));
      var response = jsonDecode(responsebody);

      print(response["token"]);
      SessionManager().saveString("AToken", response["token"]);
      print(responsebody);
      setState(ViewState.Idle);
      return true;
    } catch (e) {
      displayError(title: "Error", message: e.toString());
      print(e);
      setState(ViewState.Idle);
      return false;
    }
  }

  Future<bool> staffLogin({
    String? email,
    String? password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(ViewState.Busy);
    try {
      Map val = {
        "email": email,
        "password": password,
      };
      var responsebody =
          await API().post(apiRoute.staffLogin, header, jsonEncode(val));
      var response = jsonDecode(responsebody);
      SessionManager().saveString("SToken", response["token"]);

      print(response["token"]);
      print(responsebody);
      setState(ViewState.Idle);
      return true;
    } catch (e) {
      displayError(title: "Error", message: e.toString());
      print(e);
      setState(ViewState.Idle);
      return false;
    }
  }

  Future<bool> createStaffProfile(
      {String? firstName,
      String? lastName,
      String? otherName,
      String? email,
      String? phone,
      String? department,
      String? designation,
      String? salary,
      List<int>? profilePicture}) async {
    setState(ViewState.Busy);
    FormData formData;
    MultipartFile userPicture;
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      Map<String, dynamic> val = {
        "firstName": firstName,
        "lastName": lastName,
        "otherName": otherName,
        "phone": phone,
        "email": email,
        "department": department,
        "designation": designation,
        "salary": salary,
        "organizationId": adminProfileModel.data?.organizationId,
      };
      Map<String, dynamic> noMediaReq = {}..addAll(val);

      // userPicture = await MultipartFile.fromFile(
      //   profilePicture!,
      //   filename: '$id/${profilePicture}',
      // );

      userPicture = await MultipartFile.fromBytes(profilePicture!,
          filename: "profilePic");

      formData = FormData.fromMap(val..addAll({"profilePicture": userPicture}));
      var responsebody = await API().post(
          apiRoute.registerStaff, await headerWithToken(), noMediaReq,
          multimediaRequest: formData);
      print(responsebody);
      setState(ViewState.Idle);

      return true;
    } catch (e) {
      displayError(title: "Error", message: e.toString());
      print(e);
      setState(ViewState.Idle);
      return false;
    }
  }

  Future<bool> fetchOrganizationStaff() async {
    setState(ViewState.Busy);
    try {
      var responsebody = await API().get(
          "${apiRoute.fetchOrganizationStaffs}/${adminProfileModel.data?.organizationId}",
          await headerWithToken());

      fetchStaffsModel = organizationStaffModelFromJson(responsebody);

      print(responsebody);
      setState(ViewState.Idle);
      return true;
    } catch (e) {
      displayError(title: "Error", message: e.toString());
      print(e);
      setState(ViewState.Idle);
      return false;
    }
  }

  Future<bool> fetchAdminProfile() async {
    setState(ViewState.Busy);
    try {
      var responsebody =
          await API().get(apiRoute.fetchAdminProfile, await headerWithToken());
      adminProfileModel = adminProfileModelFromJson(responsebody);
      print(responsebody);
      setState(ViewState.Idle);
      return true;
    } catch (e) {
      displayError(title: "Error", message: e.toString());
      print(e);
      setState(ViewState.Idle);
      return false;
    }
  }

  Future<bool> fetchStaffProfile({String? organizationId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(ViewState.Busy);
    try {
      var responsebody = await API().get(apiRoute.fetchStaffProfile, header);
      var response = jsonDecode(responsebody);

      print(responsebody);
      setState(ViewState.Idle);
      return true;
    } catch (e) {
      displayError(title: "Error", message: e.toString());
      print(e);
      setState(ViewState.Idle);
      return false;
    }
  }

  displayError({required String title, required String message}) {
    getx.Get.showSnackbar(
      getx.GetSnackBar(
        maxWidth: SizeConfig.widthOf(40),
        snackPosition: getx.SnackPosition.TOP,
        title: title,
        message: message,
        duration: const Duration(seconds: 3),
        backgroundColor: appPrimaryColor,
      ),
    );
  }
}



// https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352010-stock-illustration-default-placeholder-man-and-woman.jpg