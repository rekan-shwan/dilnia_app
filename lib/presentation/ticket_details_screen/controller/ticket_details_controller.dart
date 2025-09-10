import 'package:flutter/material.dart';

/// A controller class for the FeedbackScreen.
import 'package:insurance_app/core/app_export.dart';

import '../../../data/models/api_success_model.dart';
import '../models/ticket_details_model.dart';
import 'package:http/http.dart' as http;

///
/// This class manages the state of the FeedbackScreen, including the
/// current feedbackModelObj
class TicketDetailsController extends GetxController {
  TextEditingController detailsController = TextEditingController();

  Rx<TicketDetailsModel> ticketDetailsObj = TicketDetailsModel().obs;
  dynamic theDataFromPreviousPage = Get.arguments;
  var isLoading = false.obs;
  // Local storage
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    ticketDetails();
    // Load data when the controller is initialized
  }

  Future<void> ticketDetails() async {
    debugPrint("*************** ticketDetails  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request(
          'GET', Uri.parse('$baseUrl/ticket/${theDataFromPreviousPage.id}'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        debugPrint("Ticket str = $str");
        TicketDetailsModel listModel = TicketDetailsModel.fromJson(str);
        ticketDetailsObj.value = listModel;
        update();
        isLoading.value = false;
        debugPrint("ticketData == ${listModel.toString()}");
        // Get.snackbar(
        //   'Success',
        //   'Get Ticket Details Successful',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      } else {
        Get.snackbar(
          'Error',
          'Failed to get Ticket Details. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> ticketReplyCreate() async {
    debugPrint("*************** Ticket Reply Create  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/ticket-reply'));
      request.fields.addAll({
        'title': theDataFromPreviousPage.title.toString(),
        'description': detailsController.text,
        'ticket_id': theDataFromPreviousPage.id.toString()
      });

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();
      final res = ApiSuccessResponseModel.fromJson(str);
      if (response.statusCode == 201) {
        debugPrint("Ticket Reply str = $str");
        ticketDetails();
        Get.snackbar(
          'Success',
          res.message ?? 'Ticket Reply Successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          res.message ?? 'Failed to Reply. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      detailsController.clear();
      isLoading.value = false;
    }
  }
}
