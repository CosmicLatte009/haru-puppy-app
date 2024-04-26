import 'package:flutter/material.dart';
import 'package:haru_puppy_app/view/widget/custom_input.dart';
import 'package:haru_puppy_app/view/widget/navigation/top.dart';
import '../widget/custom_button.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: '알림',
        showActions: false,
        showLeading: false,
      ),
      body: Column(
        children: [
          CustomInput(
            label: '닉네임',
            hintText: '닉네임을 입력해주세요.',
            controller: TextEditingController(),
          ),
          CustomButton(
            text: '저장하기',
            onPressed: () {
              // 버튼 클릭 시 실행될 액션
              print('Custom Button Pressed');
            },
          ),
        ],
      ),
    );
  }
}
