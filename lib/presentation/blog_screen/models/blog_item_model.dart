import 'package:get/get.dart';

/// This class is used in the [blog_item_widget] screen.

class BlogItemModel {
  Rx<String> whatisthedifferTxt = Rx("What is insurance and grand man..");

  Rx<String> insuranceTxt =
      Rx("Insurance policies can cover up medi, vehicle lossing man..");

  Rx<String> octobercounterTxt = Rx("12 October");

  Rx<String>? id = Rx("");

  String? image;
  String? title;
  String? subTitle;
  String? date;
  BlogItemModel(this.image,this.title,this.subTitle,this.date);
}
