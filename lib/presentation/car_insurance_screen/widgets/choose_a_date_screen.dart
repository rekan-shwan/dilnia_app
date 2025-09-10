import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_outlined_button.dart';
import 'package:intl/intl.dart';

import '../../choose_a_date_screen/controller/choose_a_date_controller.dart';
import '../controller/car_insurance_controller.dart';

class ChooseADateScreen extends StatefulWidget {
  final bool isBOD;
  final bool isStartDate;
  final bool isEndDate;
  const ChooseADateScreen(
      {super.key,
      this.isBOD = false,
      this.isStartDate = false,
      this.isEndDate = false});

  @override
  State<ChooseADateScreen> createState() => _ChooseADateScreenState();
}

class _ChooseADateScreenState extends State<ChooseADateScreen> {
  CarInsuranceController fewMoreDetailsController =
      Get.put(CarInsuranceController());
  ChooseADateController controller = Get.put(ChooseADateController());
  List<DateTime?> _dates = [];
  List<String> day = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder<CarInsuranceController>(
      init: CarInsuranceController(),
      builder: (controller) => Container(
          padding: getPadding(left: 0, top: 26, right: 0, bottom: 26),
          decoration: AppDecoration.white
              .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_choose_a_date".tr,
                        style: CustomTextStyles.titleLargeBold_1,
                      ),
                      CustomImageView(
                          onTap: () {
                            Get.back();
                          },
                          svgPath: ImageConstant.imgClose)
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(16),
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                      lastDate: widget.isBOD ? DateTime.now() : null,
                      weekdayLabelTextStyle: theme.textTheme.labelLarge,
                      weekdayLabels: day,
                      currentDate: DateTime.now(),
                      firstDate: widget.isStartDate
                          ? DateTime.now()
                          : widget.isEndDate
                              ? DateTime.parse(controller.startController.text)
                                  .add(const Duration(days: 365))
                              : null,
                      controlsTextStyle: TextStyle(
                        color: appTheme.black900,
                        fontSize: getFontSize(
                          17,
                        ),
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                      ),
                      customModePickerIcon: CustomImageView(
                          svgPath: ImageConstant.imglastMonth,
                          height: getVerticalSize(11.44),
                          width: getHorizontalSize(6.69),
                          margin: getMargin(left: 8, top: 4, bottom: 4)),
                      lastMonthIcon: CustomImageView(
                          svgPath: ImageConstant.imgPrevious,
                          height: getVerticalSize(17.32),
                          width: getHorizontalSize(9.97),
                          margin: getMargin(left: 8, top: 4, bottom: 4)),
                      nextMonthIcon: CustomImageView(
                          svgPath: ImageConstant.imglastMonth,
                          height: getVerticalSize(17.32),
                          width: getHorizontalSize(9.97),
                          margin: getMargin(left: 8, top: 4, bottom: 4)),
                      dayTextStyle: TextStyle(
                        color: appTheme.black900,
                        fontSize: getFontSize(
                          20,
                        ),
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w400,
                      ),
                      selectedDayHighlightColor: appTheme.buttonColor,
                      selectedDayTextStyle: CustomTextStyles.dayStyle
                          .copyWith(letterSpacing: getHorizontalSize(0.38))),
                  value: _dates,
                  onValueChanged: (dates) {
                    setState(() {
                      _dates = dates;
                    });
                    String formattedDate2 =
                        DateFormat('yyyy-MM-dd').format(_dates[0]!);
                    String formattedDateOneYear = DateFormat('yyyy-MM-dd')
                        .format(_dates[0]!.add(const Duration(days: 365)));
                    if (widget.isBOD) {
                      debugPrint("isBOD");
                      controller.dateController.text = formattedDate2;
                    } else if (widget.isStartDate) {
                      debugPrint("isStartDate");
                      controller.startController.text = formattedDate2;
                      controller.endController.text = formattedDateOneYear;
                    } else if (widget.isEndDate) {
                      debugPrint("isEndDate");
                      controller.endController.text = formattedDate2;
                    }

                    controller.update();
                    Get.back();
                    if (widget.isStartDate) {
                      Get.dialog(
                        Dialog(
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          child: SizedBox(
                            height: Get.height - 300,
                            width: Get.width,
                            child: Column(
                              children: [
                                // Header
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Material(
                                    elevation: 5,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 20),
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(32, 0, 0, 0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "lbl_your_car_coverage".tr,
                                          style:
                                              CustomTextStyles.titleLargeBold,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Content Scrollable
                                Expanded(
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildSectionTitle(
                                            "Coverage Includes".tr),
                                        _buildCoverageCard([
                                          _buildCoverageItemWithIcon(
                                              "lbl_personal_accident_cover".tr,
                                              "",
                                              Icons.car_crash_rounded),
                                          _buildCoverageItemWithIcon(
                                              "lbl_roadside_assistance".tr,
                                              "".tr,
                                              Icons.warning),
                                        ]),
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CustomOutlinedButton(
                                    text: "lbl_close".tr,
                                    buttonStyle: CustomButtonStyles
                                        .outlinePrimary
                                        .copyWith(
                                      fixedSize: WidgetStateProperty.all<Size>(
                                        Size(double.infinity,
                                            getVerticalSize(54)),
                                      ),
                                    ),
                                    onTap: () => Get.back(),
                                    buttonTextStyle:
                                        CustomTextStyles.titleMediumPrimary_1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        barrierDismissible: true,
                      );
                    }
                  },
                ),
              ])),
    );
  }

  Widget _buildSectionTitle(String title, {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: CustomTextStyles.titleLargeBold.copyWith(color: color),
      ),
    );
  }

  Widget _buildCoverageItemWithIcon(
    String title,
    String subtitle,
    IconData icon, {
    bool isRed = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon,
              color: isRed ? Colors.red : theme.colorScheme.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: CustomTextStyles.titleMediumPrimary.copyWith(
                      color: isRed ? Colors.red : Colors.black87,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: CustomTextStyles.titleMediumSemiBold.copyWith(
                      color: isRed ? Colors.red.shade700 : Colors.black54,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoverageCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  onTapChooseadate() {
    Get.toNamed(
      AppRoutes.homeInsuranceRoute,
    );
  }
}
