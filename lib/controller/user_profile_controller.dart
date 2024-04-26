import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/user.dart';
import 'image_picker_controller.dart';

class UserProfileController extends GetxController {
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  final user = Rx<User?>(null);
  final nicknameController = TextEditingController();
  var selectedRole = ''.obs;

  void updateUserInfo({
    required String nickname,
    String? email,
    required String role,
    String? profileUrl,
  }) {
    // User 객체를 생성하여 사용자 정보를 업데이트
    User newUser = User(
      nickname: nickname,
      email: email,
      role: role,
      profileUrl: profileUrl,
    );

    // Rx<User?> 타입의 user 상태 업데이트
    user.value = newUser;

    // 정보 업데이트 후 사용자에게 알림
    Get.snackbar(
      "프로필 업데이트 완료",
      "성공적으로 프로필이 업데이트되었습니다.",
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  void onClose() {
    nicknameController.dispose();
    super.onClose();
  }
}
