import 'package:get/get.dart';

/// This class is used in the [how_insurance_item_widget] screen.

class HowInsuranceItemModel {
  Rx<String> areyoucaraccideTxt =
      Rx("Are you car accident a road the cross hiway? ");

  Rx<String> areyoucaraccideTxt1 =
      Rx("Be ready with health insurance for your car the cross insurance.");

  Rx<String>? id = Rx("");

  String? image;
  String? title;
  String? subTitle;
  HowInsuranceItemModel(this.image,this.title,this.subTitle);
}
