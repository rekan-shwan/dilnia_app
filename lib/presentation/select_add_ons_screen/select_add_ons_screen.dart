import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/appbar_image.dart';
import 'package:insurance_app/widgets/app_bar/appbar_title.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_outlined_button.dart';

import 'controller/select_add_ons_controller.dart';

class SelectAddOnsScreen extends StatefulWidget {
  const SelectAddOnsScreen({super.key});

  @override
  State<SelectAddOnsScreen> createState() => _SelectAddOnsScreenState();
}

class _SelectAddOnsScreenState extends State<SelectAddOnsScreen> {
  SelectAddOnsController controller = Get.put(SelectAddOnsController());

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
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                centerTitle: false,
                title: AppbarTitle(text: "lbl_select_add_ons".tr),
              ),
              body: Container(
                  width: double.maxFinite,
                  padding: getPadding(all: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("msg_add_ons_are_valid".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.bodyLarge),
                        Container(
                            margin: getMargin(top: 15),
                            padding: getPadding(all: 16),
                            decoration: AppDecoration.fill10.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder16),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 2),
                                      child: Text("lbl_accident_cover".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.titleMedium)),
                                  Container(
                                      width: getHorizontalSize(332),
                                      margin: getMargin(top: 13, right: 23),
                                      child: Text("msg_this_add_on_covers".tr,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .bodyLargeGray600_1)),
                                  Padding(
                                      padding: getPadding(top: 4),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: getPadding(
                                                    top: 15, bottom: 2),
                                                child: Text("lbl_123_00".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme.textTheme
                                                        .titleMedium)),
                                            CustomOutlinedButton(
                                                text: "lbl_add".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .outlineBlack900
                                                    .copyWith(
                                                        fixedSize: MaterialStateProperty
                                                            .all<Size>(Size(
                                                                getHorizontalSize(
                                                                    104),
                                                                getVerticalSize(
                                                                    40)))),
                                                buttonTextStyle:
                                                    CustomTextStyles
                                                        .titleSmallBold,
                                                onTap: () {
                                                  onTapAdd();
                                                })
                                          ]))
                                ])),
                        Padding(
                            padding: getPadding(top: 27, bottom: 5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_total_price".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: theme.textTheme.titleMedium),
                                  Padding(
                                      padding: getPadding(bottom: 1),
                                      child: Text("lbl_822_00".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.bodyLarge))
                                ]))
                      ])),
              bottomNavigationBar: CustomElevatedButton(
                  text: "lbl_continue".tr,
                  margin: getMargin(left: 20, right: 20, bottom: 32),
                  buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(
                          Size(double.maxFinite, getVerticalSize(54)))),
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                  onTap: () {
                    onTapContinue();
                  }))),
    );
  }

  onTapArrowleft() {
    Get.back();
  }

  onTapContinue() {
    Get.toNamed(
      AppRoutes.reviewDetailsScreen,
    );
  }

  onTapAdd() {
    Get.toNamed(
      AppRoutes.fewMoreDetailsScreen,
    );
  }
}
