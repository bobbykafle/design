
// ignore_for_file: unused_local_variable

 import 'package:login/Component/validation_error.dart';

class AppValidation {
  static String? empty (String? value, String fieldName){
    if(value == null || value.trim().isEmpty){
    return ValidationError.empty.errorText;
    }
    if(value.trim().length<4){
       return  ValidationError.userName.errorText;
    }
    return null;
    
  }
   static String? email(String? value){
    if(value == null || value.trim().isEmpty){
     return ValidationError.empty.errorText;
    }
   // final pass = value = "";
    final RegExp emailRegex = RegExp(r'^[\w.+-]+@gmail\.com$');;
     if(!emailRegex.hasMatch(value.trim())){
      return ValidationError.email.errorText;
     }
     return null;
   }

   static String? phoneNumber(String? value){
    if(value == null || value.trim().isEmpty){
      return ValidationError.empty.errorText;
    }
    final RegExp phoneRegex = RegExp(r'^(\+977|977)?[9][78]\d{8}$');
    if(!phoneRegex.hasMatch(value.trim())){
      return  ValidationError.phoneNumber.errorText;
    }
    return null;
   }

   static String? strongPassword(String? value){
      
     if (value == null || value.isEmpty) {
      return ValidationError.empty.errorText; // empty
    }
   
    final RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if(!passwordRegex.hasMatch(value.trim())){
     return ValidationError.strongPassword.errorText;
    }
      return null;
   }

   static String? matchPassword (String? pass, String? confirmPass){
    if(pass != confirmPass){
      return ValidationError.matchPassword.errorText;
    }
    return null;
   }
 
   static String? otp(String? value){
    if(value == null || value.trim().isEmpty){
      return ValidationError.empty.errorText;
    }
    if(value.trim().length !=5){
      return ValidationError.otp.errorText; 
    }
    return null;
   }
 }

