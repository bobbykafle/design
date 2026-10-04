// ignore: unused_import
import 'package:flutter/material.dart';

enum ValidationError {
  empty,
  invalid,
  userName,
  email,
  phoneNumber,
  strongPassword,
  matchPassword,
  otp
}

extension ValidationErrorExt on ValidationError {
  String get errorText {
    switch (this) {
      case ValidationError.empty:
        return 'Field cannot be empty';
      case ValidationError.invalid:
        return 'Invalid massage';
      case ValidationError.userName:
        return 'Name is too short';  
      case ValidationError.email:
        return 'Invalid email address';
      case ValidationError.phoneNumber:
        return 'Invalid number';
      case ValidationError.strongPassword:
        return 'Password must include [A-z][a-z]0-9!@#\$&*~';
      case ValidationError.matchPassword:
        return 'Password do not match';
      case ValidationError.otp:
       return 'OTP must be 5 digits';
    }
  }
}
