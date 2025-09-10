import 'package:insurance_app/core/app_export.dart';

import 'blog_item_model.dart';

/// This class defines the variables used in the [blog_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BlogModel {
  // Rx<List<BlogItemModel>> blogItemList =
  //     Rx(List.generate(7, (index) => BlogItemModel()));

  static List<BlogItemModel> blogItemList(){
   return [
    BlogItemModel(ImageConstant.imgBlog1st,"What is insurance and grand man..","Insurance policies can cover up medi, vehicle lossing man..","12 October"),
    BlogItemModel(ImageConstant.imgBlog2nd,"What does home insurance include?","Homeowners insurance policies generally cover destruction and residence.","23 November"),
    BlogItemModel(ImageConstant.imgBlog3rd,"What is the difference..","Basically they both refer to where something someone is between.","16 October"),
    BlogItemModel(ImageConstant.imgBlog4th,"Why is insurance needed?","Insurance plans are beneficial to anyone looking to protect their family..","16 January"),
    BlogItemModel(ImageConstant.imgBlog5th,"Why insurance is better?","Death is the ultimate truth of life, and it is inevitable. Thus, the least you can do to..","21 June"),
    BlogItemModel(ImageConstant.imgBlog6th,"What are the 5 main insurance?","Home or property insurance, life insurance, disability insurance automobile.","12 October"),
    BlogItemModel(ImageConstant.imgBlog7th,"What is insurance and its principles?","Basically they both refer to where something someone is between.","12 October"),
   ];
  }
}
