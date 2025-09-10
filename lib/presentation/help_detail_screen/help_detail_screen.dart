import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import 'controller/help_detail_controller.dart';



class HelpDetailScreen extends StatefulWidget {
  const HelpDetailScreen({super.key});

  @override
  State<HelpDetailScreen> createState() => _HelpDetailScreenState();
}

class _HelpDetailScreenState extends State<HelpDetailScreen> {
 HelpDetailController controller = Get.put(HelpDetailController());

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
            appBar:  CustomAppBar(
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
             title: AppbarTitle(text: "lbl_help".tr),
            ),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 20),
                    child: Padding(
                        padding: getPadding(left: 20, right: 21),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                             Text("msg_how_many_types_of".tr,
                                 overflow: TextOverflow.ellipsis,
                                 textAlign: TextAlign.left,
                                 style: CustomTextStyles.titleLargeBold),
                             Container(
                                 width: getHorizontalSize(386),
                                 margin: getMargin(top: 20),
                                 child: Text("msg_contrary_to_popular".tr,
                                     maxLines: 15,
                                     overflow: TextOverflow.ellipsis,
                                     textAlign: TextAlign.left,
                                     style: theme.textTheme.bodyLarge)),
                             Container(
                                 width: getHorizontalSize(384),
                                 margin: getMargin(top: 20),
                                 child: Text("msg_looked_up_one_of".tr,
                                     maxLines: 11,
                                     overflow: TextOverflow.ellipsis,
                                     textAlign: TextAlign.left,
                                     style: theme.textTheme.bodyLarge)),
                             Container(
                                 width: getHorizontalSize(384),
                                 margin: getMargin(top: 20),
                                 child: Text("msg_looked_up_one_of".tr,
                                     maxLines: 2,
                                     overflow: TextOverflow.ellipsis,
                                     textAlign: TextAlign.left,
                                     style: theme.textTheme.bodyLarge))
                            ]))))),
      ));
 }

 onTapHelp() {
  Get.toNamed(
   AppRoutes.helpScreen,
  );
 }
}



