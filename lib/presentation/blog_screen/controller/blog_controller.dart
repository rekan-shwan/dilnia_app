import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/blog_screen/models/blog_model.dart';

import '../models/blog_item_model.dart';

/// A controller class for the BlogScreen.
///
/// This class manages the state of the BlogScreen, including the
/// current blogModelObj
class BlogController extends GetxController {
 List<BlogItemModel> blogData =  BlogModel.blogItemList();
}
