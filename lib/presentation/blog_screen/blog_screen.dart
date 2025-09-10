import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../blog_screen/widgets/blog_item_widget.dart';
import 'controller/blog_controller.dart';
import 'models/blog_item_model.dart';




class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  BlogController controller  = Get.put(BlogController());
  @override
  void initState() {
    setSafeAreaColor();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.whiteA700,
              appBar: CustomAppBar(
                height: getVerticalSize(79),
                leadingWidth: getSize(42),
                leading: Padding(
                  padding:getPadding(right: 16),
                  child: AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgArrowleft,
                      // margin: getMargin(left: 16, top: 29, bottom: 26),

                      onTap: () {
                        Get.back();
                      }),
                ),
                centerTitle: false,
                title: AppbarTitle(text: "lbl_blog".tr),),
              body: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 20, right: 20),
                  decoration: AppDecoration.white,
                  child: Padding(
                      padding: getPadding(bottom: 16),
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: getVerticalSize(16));
                          },
                          itemCount: controller
                              .blogData.length,
                          itemBuilder: (context, index) {
                            BlogItemModel model = controller
                                .blogData[index];
                            return BlogItemWidget(model, onTapBlog: () {
                              onTapBlog();
                            });
                          }))))),
    );
  }

  onTapBlog() {
    Get.toNamed(AppRoutes.bikeInsurenceScreen);
  }
}




