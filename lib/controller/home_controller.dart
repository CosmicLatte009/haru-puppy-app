import 'package:get/get.dart';
import 'package:haru_puppy_app/model/dog.dart';
import 'image_picker_controller.dart';

class HomeController extends GetxController {
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  final dog = Rx<Dog?>(null);

  @override
  void onClose() {
    super.onClose();
  }
}
