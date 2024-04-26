import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:haru_puppy_app/util/app_page_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../util/app_text_style.dart';

final supabase = Supabase.instance.client;

class LoginScreen extends StatefulWidget {
  static const String route = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 322),
                child: ElevatedButton(
                    onPressed: () async {
                      Get.toNamed(AppPagesRoutes.userProfile);
                      // await supabase.auth.signInWithOAuth(OAuthProvider.kakao);

                      // supabase.auth.onAuthStateChange.listen((data) {
                      //   final AuthChangeEvent event = data.event;

                      //   if (event == AuthChangeEvent.signedIn) {
                      //     print('오 먼가 카카오로그인 됐다');
                      //     Get.toNamed(AppPagesRoutes.userProfile);
                      //   } else {
                      //     print('아니 안됐다');
                      //   }
                      // });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(44.0),
                        side: BorderSide(
                          color: Color(0xFFF2C94C),
                          width: 1.0,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 10.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/message-circle.svg',
                          width: 24.0,
                          height: 24.0,
                        ),
                        Spacer(flex: 1),
                        Text(
                          '카카오톡 계정으로 로그인',
                          style: AppTextStyles.regular()
                              .copyWith(color: Color(0xFF767676)),
                        ),
                        Spacer(flex: 2),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
