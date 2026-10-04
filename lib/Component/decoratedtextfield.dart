// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:login/Component/app_color.dart';
import 'package:login/Component/custome_textstyle.dart';
import 'package:login/Component/validation_error.dart';

mixin DecoratedBorder on Widget {
  OutlineInputBorder buildBorder({Color? color, double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: color != null
          ? BorderSide(color: color, width: width)
          : const BorderSide(),
    );
  }
}

class DecoratedTextField extends StatefulWidget with DecoratedBorder {
  final TextInputType? inputType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? currentValue;
  final String? hintText;
  final String? helperText;
  final int? minLines;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final String? validationError;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Function()? onTap;
  final String? aboveText;
  final FormFieldValidator<String>? validator;
  const DecoratedTextField({
    Key? key,
    this.inputType,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.currentValue,
    this.validationError,
    this.onChanged,
    this.onFieldSubmitted,
    this.hintText,
    this.minLines = 1,
    this.maxLines = 1,
    this.helperText,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.aboveText,
    this.validator,
  }) : super(key: key);
  @override
  State<DecoratedTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<DecoratedTextField> {
  bool get isPasswordField => widget.inputType == TextInputType.visiblePassword;

  bool obscureText = true;
  @override
  void dispose() {
    super.dispose();
  }

  void _fieldFocusChange({
    required BuildContext context,
    required FocusNode focusNode,
    required FocusNode nextFocusNode,
  }) {
    focusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.aboveText != null) ...[
          Text(
            widget.aboveText!,
            style: AppTextStyles.secondary.copyWith(
              color: AppColor.background,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),
        ],
        TextFormField(
          initialValue: widget.currentValue,
          validator: widget.validator,
          controller: widget.controller,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          onFieldSubmitted: (val) {
            if (widget.nextFocusNode != null && widget.focusNode != null) {
              _fieldFocusChange(
                context: context,
                focusNode: widget.focusNode!,
                nextFocusNode: widget.nextFocusNode!,
              );
            }
            if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!(val);
            }
          },
          keyboardType: widget.inputType,
          textCapitalization: widget.textCapitalization,
          obscureText: isPasswordField && obscureText,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          textInputAction: widget.nextFocusNode != null
              ? TextInputAction.next
              : widget.textInputAction,
          enabled: widget.enabled,
          style: AppTextStyles.body,
          decoration: InputDecoration(
            hintText: widget.hintText,
            helperText: widget.helperText,
            enabled: widget.enabled,
            prefixIcon: widget.prefixIcon,
            errorMaxLines: 2,
            errorText: widget.validationError,
            suffixIcon: isPasswordField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: AppColor.primaryLight,
                      size: 16,
                    ),
                  )
                : widget.suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: widget.buildBorder(color: AppColor.background),
            enabledBorder: widget.validationError == ValidationError.empty
                ? widget.buildBorder(color: AppColor.error, width: 2)
                : widget.currentValue != null
                ? widget.currentValue!.isNotEmpty
                      ? widget.buildBorder(color: AppColor.primary, width: 2)
                      : widget.buildBorder(color: AppColor.primaryLight)
                : widget.buildBorder(color: AppColor.textSecondary),
            focusedBorder: widget.buildBorder(
              color: AppColor.primary,
              width: 2,
            ),
            errorBorder: widget.buildBorder(color: AppColor.error, width: 2),
            disabledBorder: widget.validationError == ValidationError.empty
                ? widget.buildBorder(color: AppColor.error, width: 2)
                : widget.buildBorder(color: AppColor.background, width: 1),
            hintStyle: AppTextStyles.secondary.copyWith(
              color: AppColor.textSecondary,
            ),
            helperStyle: AppTextStyles.body.copyWith(
              color: AppColor.background,
            ),
            errorStyle: AppTextStyles.body.copyWith(color: AppColor.error,),
          ),
        ),
      ],
    );
  }
}






// final String? Function(String?)? validator; 
//[The argument type 'String? Function(String)?' can't be assigned to the parameter type 'FormFieldValidator<String>?']