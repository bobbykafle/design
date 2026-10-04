import 'package:flutter/material.dart';
import 'package:login/Component/app_color.dart';
import 'package:login/Component/custome_textstyle.dart';

class BasicPrimaryButton extends StatelessWidget {
  const BasicPrimaryButton({super.key, this.onPressed, required this.title});
  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        foregroundColor: onPressed != null
            ? AppColor.primary
            : AppColor.surface,
        minimumSize: const Size.fromHeight(44),
        backgroundColor: onPressed != null
            ? AppColor.primary
            : AppColor.surface,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        textStyle: AppTextStyles.body,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyles.body.copyWith(
          color: onPressed != null ? AppColor.surface : AppColor.textPrimary,
        ),
      ),
    );
  }
}

class BasicSecondaryButton extends StatelessWidget {
  const BasicSecondaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.radius,
  });
  final Function() onPressed;
  final String title;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColor.headertext,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        textStyle: AppTextStyles.header,
        side: BorderSide(color: AppColor.primary, width: 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 14.0),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.header.copyWith(color: AppColor.surface),
      ),
    );
  }
}

class BasicGhostButton extends StatelessWidget {
  const BasicGhostButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isCancel = false,
  });
  final Function() onPressed;
  final String title;
  final bool isCancel;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(44),
        foregroundColor: !isCancel ? AppColor.surface : AppColor.error,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        textStyle: AppTextStyles.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.secondary.copyWith(color: AppColor.primary),
      ),
    );
  }
}
