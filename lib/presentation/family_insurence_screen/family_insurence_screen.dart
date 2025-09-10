import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../home_screen_container_page/widgets/gridmotorbikeon_item_widget.dart';
import 'controller/family_insurence_controller.dart';
import 'models/family_item_model.dart';



class FamilyInsurenceScreen extends StatefulWidget {
  const FamilyInsurenceScreen({super.key});

  @override
  State<FamilyInsurenceScreen> createState() => _FamilyInsurenceScreenState();
}

class _FamilyInsurenceScreenState extends State<FamilyInsurenceScreen> {
  FamilyInsurenceController controller = Get.put(FamilyInsurenceController());

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
              appBar:  CustomAppBar(
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
                title: AppbarTitle(text: "lbl_services".tr),),

              body:GridView.builder(
                  padding: getPadding(left: 16,right: 16),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: getVerticalSize(155),
                      crossAxisCount: 3,
                      mainAxisSpacing: getHorizontalSize(16),
                      crossAxisSpacing: getHorizontalSize(16)),
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.familyInsurenceModelObj.length,
                  itemBuilder: (context, index) {
                    FamilyItemModel model = controller.familyInsurenceModelObj[index];
                    return GridmotorbikeonItemWidget(model,
                        onTapColumnmotorbike: () {
                          onTapColumnmotorbike();
                        });
                  }))),
    );
  }
  onTapColumnmotorbike() {
    Get.toNamed(AppRoutes.bikeInsurenceOneScreen);
  }


  onTapServices() {
    Get.toNamed(
      AppRoutes.homeScreenContainer1Screen,
    );
  }
}







