import 'package:flutter/material.dart';
import 'package:login/Component/app_color.dart';

class ButtonBack extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? iconColor;
  final Alignment alignment;
  
  const ButtonBack({
    super.key,
    required this.onPressed,
    this.iconColor,
    this.alignment = Alignment.topLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back_rounded,
          color: iconColor ?? AppColor.surface,
        ),
      ),
    );
  }
}
