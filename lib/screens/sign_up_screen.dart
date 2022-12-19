import 'dart:convert';

import 'package:dating_app_3/components/spacers.dart';
import 'package:dating_app_3/components/text_field.dart';
import 'package:dating_app_3/screens/home_screen.dart';
import 'package:dating_app_3/screens/welcome_screen.dart';
import 'package:dating_app_3/utils/designs/colors.dart';
import 'package:dating_app_3/utils/designs/styles.dart';
import 'package:dating_app_3/utils/res/res_profile.dart';

import 'package:http/http.dart';
import '../components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/designs/routes.dart';
// import 'package:dating_app_3/utils/api_call/register_controller.dart';
// import 'package:get/get.dart';
// import 'package:dating_app_3/utils/api_call/register_controller.dart';




class SignUpScreen extends ConsumerStatefulWidget {

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}
const double space = 18;

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async {

    try{
      var response = await post(
          Uri.parse('https://nimble-api.listedhosting.com/api/auth/register'),
          body: {
            'email' : 'xtremeleo@msn.com',
            'password' : 'fire2017'
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Registered successfully');

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Form(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 35.0
            ),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ResSignUp.newAccount,
                  style: sCreateAccount,
                ),
              ),
              vSpace(space * 0.72),
              TypeField(
                state: const TextFieldState(
                  label: ResSignUp.firstName,
                  // controller: firstNameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ), textEditingController: firstNameController,
              ),
              vSpace(space * 0.8),
              TypeField(
                state: const TextFieldState(
                  label: ResSignUp.lastName,
                  // controller: lastNameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ), textEditingController: lastNameController,
              ),
              vSpace(space * 0.8),
              TypeField(
                state: const TextFieldState(
                  label: ResSignUp.email,
                  // controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ), textEditingController: emailController,
              ),
              vSpace(space * 0.8),
              TypeField(
                state: const TextFieldState(
                  label: 'Phone Number',
                  // controller: userNameController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ), textEditingController: mobileController,
              ),
              vSpace(space * 0.8),
              PasswordField(
                state: const TextFieldState(
                  label: 'Password',
                  obscureText: true,
                  // controller: email2Controller,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ), textEditingController: passwordController,
              ),
              vSpace(space * 5.8),
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
              vSpace(space * 1.8),
              Align(
                alignment: Alignment.center,
                child: Text(
                  ResSignUp.policy,
                  style: sHintTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              vSpace(space * 2.9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ResSignUp.haveAnAccount,
                    style: sPrimaryTextStyle,
                  ),
                  hSpace(space / 3),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, Routes.welcome),
                    focusColor: Colors.blue,
                    child: Text(
                      ResSignUp.login,
                      style: sPrimaryTextStyle.copyWith(color: kPrimaryColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  moveTo({required BuildContext context, required Widget page}) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

