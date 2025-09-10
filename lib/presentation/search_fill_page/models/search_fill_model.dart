import 'package:get/get.dart';import 'search_fill_item_model.dart';/// This class defines the variables used in the [search_fill_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchFillModel {Rx<List<SearchFillItemModel>> searchFillItemList = Rx(List.generate(6,(index) => SearchFillItemModel()));

 }
