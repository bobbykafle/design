import 'package:flutter/material.dart';
import 'package:login/Component/app_color.dart';
import 'package:login/Component/auth_toggle.dart';
import 'package:login/Component/button_back.dart';
import 'package:login/Component/custombutton.dart';
import 'package:login/Component/custome_textstyle.dart';
import 'package:login/Component/decoratedtextfield.dart';
import 'package:login/Component/show_sucess_massage.dart';
import 'package:login/Screen/login.dart';
import 'package:login/Validation/app_validation.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode userNamNode = FocusNode();
  final FocusNode emailAddressNode = FocusNode();
  final FocusNode phoneNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode confirmPasswordNode = FocusNode();
  int currentIndex = 1;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    emailTextController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      ButtonBack(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Login()),
                          );
                        },
                      ),

                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Let's Create\n your new account",
                          style: AppTextStyles.header,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Create an account to begin your journey with us',
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
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
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
                          //Toggle
                          AuthToggle(
                            selectedIndex: currentIndex,
                            onToggle: (index) {
                              if (index == 0) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const Login(),
                                  ),
                                );
                              }
                            },
                          ),

                          const SizedBox(height: 20),
                          DecoratedTextField(
                            controller: userNameController,
                            inputType: TextInputType.name,
                            hintText: "Joe Doe",
                            aboveText: "Full Name",
                            focusNode: userNamNode,
                            nextFocusNode: emailAddressNode,
                            prefixIcon: Icon(
                              Icons.person_2,
                              color: AppColor.primary,
                              size: 19,
                            ),
                            validator: (v) =>
                                AppValidation.empty(v, 'userName'),
                          ),
                          const SizedBox(height: 20),
                          DecoratedTextField(
                            controller: emailTextController,
                            inputType: TextInputType.emailAddress,
                            hintText: "you@example.com",
                            aboveText: "Email",
                            focusNode: emailAddressNode,
                            nextFocusNode: phoneNode,
                            prefixIcon: Icon(
                              Icons.mail_outline_rounded,
                              color: AppColor.primary,
                              size: 19,
                            ),
                            validator: (v) => AppValidation.email(v),
                          ),
                          const SizedBox(height: 20),
                          DecoratedTextField(
                            controller: phoneController,
                            inputType: TextInputType.number,
                            hintText: "+977 984",
                            aboveText: "Phone no.",
                            focusNode: phoneNode,
                            nextFocusNode: passwordNode,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: AppColor.primary,
                              size: 19,
                            ),
                            validator: (v) => AppValidation.phoneNumber(v),
                          ),
                          const SizedBox(height: 20),
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
                          const SizedBox(height: 20),
                          DecoratedTextField(
                            controller: confirmPasswordController,
                            inputType: TextInputType.visiblePassword,
                            hintText: "*********",
                            aboveText: "Confirm Password",
                            focusNode: confirmPasswordNode,
                            nextFocusNode: null,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColor.primary,
                              size: 19,
                            ),
                            validator: (v) => AppValidation.matchPassword(
                              passwordController.text,
                              v,
                            ),
                          ),
                          const SizedBox(height: 20),
                          BasicPrimaryButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                              ShowSucessMassage.showSuccessSnackBar(context, 'Register Successful.');
                                
                              }
                            },

                            title: "Register",
                          ),

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
                                  'Alredy have an account? Move to Login',
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontSize: 13,
                                  ),
                                ),

                                Expanded(
                                  child: Divider(color: AppColor.textSecondary),
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
