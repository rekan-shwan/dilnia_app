import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_text_form_field.dart';

import '../search_fill_page/widgets/search_fill_item_widget.dart';
import 'controller/search_fill_controller.dart';
import 'models/search_fill_item_model.dart';
import 'models/search_fill_model.dart';

// ignore_for_file: must_be_immutable
class SearchFillPage extends StatelessWidget {
  SearchFillPage({Key? key}) : super(key: key);

  SearchFillController controller =
      Get.put(SearchFillController(SearchFillModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(71),
                title: CustomTextFormField(
                    width: getHorizontalSize(322),
                    controller: controller.group34424Controller,
                    margin: getMargin(left: 20),
                    contentPadding: getPadding(top: 16, bottom: 16),
                    textStyle: theme.textTheme.bodyLarge!,
                    hintText: "lbl_insurance".tr,
                    hintStyle: theme.textTheme.bodyLarge!,
                    textInputAction: TextInputAction.next,
                    prefix: Container(
                        margin:
                            getMargin(left: 16, top: 14, right: 12, bottom: 15),
                        child:
                            CustomImageView(svgPath: ImageConstant.imgSearch)),
                    prefixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(54)),
                    suffix: Container(
                        margin:
                            getMargin(left: 30, top: 15, right: 16, bottom: 15),
                        child: CustomImageView(
                            svgPath: ImageConstant.imgCloseGray600)),
                    suffixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(54)),
                    filled: true,
                    fillColor: appTheme.gray100,
                    defaultBorderDecoration:
                        TextFormFieldStyleHelper.fillGray100,
                    enabledBorderDecoration:
                        TextFormFieldStyleHelper.fillGray100,
                    focusedBorderDecoration:
                        TextFormFieldStyleHelper.fillGray100,
                    disabledBorderDecoration:
                        TextFormFieldStyleHelper.fillGray100),
                actions: [
                  AppbarSubtitle(
                      text: "lbl_cancel".tr,
                      margin:
                          getMargin(left: 16, top: 18, right: 20, bottom: 16),
                      onTap: () {
                        onTapCancel();
                      })
                ]),
            body: Padding(
                padding: getPadding(left: 20, top: 23, right: 19),
                child: Obx(() => GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: getVerticalSize(155),
                        crossAxisCount: 3,
                        mainAxisSpacing: getHorizontalSize(16),
                        crossAxisSpacing: getHorizontalSize(16)),
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.searchFillModelObj.value
                        .searchFillItemList.value.length,
                    itemBuilder: (context, index) {
                      SearchFillItemModel model = controller.searchFillModelObj
                          .value.searchFillItemList.value[index];
                      return SearchFillItemWidget(model,
                          onTapColumnmotorbike: () {
                        onTapColumnmotorbike();
                      });
                    })))));
  }

  /// Navigates to the bikeInsurenceOneScreen when the action is triggered.
  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the bikeInsurenceOneScreen.
  onTapColumnmotorbike() {
    Get.toNamed(AppRoutes.bikeInsurenceOneScreen);
  }

  /// Navigates to the searchScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the searchScreen.
  onTapCancel() {
    Get.toNamed(
      AppRoutes.searchScreen,
    );
  }
}
