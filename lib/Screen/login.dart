import 'package:flutter/material.dart';
import 'package:login/Component/app_color.dart';
import 'package:login/Component/auth_toggle.dart';
import 'package:login/Component/button_back.dart';
import 'package:login/Component/custombutton.dart';
import 'package:login/Component/custome_textstyle.dart';
import 'package:login/Component/show_sucess_massage.dart';
import 'package:login/Component/social_icon.dart';
import 'package:login/Screen/forgect_password.dart';
import 'package:login/Screen/register.dart';
import 'package:login/Validation/app_validation.dart';

import '../Component/decoratedtextfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode emailAddressNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  bool isChecked = false;
  int currentIndex = 0;

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailTextController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    ButtonBack(onPressed: () {}),

                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Go ahead and set up\n your account",
                        style: AppTextStyles.header,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Sign in-up to enjoy the best managing exprerience',
                        style: TextStyle(
                          color: AppColor.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Column(
                      children: [
                        //TOGGLE
                        AuthToggle(
                          selectedIndex: currentIndex,
                          onToggle: (index) {
                            if (index == 1) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const Register(),
                                ),
                              );
                            }
                          },
                        ),

                        const SizedBox(height: 20),
                        DecoratedTextField(
                          controller: emailTextController,
                          inputType: TextInputType.emailAddress,
                          hintText: "you@example.com",
                          aboveText: "Email Address",
                          focusNode: emailAddressNode,
                          nextFocusNode: passwordNode,
                          validator: (v) => AppValidation.email(v),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: AppColor.primary,
                            size: 19,
                          ),
                        ),
                        const SizedBox(height: 20),
                        DecoratedTextField(
                          controller: passwordController,
                          inputType: TextInputType.visiblePassword,
                          hintText: "****",
                          aboveText: "Password",
                          focusNode: passwordNode,
                          nextFocusNode: null,
                          validator: (v) => AppValidation.strongPassword(v),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColor.primary,
                            size: 19,
                          ),
                        ),

                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: AppColor.primaryLight,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: AppColor.background,
                                fontSize: 12,
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: AppColor.primaryLight,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ForgectPassword(),
                                  ),
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: AppColor.primaryLight,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        BasicPrimaryButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                             
                           ShowSucessMassage.showSuccessSnackBar(context, "Login");
  

                            }
                          },
                          title: "Login",
                        ),

                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(color: AppColor.textSecondary),
                              ),

                              Text(
                                'Or login with',
                                style: TextStyle(color: AppColor.primary),
                              ),

                              Expanded(
                                child: Divider(color: AppColor.textSecondary),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),

                        Row(
                          children: [
                            SocialIcon(
                              text: "Google",
                              iconpath: "assets/icons/google-original.png",
                              onTap: () {},
                              size: 20,
                            ),

                            const SizedBox(width: 20),

                            SocialIcon(
                              text: "Facebook",
                              iconpath: "assets/icons/facebook.png",
                              onTap: () {},
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
