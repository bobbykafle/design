import 'package:flutter/material.dart';
import 'package:login/Component/app_color.dart';

class SocialIcon extends StatelessWidget {
  final String text;
  final String iconpath;
  final num size;
  final VoidCallback onTap;
  const SocialIcon({
    super.key,
    required this.text,
    required this.iconpath,
    required this.onTap,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,

          decoration: BoxDecoration(
            color: AppColor.surface,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColor.disable),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconpath, height: 22),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.background,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
