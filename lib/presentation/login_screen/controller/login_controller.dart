import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

/// A controller class for the LoginScreen.
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/main.dart';
import 'package:insurance_app/presentation/login_screen/models/login_model.dart';

import '../../my_profile_screen/models/my_profile_model.dart';

///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = true.obs;
  // Local storage
  final storage = GetStorage();
  var isLoading = false.obs;

  // Future<void> login() async {
  //   debugPrint("*************** login  ***********");
  //   final email = emailController.text.trim();
  //   final password = passwordController.text.trim();

  //   if (email.isEmpty || password.isEmpty) {
  //     Get.snackbar(
  //       'Error',
  //       'Email and Password cannot be empty',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     return;
  //   }

  //   isLoading.value = true;

  //   try {
  //     var headers = {
  //       accept: acceptValue,
  //     };

  //     var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/login'));
  //     final fcmToken = storage.read('fcm');
  //     request.fields.addAll({
  //       'email': email ?? "",
  //       'password': password ?? "",
  //       'fcm_token': fcmToken
  //     });
  //     request.headers.addAll(headers);
  //     http.StreamedResponse response = await request.send();

  //     var str = await response.stream.bytesToString();
  //     print("url = ${request.url}");
  //     debugPrint("str = $str");
  //     if (response.statusCode == 200) {
  //       LoginModel userData = LoginModel.fromJson(str);
  //       if (userData.data?.accessToken != null) {
  //         // Save token to local storage
  //         storage.write('token', userData.data?.accessToken);
  //         debugPrint("TOKEN = ${userData.data?.accessToken}");
  //         storage.write('user', userData.data?.userInfo?.name ?? 'Login User');
  //         storage.write(
  //             'user_email', userData.data?.userInfo?.email ?? 'user@gmail.com');
  //         storage.write('user_image', userData.data?.userInfo?.imagePath ?? '');
  //         storage.write(
  //             'user_phone', userData.data?.userInfo?.phone ?? '0XXXXXXXXX');
  //         debugPrint("TOKEN = ${userData.data?.userInfo?.name}");
  //         Get.snackbar(
  //           'Success',
  //           'Login Successful',
  //           snackPosition: SnackPosition.BOTTOM,
  //         );
  //         // Navigate to the home screen
  //         Get.toNamed(
  //           AppRoutes.homeScreenContainer1Screen,
  //         );
  //       } else {
  //         Get.snackbar(
  //           'Error',
  //           'Invalid credentials',
  //           snackPosition: SnackPosition.BOTTOM,
  //         );
  //       }
  //     } else if (response.statusCode == 402) {
  //       final user = MyProfileModel.fromJson(str);
  //       Get.toNamed(AppRoutes.otpVerificationScreen,
  //           arguments: [user.data!.email, user.data!.phone, 'registration']);
  //       Get.snackbar(
  //         'Error',
  //         user.message ?? 'Not Verified',
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     } else {
  //       Get.snackbar(
  //         'Error',
  //         'Failed to login. Please try again later.',
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Something went wrong: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> login() async {
    debugPrint("*************** login  ***********");

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Get.snackbar(
      //   'Error',
      //   'Email and Password cannot be empty',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      wrongPassword(Get.context!, 'Email and Password cannot be empty');
      return;
    }

    isLoading.value = true;

    try {
      var headers = {
        accept: acceptValue,
      };

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/login'),
      );

      final fcmToken = storage.read('fcm');

      request.fields.addAll({
        'email': '$email',
        'password': '$password',
        'fcm_token': fcmToken ?? '',
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();

      debugPrint("url = ${request.url}");
      debugPrint("str = $str");

      if (response.statusCode == 200) {
        LoginModel userData = LoginModel.fromJson(str);

        if (userData.data?.accessToken != null) {
          storage.write('token', userData.data?.accessToken);
          storage.write('user', userData.data?.userInfo?.name ?? 'Login User');
          storage.write(
              'user_email', userData.data?.userInfo?.email ?? 'user@gmail.com');
          storage.write('user_image', userData.data?.userInfo?.imagePath ?? '');
          storage.write(
              'user_phone', userData.data?.userInfo?.phone ?? '0XXXXXXXXX');

          // ✅ FIRST NAVIGATE
          Get.offAllNamed(AppRoutes.homeScreenContainer1Screen);

          // ✅ THEN SHOW SNACKBAR SAFE
          wrongPassword(Get.context!, 'Login Successful');
          Future.delayed(const Duration(milliseconds: 300), () {
            // Get.snackbar(
            //   'Success',
            //   'Login Successful',
            //   snackPosition: SnackPosition.BOTTOM,
            // );
          });
        } else {
          wrongPassword(Get.context!, 'Invalid credentials');
          //   Future.delayed(Duration.zero, () {
          //     Get.snackbar(
          //       'Error',
          //       'Invalid credentials',
          //       snackPosition: SnackPosition.BOTTOM,
          //     );
          //   });
        }
      } else if (response.statusCode == 402) {
        final user = MyProfileModel.fromJson(str);

        // ✅ FIRST NAVIGATE
        Get.toNamed(
          AppRoutes.otpVerificationScreen,
          arguments: [user.data!.email, user.data!.phone, 'registration'],
        );

        // ✅ THEN SNACKBAR
        // Future.delayed(const Duration(milliseconds: 300), () {
        //   Get.snackbar(
        //     'Error',
        //     user.message ?? 'Not Verified',
        //     snackPosition: SnackPosition.BOTTOM,
        //   );
        // });

        // Get.snackbar(
        //   'Error',
        //   user.message ?? 'Not Verified',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      } else {
        wrongPassword(Get.context!, 'wrong email or password.');
      }

      // Get.snackbar(
      //   'Error',
      //   'Failed to login. Please try again later.',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    } catch (e) {
      // Future.delayed(Duration.zero, () {
      //   Get.snackbar(
      //     'Error',
      //     'Something went wrong: $e',
      //     snackPosition: SnackPosition.BOTTOM,
      //   );
      // });
      wrongPassword(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    // emailController.dispose();
    // passwordController.dispose();
  }

  void wrongPassword(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
