import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

import 'controller/payment_confirm_one_controller.dart';

class PaymentConfirmOneScreen extends StatefulWidget {
  const PaymentConfirmOneScreen({super.key});

  @override
  State<PaymentConfirmOneScreen> createState() =>
      _PaymentConfirmOneScreenState();
}

class _PaymentConfirmOneScreenState extends State<PaymentConfirmOneScreen> {
  PaymentConfirmOneController controller =
      Get.put(PaymentConfirmOneController());

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
        Get.offAllNamed(
          AppRoutes.homeScreenContainer1Screen,
        );
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            bottomNavigationBar: CustomElevatedButton(
                text: "lbl_back_to_home".tr,
                margin: getMargin(left: 20, right: 20, bottom: 32),
                buttonStyle: CustomButtonStyles.fillWhiteA700.copyWith(
                    fixedSize: WidgetStateProperty.all<Size>(
                        Size(double.maxFinite, getVerticalSize(54)))),
                buttonTextStyle: CustomTextStyles.titleMediumPrimary_1,
                onTap: () {
                  onTapBacktohome();
                }),
            body: Obx(() {
              return SizedBox(
                width: double.maxFinite,
                child: Container(
                  padding: getPadding(left: 20, top: 17, right: 20, bottom: 17),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      controller.paymentStatus.value == successUrlV
                          ? CustomImageView(
                              svgPath: ImageConstant.imgVectorWhiteA700,
                              height: getSize(131),
                              width: getSize(131))
                          : CustomImageView(
                              svgPath: ImageConstant.imgMultiply1,
                              height: getSize(131),
                              width: getSize(131)),
                      controller.paymentStatus.value == successUrlV
                          ? Padding(
                              padding: getPadding(top: 23),
                              child: Text("lbl_payment_success".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStyles.headlineMediumWhiteA700))
                          : Padding(
                              padding: getPadding(top: 23),
                              child: Text("lbl_payment_failed".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles
                                      .headlineMediumWhiteA700)),
                      controller.paymentStatus.value == successUrlV
                          ? Padding(
                              padding: getPadding(top: 3, bottom: 3),
                              child: Text(
                                  "${"lbl_invoice".tr} : ${controller.invoiceData.value}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodyLargeWhiteA700))
                          : const SizedBox()
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }

  onTapBacktohome() {
    Get.offAllNamed(
      AppRoutes.homeScreenContainer1Screen,
    );
  }
}
