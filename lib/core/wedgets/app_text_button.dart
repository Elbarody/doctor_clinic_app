import 'package:doctor_opportunity/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderReadius;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextStyle textStyle;
  final String text;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textStyle,
    this.backgroundColor,
    this.borderReadius,
    this.buttonWidth,
    this.buttonHeight,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 50.h),
        ),
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? ColorsManager.mainBlue,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderReadius ?? 16),
          ),
        ),
      ),
      child: Text(text, style: textStyle),
    );
  }
}
