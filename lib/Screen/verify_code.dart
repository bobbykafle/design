import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login/Component/custom_app_bar.dart';
import 'package:login/Component/custombutton.dart';
import 'package:login/Component/show_sucess_massage.dart';
import 'package:login/Screen/create_new_password.dart';
import 'package:login/Validation/app_validation.dart';
import 'package:pinput/pinput.dart';
import 'package:login/Component/app_color.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.surface,
      appBar: CustomAppBar(title: "Verify"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Container(
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundColor: AppColor.primaryLight,
                      child: SvgPicture.asset(
                        "assets/icons/email-snow.svg",
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const SizedBox(height: 60),
                    Text(
                      "Enter your code",
                      style: TextStyle(
                        color: AppColor.background,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Please enter the 5 digit code sent to you Email",
                      style: TextStyle(
                        color: AppColor.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _pinInput(),

                    const SizedBox(height: 20),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColor.primaryLight,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Resend Code',
                          style: TextStyle(
                            color: AppColor.primaryLight,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.primaryLight,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    BasicPrimaryButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                         ShowSucessMassage.showSuccessSnackBar(context, "Verified OTP");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CreateNewPassword(),
                            ),
                          );
                        }
                      },
                      title: "Verify",
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

  Column _pinInput() {
    final defultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(fontSize: 15, color: AppColor.background),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.textSecondary),
      ),
    );
    return Column(
      children: [
        Pinput(
          length: 5,
          controller: otpController,
          keyboardType: TextInputType.number,

          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: (v) => AppValidation.otp(v),
          focusedPinTheme: defultPinTheme.copyWith(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.primary, width: 2),
            ),
          ),
          errorPinTheme: defultPinTheme.copyWith(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.error, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
