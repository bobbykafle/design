import 'package:flutter/material.dart';
import 'package:login/Component/app_color.dart';
/*class ShowSucessMassage extends StatelessWidget {
  final String message;
  
  const ShowSucessMassage({super.key, required this.message,});


  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, color: AppColor.surface),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
             message,
              style: TextStyle(
                color: AppColor.surface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
  
   
        ],
      ),
         
      backgroundColor: Colors.transparent,
      elevation: 3,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
    );
  }
}*/
class ShowSucessMassage {
  
static void showSuccessSnackBar(
  BuildContext context,String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, color: AppColor.surface),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: AppColor.surface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.primaryLight,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(16),
      duration: Duration(seconds: 2),
    ),
  );
}
}

