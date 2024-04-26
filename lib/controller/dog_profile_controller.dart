import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haru_puppy_app/model/dog.dart';
import 'image_picker_controller.dart';

class DogProfileController extends GetxController {
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  final dog = Rx<Dog?>(null);
  final nameController = TextEditingController();
  final weightController = TextEditingController();
  var selectedRole = ''.obs;

  void updateDogInfo({
    required String name,
    required String gender,
    DateTime? birth,
    double? weight,
    String? profileUrl,
  }) {
    // Dog 객체를 생성하여 사용자 정보를 업데이트
    Dog newDog = Dog(
      name: name,
      gender: gender,
      birth: birth,
      weight: weight,
      profileUrl: profileUrl,
    );

    // Rx<User?> 타입의 dog 상태 업데이트
    dog.value = newDog;

    // 정보 업데이트 후 사용자에게 알림
    Get.snackbar(
      "프로필 업데이트 완료",
      "성공적으로 프로필이 업데이트되었습니다.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    weightController.dispose();
    super.onClose();
  }
}
