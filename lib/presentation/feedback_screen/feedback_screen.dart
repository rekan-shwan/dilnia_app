import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/appbar_image.dart';
import 'package:insurance_app/widgets/app_bar/appbar_title.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_text_form_field.dart';

import 'controller/feedback_controller.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  FeedbackController controller = Get.put(FeedbackController());
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
                title: AppbarTitle(text: "lbl_feedback".tr),
              ),
              body: Container(
                  width: double.maxFinite,
                  padding: getPadding(all: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("msg_what_do_you_like".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.titleLargeBold_1),
                        CustomTextFormField(
                            controller: controller.feedbackinputController,
                            margin: getMargin(top: 17, bottom: 5),
                            contentPadding: getPadding(
                                left: 16, top: 20, right: 16, bottom: 20),
                            textStyle: CustomTextStyles.bodyLargeGray600_1,
                            hintText: "msg_write_your_feedback".tr,
                            hintStyle: CustomTextStyles.bodyLargeGray600_1,
                            maxLines: 8,
                            filled: true,
                            fillColor: appTheme.gray50)
                      ])),
              bottomNavigationBar: CustomElevatedButton(
                  onTap: () {
                    Get.back();
                  },
                  text: "lbl_submit".tr,
                  margin: getMargin(left: 20, right: 20, bottom: 32),
                  buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(
                          Size(double.maxFinite, getVerticalSize(54)))),
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA700))),
    );
  }

  onTapArrowleft4() {
    Get.back();
  }
}
