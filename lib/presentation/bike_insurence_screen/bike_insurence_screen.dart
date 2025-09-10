import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import 'controller/bike_insurence_controller.dart';




class BikeInsurenceScreen extends StatefulWidget {
  const BikeInsurenceScreen({super.key});

  @override
  State<BikeInsurenceScreen> createState() => _BikeInsurenceScreenState();
}

class _BikeInsurenceScreenState extends State<BikeInsurenceScreen> {
 BikeInsurenceController controler = Get.put(BikeInsurenceController());
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
   child: ColorfulSafeArea(
     color: appTheme.whiteA700,
       child: Scaffold(
           backgroundColor: appTheme.whiteA700,
           appBar:
           CustomAppBar(
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
            title: AppbarTitle(text: "lbl_blog_detail".tr),),
           body: SizedBox(
               width: mediaQueryData.size.width,
               child: SingleChildScrollView(
                   padding: getPadding(top: 16),
                   child: Padding(
                       padding: getPadding(left: 20, right: 20),
                       child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle393,
                                height: getVerticalSize(189),
                                width: getHorizontalSize(388),
                                radius: BorderRadius.circular(
                                    getHorizontalSize(16))),
                            Padding(
                                padding: getPadding(top: 12),
                                child: Text("msg_what_is_insurance3".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.titleLargeBold)),
                            Padding(
                                padding: getPadding(top: 9),
                                child: Text("msg_insurance_policies3".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                    CustomTextStyles.bodyLargeGray600_1)),
                            Container(
                                width: getHorizontalSize(386),
                                margin: getMargin(top: 18),
                                child: Text("msg_contrary_to_popular".tr,
                                    maxLines: 15,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyLarge)),
                            Container(
                                width: getHorizontalSize(384),
                                margin: getMargin(top: 12),
                                child: Text("msg_consectetur_from".tr,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyLarge))
                           ])))))),
  );
 }


 onTapBlogdetail() {
  Get.toNamed(
   AppRoutes.blogScreen,
  );
 }
}



