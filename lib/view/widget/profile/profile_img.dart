import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:get/get.dart';
import '../../../controller/image_picker_controller.dart';

enum ProfileType {
  user,
  dog,
}

class ProfileImg extends StatelessWidget {
  const ProfileImg({
    Key? key,
    required this.imagePickerController,
    required this.profileType,
  }) : super(key: key);

  final ImagePickerController imagePickerController;
  final ProfileType profileType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => imagePickerController.pickImage(),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          Obx(() => imagePickerController.selectedImagePath.value.isNotEmpty
              ? ClipOval(
                  child: Image.file(
                    File(imagePickerController.selectedImagePath.value),
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                )
              : profileType == ProfileType.user
                  ? SvgPicture.asset('assets/svgs/user_profile.svg')
                  : SvgPicture.asset('assets/svgs/dog_profile.svg')),
          Positioned(
            top: 10,
            right: -9,
            child: SvgPicture.asset('assets/svgs/editable.svg'),
          ),
        ],
      ),
    );
  }
}
