import 'dart:convert';

import 'package:dating_app_3/components/button.dart';
import 'package:dating_app_3/components/helpers.dart';
import 'package:dating_app_3/components/spacers.dart';
import 'package:dating_app_3/screens/home_screen.dart';

import 'package:dating_app_3/utils/designs/colors.dart';
import 'package:dating_app_3/utils/designs/styles.dart';
import 'package:dating_app_3/utils/res/res_profile.dart';
import 'package:flutter/material.dart';
import 'package:dating_app_3/utils/api_call/login_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../utils/designs/routes.dart';




class WelcomeScreen extends StatefulWidget {



  const WelcomeScreen({Key? key,}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
const double space = 18.0;


class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async {

    try{
      var response = await post(
          Uri.parse('https://nimble-api.listedhosting.com/api/auth/login'),
          body: {
            'email' : 'xtremeleo@msn.com',
            'password' : 'fire2017'
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  // LoginController loginController = Get.put(LoginController());

  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Material(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover,
                  )
              ),
              child: ListView(
                // shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 35.0),
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      ResWelcomeScreen.welcomeBack,
                      style: sWelcomeBack,
                    ),
                  ),
                  vSpace(space),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      ResWelcomeScreen.accountLogin,
                      style: sAccountLogin,
                    ),
                  ),
                  vSpace(space * 4.2),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(
                          255, 255, 255, 0.12),
                      hintText: ResWelcomeScreen.usernameOrEmail,
                      hintStyle: sHintTextStyle.copyWith(
                          color: Colors.white),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 20.8,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(13)
                        ),
                        borderSide: BorderSide(
                            color: Colors.transparent, width: 3.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                            color: Colors.transparent, width: 3.0
                        ),
                      ),
                    ),
                  ),
                  vSpace(space * 1.6),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(
                          255, 255, 255, 0.12),
                      hintText: 'Password',
                      hintStyle: sHintTextStyle.copyWith(
                          color: Colors.white),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 20.8,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(13)
                        ),
                        borderSide: BorderSide(
                            color: Colors.transparent, width: 3.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                            color: Colors.transparent, width: 3.0
                        ),
                      ),
                    ),
                  ),
                  vSpace(space * 1.6),
                  primaryButton(
                    text: ResSignUp.next,
                    onClick: () {
                       moveTo(
                          context: context,
                          page: const HomeScreen());
                  login(emailController.text.toString(), passwordController.text.toString());
                  },
                    fillColor: kPrimaryColor,
                    textColor: Colors.white,
                  ),
                  vSpace(space * 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ResWelcomeScreen.noAccount,
                        style: sPrimaryTextStyle,
                      ),
                      hSpace(space / 3),
                      InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.signUp),
                        child: Text(
                          ResWelcomeScreen.register,
                          style: sPrimaryTextStyle.copyWith(
                              color: kPrimaryColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
  moveTo({required BuildContext context, required Widget page}) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}