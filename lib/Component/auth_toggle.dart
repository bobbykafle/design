import 'package:flutter/material.dart';
import 'package:login/Component/app_color.dart';

class AuthToggle extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onToggle;
  const AuthToggle({
    super.key,
    required this.selectedIndex,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300, // background behind toggle
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          // Login toggle
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(0),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedIndex == 0
                      ? AppColor.surface
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: selectedIndex == 0
                        ? AppColor.background
                        : AppColor.textSecondary,
                  ),
                ),
              ),
            ),
          ),

          // Register toggle
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(1),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedIndex == 1
                      ? AppColor.surface
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: selectedIndex == 1 ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
