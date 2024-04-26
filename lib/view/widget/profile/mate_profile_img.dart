import 'dart:math';

import 'package:flutter/material.dart';
import 'package:haru_puppy_app/util/app_color.dart';
import 'package:haru_puppy_app/util/app_text_style.dart';

class MateProfileImg extends StatelessWidget {
  MateProfileImg({
    super.key,
    required this.nickName,
    required this.role,
  });

  final String nickName;
  final String role;
  final Color randomColor = getRandomColor();

  static Color getRandomColor() {
    Random random = Random(); // Random 객체 생성
    // 랜덤 색상 생성: 0에서 255 사이의 랜덤 값을 RGB 색상으로 변환
    return Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      0.25, // Alpha 값
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: randomColor,
        ),
        SizedBox(height: 8),
        Text(
          nickName,
          style: AppTextStyles.regular().copyWith(color: AppColor.black90),
        ),
        Text(
          role,
          style: AppTextStyles.regular()
              .copyWith(fontSize: 12, color: AppColor.black80),
        ),
      ],
    );
  }
}
