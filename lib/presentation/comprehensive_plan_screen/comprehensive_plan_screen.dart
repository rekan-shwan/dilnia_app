import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import 'controller/comprehensive_plan_controller.dart';



class ComprehensivePlanScreen extends StatefulWidget {
  const ComprehensivePlanScreen({super.key});

  @override
  State<ComprehensivePlanScreen> createState() => _ComprehensivePlanScreenState();
}

class _ComprehensivePlanScreenState extends State<ComprehensivePlanScreen> {
 ComprehensivePlanController controller = Get.put(ComprehensivePlanController());


 @override
 void initState() {
   setSafeAreaColor();
   super.initState();
 }

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return  WillPopScope(
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
                padding: getPadding(right: 16),
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
              title: AppbarTitle(text: "msg_comprehensive_plan".tr),
            ),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(all: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     Text("msg_covers_demages_to".tr,
                         overflow: TextOverflow.ellipsis,
                         textAlign: TextAlign.left,
                         style: theme.textTheme.bodyLarge),
                     Padding(
                         padding: getPadding(top: 19),
                         child: Text("lbl_what_s_covered".tr,
                             overflow: TextOverflow.ellipsis,
                             textAlign: TextAlign.left,
                             style: CustomTextStyles.titleLargeBold_1)),
                     SizedBox(height: getVerticalSize(18),),

                     Row(
                       children: [
                         CustomImageView(
                           height: getSize(24),
                           width: getSize(24),
                           svgPath: ImageConstant.imgDoneIconCirculer,
                         ),
                         SizedBox(width: getHorizontalSize(8),),
                         Text("msg_coveres_demages".tr,style:theme.textTheme.bodyLarge! ,)
                       ],
                     ),

                     Container(
                         width: getHorizontalSize(386),
                         margin: getMargin(top: 9),
                         child: Text("msg_insurance_is_the".tr,
                             maxLines: 5,
                             overflow: TextOverflow.ellipsis,
                             textAlign: TextAlign.left,
                             style: theme.textTheme.bodyMedium)),
                      SizedBox(height: getVerticalSize(18),),

                      Row(
                        children: [
                          CustomImageView(
                            height: getSize(24),
                            width: getSize(24),
                            svgPath: ImageConstant.imgDoneIconCirculer,
                          ),
                          SizedBox(width: getHorizontalSize(8),),
                          Text("msg_coveres_demages".tr,style:theme.textTheme.bodyLarge! ,)
                        ],
                      ),


                     Container(
                         width: getHorizontalSize(371),
                         margin: getMargin(top: 9, right: 16),
                         child: Text("msg_buying_life_insurance".tr,
                             maxLines: 3,
                             overflow: TextOverflow.ellipsis,
                             textAlign: TextAlign.left,
                             style: theme.textTheme.bodyMedium)),
                     Padding(
                         padding: getPadding(top: 26),
                         child: Text("msg_what_s_not_covered".tr,
                             overflow: TextOverflow.ellipsis,
                             textAlign: TextAlign.left,
                             style: CustomTextStyles.titleLargeBold_1)),
                     Padding(
                         padding: getPadding(top: 19),
                         child: Row(children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgMultiply1,
                              height: getSize(24),
                              width: getSize(24)),
                          Padding(
                              padding: getPadding(left: 8, top: 3),
                              child: Text("msg_own_bike_damages".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.bodyLarge))
                         ])),
                     Container(
                         width: getHorizontalSize(386),
                         margin: getMargin(top: 9),
                         child: Text("msg_insurance_is_the".tr,
                             maxLines: 5,
                             overflow: TextOverflow.ellipsis,
                             textAlign: TextAlign.left,
                             style: theme.textTheme.bodyMedium)),
                     Padding(
                         padding: getPadding(top: 18),
                         child: Row(children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgMultiply1,
                              height: getSize(24),
                              width: getSize(24)),
                          Padding(
                              padding: getPadding(left: 8, top: 3),
                              child: Text("lbl_lllegal_driving".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.bodyLarge))
                         ])),
                     Container(
                         width: getHorizontalSize(371),
                         margin: getMargin(top: 9, right: 16, bottom: 5),
                         child: Text("msg_buying_life_insurance".tr,
                             maxLines: 3,
                             overflow: TextOverflow.ellipsis,
                             textAlign: TextAlign.left,
                             style: theme.textTheme.bodyMedium))
                    ])),
            bottomNavigationBar: CustomElevatedButton(
                text: "lbl_ok_got_it".tr,
                margin: getMargin(left: 20, right: 20, bottom: 32),
                buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size(double.maxFinite, getVerticalSize(54)))),
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                onTap: () {
                 onTapOkgotit();
                }))),
  );
 }

 onTapComprehensive() {
  Get.toNamed(
   AppRoutes.detailsTabContainerScreen,
  );
 }

 onTapOkgotit() {
  Get.back();
 }
}






