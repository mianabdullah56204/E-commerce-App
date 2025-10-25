import 'package:flutter/material.dart';
import 'package:ecommerce_app/theme/app_color.dart';

class IconBox extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback? onTap;
  final Color color;

  const IconBox({
    super.key,
    required this.icon,
    required this.color,
    this.size = 45,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 30,
              offset: Offset(2, 2),
              spreadRadius: 30,
            ),
          ],
        ),
        child: Icon(icon, color: color),
      ),
    );
  }
}
