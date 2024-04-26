import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haru_puppy_app/util/app_color.dart';
import 'package:haru_puppy_app/util/app_page_routes.dart';
import 'package:haru_puppy_app/util/app_text_style.dart';
import '../../controller/user_profile_controller.dart';
import '../widget/custom_button.dart';
import '../widget/custom_input.dart';
import '../widget/navigation/top.dart';
import '../widget/profile/profile_img.dart';

class UserProfileScreen extends GetView<UserProfileController> {
  static const String route = '/profile/user';

  UserProfileScreen({Key? key}) : super(key: key);

  final List<String> dropdownItems = [
    "아빠",
    "엄마",
    "언니/누나",
    "오빠/형",
    "동생",
  ];

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final bottomPadding = bottomInset > 0.0 ? 20.0 : 113.0;

    return Scaffold(
      appBar: CustomAppBar(
        text: '내 프로필',
        showActions: false,
        showLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 52),
              ProfileImg(
                  profileType: ProfileType.user,
                  imagePickerController: controller.imagePickerController),
              SizedBox(height: 67),
              CustomInput(
                label: '닉네임',
                hintText: '닉네임을 입력해주세요.',
                controller: controller.nicknameController,
              ),
              SizedBox(height: 45),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '나는 우리 강아지의...',
                    style: AppTextStyles.regular(),
                  ),
                  SizedBox(height: 14),
                  SizedBox(
                    width: 340,
                    height: 48,
                    child: DropdownButtonHideUnderline(
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColor.black50, width: 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: Obx(() => DropdownButton<String>(
                              value: controller.selectedRole.value.isNotEmpty
                                  ? controller.selectedRole.value
                                  : null,
                              isDense: true,
                              hint: Text(
                                '아빠/엄마/언니,누나/오빠,형/동생',
                                style: AppTextStyles.regular()
                                    .copyWith(color: AppColor.black70),
                              ),
                              icon: Icon(Icons.unfold_more_sharp),
                              onChanged: (String? newValue) {
                                controller.selectedRole.value =
                                    newValue ?? '아빠';
                              },
                              items: dropdownItems
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: AppTextStyles.regular()),
                                );
                              }).toList(),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 140),
              CustomButton(
                text: '저장하기',
                onPressed: () {
                  controller.updateUserInfo(
                    nickname: controller.nicknameController.text,
                    email: null,
                    role: controller.selectedRole.value,
                    profileUrl: controller
                        .imagePickerController.selectedImagePath.value,
                  );

                  // Future.delayed(Duration(seconds: 1), () {
                  //   Get.toNamed(AppPagesRoutes.dogProfile);
                  // });

                  Get.toNamed(AppPagesRoutes.dogProfile);
                },
              ),
              SizedBox(height: bottomPadding),
            ],
          ),
        ),
      ),
    );
  }
}
