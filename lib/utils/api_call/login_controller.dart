import 'dart:convert';

import 'package:dating_app_3/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dating_app_3/utils/api_call/auth_endpoints.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          'https://nimble-api.listedhosting.com/api/auth/login');
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);

          emailController.clear();
          passwordController.clear();
          Get.off(const HomeScreen());

        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occurred";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}