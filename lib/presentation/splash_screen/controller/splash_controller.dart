import 'dart:async';

import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/splash_screen/models/splash_model.dart';
import 'package:http/http.dart' as http;

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;
  var isValid = false.obs;
  @override
  void onReady() {
    meDetails();
    _getIsFirst();
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   Get.offNamed(
    //     AppRoutes.onboardingOneScreen,
    //     // AppRoutes.homeScreenContainer1 Screen,
    //   );
    // });
  }

  _getIsFirst() async {
    bool isSignIn = await PrefUtils.getIsSignIn();
    bool isIntro = await PrefUtils.getIsIntro();
    bool isValidToken = await meDetails();
    debugPrint("_getIsFirst 1");
    Timer(const Duration(seconds: 3), () {
      debugPrint("_getIsFirst 2");
      if (isIntro) {
        Get.toNamed(AppRoutes.onboardingOneScreen);
      } else if (isSignIn) {
        debugPrint("_getIsFirst 3");
        Get.toNamed(AppRoutes.loginScreen);
      } else {
        debugPrint("_getIsFirst 4");
        if (isValidToken) {
          debugPrint("_getIsFirst 5");
          Get.toNamed(AppRoutes.homeScreenContainer1Screen);
        } else {
          debugPrint("_getIsFirst 6");
          Get.toNamed(AppRoutes.loginScreen);
        }
      }
    });
  }

  final storage = GetStorage();
  Future<bool> meDetails() async {
    debugPrint("*************** meDetails  ***********");

    final acceptToken = storage.read('token');
    debugPrint("*************** token == $acceptToken  ***********");
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request('GET', Uri.parse('$baseUrl/me'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      debugPrint("token str = $str");
      if (response.statusCode == 200) {
        isValid.value = true;
        debugPrint("_getIsFirst 7");
        // Get.snackbar(
        //   'Success',
        //   'Get Details Successful',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        return true;
      } else {
        isValid.value = false;
        // Get.snackbar(
        //   'Error',
        //   'Failed to get ME. Please try again later.',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        return false;
      }
    } catch (e) {
      // Get.snackbar(
      //   'Error',
      //   'Something went wrong: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      return false;
    } finally {
      isValid.value = true;
    }
  }
}
