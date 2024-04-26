import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haru_puppy_app/util/app_page_routes.dart';
import '../../controller/dog_profile_controller.dart';
import '../widget/custom_button.dart';
import '../widget/custom_input.dart';
import '../widget/navigation/top.dart';
import '../widget/profile/profile_img.dart';

class DogProfileScreen extends GetView<DogProfileController> {
  static const String route = '/profile/dog';

  const DogProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final bottomPadding = bottomInset > 0.0 ? 20.0 : 113.0;

    return Scaffold(
      appBar: CustomAppBar(
        text: '강아지 프로필',
        showActions: false,
        showLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 52),
              ProfileImg(
                  profileType: ProfileType.dog,
                  imagePickerController: controller.imagePickerController),
              SizedBox(height: 67),
              CustomInput(
                label: '강아지 이름',
                hintText: '강아지 이름을 입력해주세요.',
                controller: controller.nameController,
              ),
              SizedBox(height: 45),
              CustomInput(
                label: '체중(kg)',
                hintText: '체중을 소수점 둘째짜리까지 입력해주세요.',
                controller: controller.weightController,
              ),
              SizedBox(height: 140),
              CustomButton(
                text: '저장하기',
                onPressed: () {
                  double? weight =
                      double.tryParse(controller.weightController.text);
                  // controller.updateDogInfo(
                  //   name: controller.nameController.text,
                  //   birth: ,
                  //   weight: weight,
                  //   profileUrl: controller
                  //       .imagePickerController.selectedImagePath.value,
                  // );
                  Get.toNamed(AppPagesRoutes.home);
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
