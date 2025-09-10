import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:intl/intl.dart';

import '../../choose_a_date_screen/controller/choose_a_date_controller.dart';
import '../controller/medical_insurance_controller.dart';

class ChooseADateScreen extends StatefulWidget {
  final bool isBOD;
  final bool isStartDate;
  final bool isEndDate;
  final Function(String)? onDateSelected; // 👈 add this
  const ChooseADateScreen(
      {super.key,
      this.isBOD = false,
      this.isStartDate = false,
      this.onDateSelected,
      this.isEndDate = false});

  @override
  State<ChooseADateScreen> createState() => _ChooseADateScreenState();
}

class _ChooseADateScreenState extends State<ChooseADateScreen> {
  MedicalInsuranceController fewMoreDetailsController =
      Get.put(MedicalInsuranceController());
  ChooseADateController controller = Get.put(ChooseADateController());
  List<DateTime?> _dates = [];
  List<String> day = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder<MedicalInsuranceController>(
      init: MedicalInsuranceController(),
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
                      lastDate: widget.isBOD ? DateTime.now() : DateTime(2100),
                      weekdayLabelTextStyle: theme.textTheme.labelLarge,
                      weekdayLabels: day,
                      // currentDate: DateTime.now(),
                      firstDate: widget.isStartDate
                          ? DateTime.now()
                          : widget.isEndDate
                              ? DateTime.parse(controller.startController.text)
                                  .add(const Duration(days: 365))
                              : widget.isBOD
                                  ? DateTime(1800)
                                  : DateTime(2900),
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
                      controller.age.value =
                          calculateAge(controller.dateController.text);
                    } else if (widget.isStartDate) {
                      debugPrint("isStartDate");
                      controller.startController.text = formattedDate2;
                      controller.endController.text = formattedDateOneYear;
                    } else if (widget.isEndDate) {
                      debugPrint("isEndDate");
                      controller.endController.text = formattedDate2;
                    }

                    widget.onDateSelected?.call(formattedDate2);
                    controller.update();
                    Get.back();
                  },
                ),
              ])),
    );
  }

  onTapChooseadate() {
    Get.toNamed(
      AppRoutes.homeInsuranceRoute,
    );
  }
}
