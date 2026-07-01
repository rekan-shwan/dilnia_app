import 'package:flutter/material.dart';
import 'package:insurance_app/added/snack_bar_widget.dart';

/// A controller class for the FeedbackScreen.
import 'package:insurance_app/core/app_export.dart';

import '../../../data/models/api_success_model.dart';
import '../models/ticket_list_model.dart';
import 'package:http/http.dart' as http;

///
/// This class manages the state of the FeedbackScreen, including the
/// current feedbackModelObj
class TicketListController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  Rx<TicketListModel> feedbackModelObj = TicketListModel().obs;

  RxList<TicketData> ticketDataList = <TicketData>[].obs;
  var isLoading = false.obs;
  // Local storage
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    ticketList();
  }

  Future<void> ticketList() async {
    debugPrint("*************** ticketList  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request('GET', Uri.parse('$baseUrl/ticket/user/list'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        debugPrint("Ticket str = $str");
        TicketListModel listModel = TicketListModel.fromJson(str);
        ticketDataList.assignAll(listModel.data ?? []);
        ticketDataList.refresh();
        update();
        isLoading.value = false;
        debugPrint("ticketDataList == ${ticketDataList.toString()}");
        // Get.snackbar(
        //   'Success',
        //   'Get Ticket List Successful',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget()
            .showSnackBar(Get.context!, 'Get Ticket List Successful');
      } else {
        // Get.snackbar(
        //   'Error',
        //   'Failed to get Ticket List. Please try again later.',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(
            Get.context!, 'Failed to get Ticket List. Please try again later.');
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

  Future<void> ticketCreate() async {
    debugPrint("*************** Ticket Create  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/ticket'));
      request.fields.addAll({
        'title': titleController.text,
        'description': detailsController.text
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      final res = ApiSuccessResponseModel.fromJson(str);
      if (response.statusCode == 201) {
        debugPrint("Ticket Create str = $str");
        ticketList();
        // Get.snackbar(
        //   'Success',
        //   res.message ?? 'Ticket Create Successfully',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(
            Get.context!, res.message ?? 'Ticket Create Successfully');
      } else {
        // Get.snackbar(
        //   'Error',
        //   res.message ?? 'Failed to Save. Please try again later.',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(Get.context!,
            res.message ?? 'Failed to Save. Please try again later.');
      }
    } catch (e) {
      // Get.snackbar(
      //   'Error',
      //       'Something went wrong: $e',
      //  snackPosition: SnackPosition.BOTTOM,
      //);
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      titleController.clear();
      detailsController.clear();

      isLoading.value = false;
    }
  }
}
