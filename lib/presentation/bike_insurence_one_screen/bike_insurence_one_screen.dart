import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import 'controller/bike_insurence_one_controller.dart';

class BikeInsurenceOneScreen extends StatefulWidget {
  const BikeInsurenceOneScreen({super.key});

  @override
  State<BikeInsurenceOneScreen> createState() => _BikeInsurenceOneScreenState();
}

class _BikeInsurenceOneScreenState extends State<BikeInsurenceOneScreen> {
  BikeInsurenceOneController controller = Get.put(BikeInsurenceOneController());
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
      child: ColorfulSafeArea(
          color: appTheme.whiteA700,
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
                title: AppbarTitle(text: "lbl_bike_insurence".tr),
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
                                controller: controller.inputController,
                                contentPadding: getPadding(
                                    left: 12, top: 17, right: 12, bottom: 17),
                                hintText: "msg_enter_your_bike".tr,
                                hintStyle: CustomTextStyles.bodyLargeGray600,
                                textInputType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter valid number";
                                  }
                                  return null;
                                },
                                filled: true,
                                fillColor: appTheme.gray50),
                            CustomElevatedButton(
                                text: "lbl_check_price".tr,
                                margin: getMargin(top: 46, bottom: 5),
                                buttonStyle: CustomButtonStyles.fillPrimary
                                    .copyWith(
                                        fixedSize:
                                            MaterialStateProperty.all<Size>(
                                                Size(double.maxFinite,
                                                    getVerticalSize(54)))),
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumWhiteA700,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    onTapCheckprice();
                                  }
                                })
                          ]))))),
    );
  }

  onTapBikeinsurence() {
    Get.toNamed(
      AppRoutes.homeScreenContainer1Screen,
    );
  }

  onTapCheckprice() {
    Get.toNamed(
      AppRoutes.detailsTabContainerScreen,
    );
  }
}
