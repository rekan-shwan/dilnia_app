import 'package:insurance_app/core/app_export.dart';


/// This class defines the variables used in the [home_screen_container_page],
import 'slidervector_item_model.dart';

/// and is typically used to hold data that is passed between different parts of the application.
class HomeScreenContainerModel {
  // Rx<List<SlidervectorItemModel>> slidervectorItemList =
  //     Rx(List.generate(1, (index) => SlidervectorItemModel()));

  // Rx<List<GridmotorbikeonItemModel>> gridmotorbikeonItemList =
  //     Rx(List.generate(6, (index) => GridmotorbikeonItemModel()));


  static List<SlidervectorItemModel> getSliderData(){
   return [
    SlidervectorItemModel(ImageConstant.imgHomeSlider1st,"The life insurance"),
    SlidervectorItemModel(ImageConstant.imgHomeSlider2nd,"The life insurance"),
    SlidervectorItemModel(ImageConstant.imgHomeSlider3rd,"The life insurance"),
   ];
  }
}
