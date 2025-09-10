import 'package:insurance_app/core/app_export.dart';import 'package:insurance_app/presentation/search_fill_page/models/search_fill_model.dart';import 'package:flutter/material.dart';/// A controller class for the SearchFillPage.
///
/// This class manages the state of the SearchFillPage, including the
/// current searchFillModelObj
class SearchFillController extends GetxController {SearchFillController(this.searchFillModelObj);

TextEditingController group34424Controller = TextEditingController();

Rx<SearchFillModel> searchFillModelObj;

@override void onClose() { super.onClose(); group34424Controller.dispose(); } 
 }
