import 'package:get/get.dart';

/// This class is used in the [slidervector_item_widget] screen.

class SlidervectorItemModel {
  Rx<String>? id = Rx("");


  String? image;
  String? title;
  SlidervectorItemModel(this.image,this.title);
}
