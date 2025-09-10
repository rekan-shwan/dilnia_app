import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../payment_confirm_screen/widgets/list_item_widget.dart';
import 'controller/payment_confirm_controller.dart';
import 'models/list_item_model.dart';

class PaymentConfirmScreen extends StatefulWidget {
  const PaymentConfirmScreen({super.key});

  @override
  State<PaymentConfirmScreen> createState() => _PaymentConfirmScreenState();
}

class _PaymentConfirmScreenState extends State<PaymentConfirmScreen> {
  PaymentConfirmController controller = Get.put(PaymentConfirmController());

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
                  title: AppbarTitle(
                    text: "lbl_notifications".tr,
                  ),
                ),
                body: Padding(
                    padding: getPadding(left: 20, top: 16, right: 20),
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: getVerticalSize(16));
                        },
                        itemCount: controller.paymentConfirmModelObj.length,
                        itemBuilder: (context, index) {
                          ListItemModel model =
                              controller.paymentConfirmModelObj[index];
                          return ListItemWidget(model);
                        })))));
  }

  onTapNotifications() {
    Get.toNamed(
      AppRoutes.homeScreenContainer1Screen,
    );
  }
}
