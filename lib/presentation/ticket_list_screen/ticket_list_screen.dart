import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/ticket_list_controller.dart';
import 'models/ticket_list_model.dart';

class TicketListScreen extends StatelessWidget {
  TicketListScreen({super.key});
  final TicketListController controller = Get.put(TicketListController());
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
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20,
                    )),
                centerTitle: false,
                title: AppbarTitle(text: "lbl_ticket_list".tr),
              ),
              body: Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        width: double.maxFinite,
                        padding: getPadding(
                            left: 20, top: 16, right: 20, bottom: 16),
                        child: ListView.builder(
                          itemCount: controller.ticketDataList.length,
                          itemBuilder: (context, index) {
                            TicketData data = controller.ticketDataList[index];
                            if (data.status == 1) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.ticketDetailsScreen,
                                      arguments: data);
                                },
                                child: Padding(
                                  padding: getPadding(top: 8, bottom: 8),
                                  child: Container(
                                    // height: getSize(56),
                                    padding: getPadding(top: 16, bottom: 16),
                                    decoration: AppDecoration.fill10.copyWith(
                                        color: theme.colorScheme.primary
                                            .withOpacity(0.1),
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder16),
                                    child: Padding(
                                      padding: getPadding(left: 16, right: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(data.title!,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(data.note!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                              Text(
                                                  data.createdAt!
                                                      .format("dd MMM yyyy"),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        )),
              ),
              bottomNavigationBar: CustomElevatedButton(
                  text: "lbl_create".tr,
                  margin: getMargin(left: 20, right: 20, bottom: 32),
                  buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                      fixedSize: WidgetStateProperty.all<Size>(
                          Size(double.maxFinite, getVerticalSize(54)))),
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                  onTap: () {
                    onTapConfirm(context);
                  }))),
    );
  }

  onTapConfirm(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
            insetPadding: EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding: EdgeInsets.zero,
            content: Container(
                width: getHorizontalSize(396),
                padding: getPadding(left: 20, top: 24, right: 20, bottom: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(16),
                    ),
                    color: appTheme.whiteA700),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "lbl_ticket_create".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleLargeBold,
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    CustomTextFormField(
                        controller: controller.titleController,
                        margin: getMargin(top: 10, bottom: 5),
                        contentPadding: getPadding(
                            left: 16, top: 10, right: 16, bottom: 20),
                        textStyle: CustomTextStyles.bodyLargeGray600_1,
                        hintText: "lbl_ticket_title".tr,
                        hintStyle: CustomTextStyles.bodyLargeGray600_1,
                        maxLines: 1,
                        filled: true,
                        fillColor: appTheme.gray50),
                    CustomTextFormField(
                        controller: controller.detailsController,
                        margin: getMargin(top: 10, bottom: 5),
                        contentPadding: getPadding(
                            left: 16, top: 10, right: 16, bottom: 20),
                        textStyle: CustomTextStyles.bodyLargeGray600_1,
                        hintText: "lbl_ticket_details".tr,
                        hintStyle: CustomTextStyles.bodyLargeGray600_1,
                        maxLines: 5,
                        filled: true,
                        fillColor: appTheme.gray50),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomOutlinedButton(
                            text: "lbl_close".tr,
                            margin: getMargin(
                              right: 8,
                            ),
                            buttonStyle: CustomButtonStyles.outlinePrimary
                                .copyWith(
                                    fixedSize:
                                        WidgetStateProperty.all<Size>(Size(
                              double.maxFinite,
                              getVerticalSize(
                                54,
                              ),
                            ))),
                            onTap: () {
                              Get.back();
                            },
                            buttonTextStyle:
                                CustomTextStyles.titleMediumPrimary_1,
                          ),
                        ),
                        SizedBox(
                          width: getHorizontalSize(10),
                        ),
                        Expanded(
                          child: CustomElevatedButton(
                            onTap: () {
                              controller.ticketCreate();
                              Get.back();
                            },
                            text: "lbl_create".tr,
                            margin: getMargin(
                              left: 8,
                            ),
                            buttonStyle: CustomButtonStyles.fillPrimary
                                .copyWith(
                                    fixedSize:
                                        WidgetStateProperty.all<Size>(Size(
                              double.maxFinite,
                              getVerticalSize(
                                54,
                              ),
                            ))),
                            buttonTextStyle:
                                CustomTextStyles.titleMediumWhiteA700,
                          ),
                        ),
                      ],
                    ),
                  ],
                )));
      },
    );
  }
}
