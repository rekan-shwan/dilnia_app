import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_search_view.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../verify_bike_details_screen/controller/verify_bike_details_controller.dart';
import 'controller/choose_bike_model_controller.dart';
import 'models/choose_bike_model_model.dart';

class ChooseBikeModelScreen extends StatefulWidget {
  const ChooseBikeModelScreen({super.key});

  @override
  State<ChooseBikeModelScreen> createState() => _ChooseBikeModelScreenState();
}

class _ChooseBikeModelScreenState extends State<ChooseBikeModelScreen> {
  ChooseBikeModelController chooseBikeModelController =
      Get.put(ChooseBikeModelController());
  VerifyBikeDetailsController verifyBikeDetailsController =
      Get.put(VerifyBikeDetailsController());

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
              resizeToAvoidBottomInset: true,
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
                title: AppbarTitle(text: "msg_choose_bike_model".tr),
              ),
              body: GetBuilder<ChooseBikeModelController>(
                init: ChooseBikeModelController(),
                builder: (controller) => SizedBox(
                    width: mediaQueryData.size.width,
                    child: Padding(
                        padding: getPadding(left: 20, right: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomSearchView(
                                  controller: chooseBikeModelController
                                      .searchController,
                                  hintText: "msg_search_your_bike".tr,
                                  hintStyle:
                                      CustomTextStyles.bodyLargeGray600_1,
                                  textStyle:
                                      CustomTextStyles.bodyLargeGray600_1,
                                  prefix: Container(
                                      margin: getMargin(
                                          left: 16,
                                          top: 16,
                                          right: 12,
                                          bottom: 15),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgSearch)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(55)),
                                  filled: true,
                                  fillColor: appTheme.gray50,
                                  contentPadding: getPadding(
                                      top: 17, right: 30, bottom: 17)),
                              SizedBox(
                                height: getVerticalSize(24),
                              ),
                              Text("lbl_popular_bikes".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.titleLargeBold),
                              SizedBox(
                                height: getVerticalSize(16),
                              ),
                              Expanded(
                                child: ListView.separated(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      ChooseBikeModelModel data =
                                          controller.getModelData[index];
                                      return GestureDetector(
                                        onTap: () {
                                          verifyBikeDetailsController
                                              .setCurrentModel(data.modelName);
                                          controller.setCurrentModel(index);
                                        },
                                        child: Container(
                                          color: appTheme.whiteA700,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(data.modelName!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.bodyLarge),
                                              controller.currentModelIndex ==
                                                      index
                                                  ? CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgCheckmarkGreen500,
                                                    )
                                                  : SizedBox()
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            getPadding(top: 16, bottom: 16),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: appTheme.gray200),
                                      );
                                    },
                                    itemCount: controller.getModelData.length),
                              ),
                            ]))),
              ))),
    );
  }

  onTapChoosebike() {
    Get.toNamed(
      AppRoutes.verifyBikeDetailsScreen,
    );
  }
}
