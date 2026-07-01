import 'package:insurance_app/added/snack_bar_widget.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/about_us_screen/models/about_us_model.dart';
import 'package:http/http.dart' as http;

/// A controller class for the AboutUsScreen.
///
/// This class manages the state of the AboutUsScreen, including the
/// current aboutUsModelObj
class AboutUsController extends GetxController {
  Rx<AboutUsModel> aboutUsModelObj = AboutUsModel().obs;

  var isLoading = false.obs;
  // Local storage
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    companyDetails();
  }

  Future<void> companyDetails() async {
    debugPrint("*************** companyDetails  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request =
          http.Request('GET', Uri.parse('$baseUrl/company-info/data/details'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        debugPrint(" About Us str = $str");
        AboutUsModel aboutUsModel = AboutUsModel.fromJson(str);
        aboutUsModelObj.value = aboutUsModel;
        update();
        isLoading.value = false;
        // Get.snackbar(
        //   'Success',
        //   'Get About Us Details Successful',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget()
            .showSnackBar(Get.context!, 'About Us Details Loaded Successfully');
      } else {
        // Get.snackbar(
        //   'Error',
        //   'Failed to get About Us Details. Please try again later.',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(Get.context!,
            'Failed to get About Us Details. Please try again later.');
      }
    } catch (e) {
      // Get.snackbar(
      //   'Error',
      //   'Something went wrong: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
