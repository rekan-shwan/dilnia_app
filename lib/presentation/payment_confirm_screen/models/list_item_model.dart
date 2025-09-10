import 'package:get/get.dart';/// This class is used in the [list_item_widget] screen.
class ListItemModel {Rx<String> factTxt = Rx("It is a long established fact that a reader.");

Rx<String> timeTxt = Rx("2 Min");

Rx<String>? id = Rx("");

String? messege;
String? time;

ListItemModel(this.messege,this.time);
}
