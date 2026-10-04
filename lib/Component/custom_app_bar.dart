import 'package:flutter/material.dart';
import 'package:login/Component/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  // ignore: use_super_parameters
  const CustomAppBar({Key? key, required this.title, this.actions})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      // automaticallyImplyLeading: true,
      centerTitle: true,
      actions: actions,
      title: Text(
        title,
        style: TextStyle(
          color: AppColor.background,
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
