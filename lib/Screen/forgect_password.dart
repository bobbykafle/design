import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login/Component/app_color.dart';
import 'package:login/Component/custom_app_bar.dart';
import 'package:login/Component/custombutton.dart';
import 'package:login/Component/decoratedtextfield.dart';
import 'package:login/Screen/verify_code.dart';
import 'package:login/Validation/app_validation.dart';

class ForgectPassword extends StatefulWidget {
  const ForgectPassword({super.key});

  @override
  State<ForgectPassword> createState() => _ForgectPasswordState();
}

class _ForgectPasswordState extends State<ForgectPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final FocusNode emailAddressNode = FocusNode();

  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.surface,
      appBar: CustomAppBar(title: "Forgot Password"),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundColor: AppColor.primaryLight,
                      child: SvgPicture.asset(
                        "assets/icons/lock.svg",
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const SizedBox(height: 60),
                    Text(
                      "Enter your Email Address",
                      style: TextStyle(
                        color: AppColor.background,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Enter your email address to receive a reset OTP\n            and regain access to your account.",
                      style: TextStyle(
                        color: AppColor.textSecondary,
                        fontSize: 13,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DecoratedTextField(
                        controller: emailTextController,
                        inputType: TextInputType.emailAddress,
                        hintText: "you@gmail.com",
                        aboveText: "Email Address",
                        focusNode: emailAddressNode,
                        nextFocusNode: emailAddressNode,
                        prefixIcon: Icon(
                          Icons.mail,
                          color: AppColor.primaryLight,
                          size: 19,
                        ),
                        validator: (v) => AppValidation.email(v),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // TextButton(
                    //   style: TextButton.styleFrom(
                    //     foregroundColor: AppColor.primaryLight,
                    //   ),
                    // //   onPressed: () {},
                    //   child: Text(
                    //     'Try another way',
                    //     style: TextStyle(
                    //       color: AppColor.primaryLight,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 13,
                    //       decoration: TextDecoration.underline,
                    //       decorationColor: AppColor.primaryLight,
                    //       decorationThickness: 2,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 18),
                    BasicPrimaryButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => VerifyCode()),
                          );
                        }
                      },
                      title: "Continue",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
