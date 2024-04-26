import 'package:flutter/material.dart';
import 'package:haru_puppy_app/util/app_text_style.dart';
import '../../../util/app_color.dart';

// 사용자 지정 앱 바
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool showLeading;
  final bool showActions;

  const CustomAppBar({
    Key? key,
    required this.text,
    this.showLeading = true,
    this.showActions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Text(
        text,
        style: AppTextStyles.semiBold().copyWith(color: AppColor.black90),
      ),
      centerTitle: true,
      leading: showLeading
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: AppColor.black80),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          : null,
      actions: showActions
          ? [
              Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications_none_sharp,
                      color: AppColor.black80,
                    ),
                    onPressed: () => print('클릭시 토글되어서 알림 상태전환'),
                  ))
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48); // 앱 바의 높이 설정
}
