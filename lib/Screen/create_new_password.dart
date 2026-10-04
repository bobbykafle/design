// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login/Component/app_color.dart';
import 'package:login/Component/custom_app_bar.dart';
import 'package:login/Component/custombutton.dart';
import 'package:login/Component/decoratedtextfield.dart';
import 'package:login/Component/show_sucess_massage.dart';
import 'package:login/Screen/login.dart';
import 'package:login/Validation/app_validation.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode passwordNode = FocusNode();
  final FocusNode confirmPasswordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.surface,
      appBar: CustomAppBar(title: "Create New Password"),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 70.0,
                        backgroundColor: AppColor.primaryLight,
                        child: SvgPicture.asset(
                          "assets/icons/unlock.svg",
                          height: 70,
                          width: 70,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        "Create Password",
                        style: TextStyle( 
                          color: AppColor.background,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Your new Password must be different\n     from previously used password.",
                        style: TextStyle(
                          color: AppColor.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 15),
                      DecoratedTextField(
                        controller: passwordController,
                        inputType: TextInputType.visiblePassword,
                        hintText: "*********",
                        aboveText: "Password",
                        focusNode: passwordNode,
                        nextFocusNode: confirmPasswordNode,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColor.primary,
                          size: 19,
                        ),
                        validator: (v) => AppValidation.strongPassword(v),
                      ),
                      const SizedBox(height: 18),
                      DecoratedTextField(
                        controller: confirmPasswordController,
                        inputType: TextInputType.visiblePassword,
                        hintText: "*********",
                        aboveText: "Confirm Password",
                        focusNode: confirmPasswordNode,
                        nextFocusNode: confirmPasswordNode,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColor.primary,
                          size: 19,
                        ),
                        validator: (v) => AppValidation.matchPassword(passwordController.text, v),
                      ),
                      const SizedBox(height: 22),
                      // TextButton(
                      //   style: TextButton.styleFrom(
                      //     foregroundColor: AppColor.primaryLight,
                      //   ),
                      //   onPressed: () {},
                      //   child: Text(
                      //     'Change Password',
                      //     style: TextStyle(
                  
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 13,
                      //       decoration: TextDecoration.underline,
                      //       decorationColor: AppColor.primaryLight,
                      //       decorationThickness: 2,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 22),
                      BasicPrimaryButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ShowSucessMassage.showSuccessSnackBar(context, "Password Changed");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Login()),
                            );
                          }
                        },
                        title: "Save",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
