import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/core/utils/validation_functions.dart';
import 'package:insurance_app/widgets/app_bar/appbar_image.dart';
import 'package:insurance_app/widgets/app_bar/appbar_title.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_text_form_field.dart';

import '../choose_a_date_screen/choose_a_date_screen.dart';
import 'controller/few_more_details_controller.dart';

class FewMoreDetailsScreen extends StatefulWidget {
  const FewMoreDetailsScreen({super.key});

  @override
  State<FewMoreDetailsScreen> createState() => _FewMoreDetailsScreenState();
}

class _FewMoreDetailsScreenState extends State<FewMoreDetailsScreen> {
  FewMoreDetailsController controller = Get.put(FewMoreDetailsController());

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                title: AppbarTitle(
                  text: "msg_bike_holder_detail".tr,
                ),
              ),
              body: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding:
                          getPadding(left: 20, top: 24, right: 20, bottom: 24),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                                controller: controller.nameController,
                                contentPadding: getPadding(
                                    left: 16, top: 17, right: 16, bottom: 17),
                                hintText: "Bike holder name",
                                hintStyle: CustomTextStyles.bodyLargeGray600,
                                textInputAction: TextInputAction.next,
                                filled: true,
                                fillColor: appTheme.gray50),
                            CustomTextFormField(
                                controller: controller.emailController,
                                margin: getMargin(top: 22),
                                contentPadding: getPadding(
                                    left: 16, top: 17, right: 16, bottom: 17),
                                hintText: "lbl_email_address".tr,
                                hintStyle: CustomTextStyles.bodyLargeGray600,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                },
                                filled: true,
                                fillColor: appTheme.gray50),
                            CustomTextFormField(
                                controller: controller.phoneController,
                                margin: getMargin(top: 22),
                                contentPadding: getPadding(
                                    left: 16, top: 17, right: 16, bottom: 17),
                                hintText: "Phone number",
                                // hintText: "lbl_207_555_0119".tr,
                                hintStyle: CustomTextStyles.bodyLargeGray600,
                                textInputAction: TextInputAction.next,
                                filled: true,
                                fillColor: appTheme.gray50),
                            CustomTextFormField(
                                controller: controller.pincodeController,
                                margin: getMargin(top: 22),
                                contentPadding: getPadding(
                                    left: 16, top: 17, right: 16, bottom: 17),
                                hintText: "lbl_pincode".tr,
                                hintStyle: CustomTextStyles.bodyLargeGray600,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.number,
                                validator: (value) {
                                  if (!isNumeric(value)) {
                                    return "Please enter valid number";
                                  }
                                  return null;
                                },
                                filled: true,
                                fillColor: appTheme.gray50),
                            CustomTextFormField(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                getHorizontalSize(32)),
                                            topRight: Radius.circular(
                                                getHorizontalSize(32)))),
                                    context: context,
                                    builder: (context) {
                                      return ChooseADateScreen();
                                    },
                                  );
                                },
                                controller: controller.dateController,
                                suffixConstraints: BoxConstraints(
                                    minHeight: getSize(24),
                                    maxHeight: getSize(24)),
                                suffix: Padding(
                                  padding: getPadding(right: 16),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgCalendreIcon,
                                  ),
                                ),
                                margin: getMargin(top: 22),
                                contentPadding: getPadding(
                                    left: 16, top: 17, right: 16, bottom: 17),
                                hintText: "msg_new_policy_start".tr,
                                hintStyle: CustomTextStyles.bodyLargeGray600,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.none,
                                validator: (value) {
                                  if (!isNumeric(value)) {
                                    return "Please enter valid number";
                                  }
                                  return null;
                                },
                                filled: true,
                                fillColor: appTheme.gray50),
                            CustomTextFormField(
                                controller: controller.inputboxController,
                                margin: getMargin(top: 22, bottom: 5),
                                contentPadding: getPadding(
                                    left: 16, top: 17, right: 16, bottom: 17),
                                textStyle: CustomTextStyles.bodyLargeGray600,
                                hintText: "lbl_gst_number".tr,
                                hintStyle: CustomTextStyles.bodyLargeGray600,
                                textInputType: TextInputType.number,
                                validator: (value) {
                                  if (!isNumeric(value)) {
                                    return "Please enter valid number";
                                  }
                                  return null;
                                },
                                filled: true,
                                fillColor: appTheme.gray50)
                          ]))),
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

  onTapArrowleft1() {
    Get.back();
  }

  onTapContinue() {
    Get.back();
  }

  onTapNewpolicy() {
    Get.toNamed(
      AppRoutes.chooseADateScreen,
    );
  }
}
