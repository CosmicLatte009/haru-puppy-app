import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haru_puppy_app/util/app_page_routes.dart';
import '../widget/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = '/welcome';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomButton(
            text: '내 프로필 작성하기',
            onPressed: () => Get.toNamed(AppPagesRoutes.userProfile),
          ),
        ],
      ),
    );
  }
}
