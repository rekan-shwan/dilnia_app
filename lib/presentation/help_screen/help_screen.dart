import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/appbar_image.dart';
import 'package:insurance_app/widgets/app_bar/appbar_title.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';



class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {


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
           body: Container(
               width: double.maxFinite,

               child: Padding(
                 padding: getPadding(left: 20, top: 16, right: 20, bottom: 16),
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       get_help_option("msg_how_many_types_of".tr,),
                       SizedBox(height: getVerticalSize(16),),
                       get_help_option("msg_how_many_types_of".tr),
                       SizedBox(height: getVerticalSize(16),),
                       get_help_option("msg_how_many_types_of".tr),
                       SizedBox(height: getVerticalSize(16),),
                       get_help_option("msg_what_does_home_insurance".tr),
                       SizedBox(height: getVerticalSize(16),),
                       get_help_option("msg_what_is_the_difference2".tr),
                       SizedBox(height: getVerticalSize(16),),
                       get_help_option("msg_what_are_the_5_main".tr),
                       SizedBox(height: getVerticalSize(16),),
                       get_help_option("msg_what_is_insurance2".tr),
                     ]),
               )))),
  );
 }

 onTapArrowleft3() {
  Get.back();
 }


 Widget get_help_option(title){
   return  GestureDetector(
     onTap: (){
       Get.toNamed(AppRoutes.helpDetailScreen);
     },
     child: Container(
       decoration: AppDecoration.fill9.copyWith(
           borderRadius: BorderRadiusStyle.roundedBorder16),
       child: Padding(
         padding: getPadding(all: 16),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(title,style: theme.textTheme.titleMedium,),
             CustomImageView(
               svgPath: ImageConstant.imgArrowright,
             ),
           ],
         ),
       ),
     ),
   );
 }
}





