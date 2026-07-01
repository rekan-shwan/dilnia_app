import 'package:insurance_app/added/snack_bar_widget.dart';
import 'package:insurance_app/core/app_export.dart';

import '../models/mypolicies_item_model.dart';
import 'package:http/http.dart' as http;

/// A controller class for the PoliciesPage.
///
/// This class manages the state of the PoliciesPage, including the
/// current policiesModelObj
class PoliciesController extends GetxController {
  RxList<InsuranceData> dataList = <InsuranceData>[].obs;

  var isLoading = false.obs;
  // Local storage
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    insuranceList();
  }

  Future<void> insuranceList() async {
    debugPrint("*************** insuranceList  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request('GET', Uri.parse('$baseUrl/insurance/index'));
      print("${request.url}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        debugPrint("Insurance str = $str");

        InsuranceListModel listModel = InsuranceListModel.fromJson(str);
        dataList.assignAll(listModel.data ?? []);
        print("dataList = ${dataList.toString()}");
        dataList.refresh();
        update();
        isLoading.value = false;
        debugPrint("InsuranceDataList == ${dataList.toString()}");
        // Get.snackbar(
        //   'Success',
        //   'Get Insurance List Successful',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      } else {
        // Get.snackbar(
        //   'Error',
        //   'Failed to get Insurance List. Please try again later.',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(Get.context!,
            'Failed to get Insurance List. Please try again later.');
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
