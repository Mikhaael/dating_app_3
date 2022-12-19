import 'dart:convert';

import 'package:dating_app_3/screens/home_screen.dart';
import 'package:dating_app_3/utils/api_call/auth_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController userNameController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
         'https://nimble-api.listedhosting.com/api/auth/register'
      );
      Map body = {
        'firstname': firstNameController.text,
        'lastname': lastNameController.text,
        'email': emailController.text.trim(),
        'mobile': mobileController.text,
        'password': passwordController.text
      };

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences prefs = await _prefs;

          await prefs?.setString('token', token);
          firstNameController.clear();
          lastNameController.clear();
          emailController.clear();
          mobileController.clear();
          passwordController.clear();
          Get.off(const HomeScreen());
        } else {
          throw jsonDecode(response.body)["message"] ?? "Unknown Error Occurred";
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occurred";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}