import 'dart:ui';

import 'package:get/get.dart';

/// This class is used in the [family_item_widget] screen.

class FamilyItemModel {
  Rx<String> bikeinsuranceTxt = Rx("Bike \ninsurance");

  Rx<String>? id = Rx("");

  String? icon;
  String? title;
  Color? bgColor;
  FamilyItemModel(this.icon,this.title,this.bgColor);
}
