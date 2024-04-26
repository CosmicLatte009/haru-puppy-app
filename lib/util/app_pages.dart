import 'package:get/get.dart';
import 'package:haru_puppy_app/controller/image_picker_controller.dart';
import 'package:haru_puppy_app/util/app_page_routes.dart';
import 'package:haru_puppy_app/view/screen/dog_profile.dart';
import 'package:haru_puppy_app/view/screen/home_screen.dart';
import 'package:haru_puppy_app/view/screen/splash_screen.dart';
import 'package:haru_puppy_app/view/screen/user_profile.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppPagesRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppPagesRoutes.userProfile,
      page: () => UserProfileScreen(),
      binding: BindingsBuilder(() {
        Get.put(ImagePickerController());
      }),
    ),
    GetPage(
      name: AppPagesRoutes.dogProfile,
      page: () => DogProfileScreen(),
      binding: BindingsBuilder(() {
        Get.put(ImagePickerController());
      }),
    ),
    GetPage(
      name: AppPagesRoutes.home,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(ImagePickerController());
      }),
    ),
  ];
}
