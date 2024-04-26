import 'package:flutter/material.dart';
import 'package:haru_puppy_app/util/app_color.dart';
import '../../util/app_text_style.dart';

enum ButtonSize { large, medium, small }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonSize size;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.size = ButtonSize.large,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width;
    double height;
    TextStyle textStyle;
    double borderRadius;

    switch (size) {
      case ButtonSize.large:
        width = 370;
        height = 56;
        textStyle = AppTextStyles.semiBold().copyWith(color: Colors.white);
        borderRadius = 12;
        break;
      case ButtonSize.medium:
        width = 135;
        height = 32;
        textStyle = AppTextStyles.semiBold()
            .copyWith(fontSize: 16, color: Colors.white);
        borderRadius = 6;
        break;
      case ButtonSize.small:
        width = 84;
        height = 62;
        textStyle = AppTextStyles.semiBold()
            .copyWith(fontSize: 14, color: Colors.white);
        borderRadius = 6;
        break;
    }

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: AppColor.main,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
