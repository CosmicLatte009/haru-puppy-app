import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:haru_puppy_app/controller/dog_profile_controller.dart';
import 'package:haru_puppy_app/controller/home_controller.dart';
import 'package:haru_puppy_app/controller/user_profile_controller.dart';
import 'package:haru_puppy_app/util/app_color.dart';
import 'package:haru_puppy_app/util/app_pages.dart';
import 'package:haru_puppy_app/util/app_text_style.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'view/screen/home_screen.dart';
import 'view/screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  await Supabase.initialize(
    url: 'https://ieldlwldbnwtoxcbvhfd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImllbGRsd2xkYm53dG94Y2J2aGZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTIyNDA2MTIsImV4cCI6MjAyNzgxNjYxMn0.MR0FwU_2S1BVeJKyEdRcTGFsZ5aKxRF3Xkue0Gc7Juo',
  );

  KakaoSdk.init(
    nativeAppKey: dotenv.get("KAKAO_NATIVE_APP_KEY"),
    javaScriptAppKey: dotenv.get("KAKAO_JAVASCRIPT_APP_KEY"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: AppTextStyles.regular().copyWith(
            color: AppColor.black90,
          ),
        ),
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => UserProfileController());
        Get.lazyPut(() => DogProfileController());
        Get.lazyPut(() => HomeController());
      }),
      getPages: AppPages.pages,
      home: HomeScreen(),
    );
  }
}
