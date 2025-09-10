import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:intl/intl.dart';
import '../../choose_a_date_screen/controller/choose_a_date_controller.dart';
import '../controller/home_insurance_controller.dart';

class ChooseADateScreen extends StatefulWidget {
  final bool isBOD;
  final bool isStartDate;
  final bool isEndDate;

  const ChooseADateScreen({
    super.key,
    this.isBOD = false,
    this.isStartDate = false,
    this.isEndDate = false,
  });

  @override
  State<ChooseADateScreen> createState() => _ChooseADateScreenState();
}

class _ChooseADateScreenState extends State<ChooseADateScreen> {
  final HomeInsuranceController fewMoreDetailsController =
      Get.put(HomeInsuranceController());
  final ChooseADateController controller = Get.put(ChooseADateController());
  List<DateTime?> _dates = [];

  List<String> get weekdayLabels => [
        'weekday_sunday'.tr,
        'weekday_monday'.tr,
        'weekday_tuesday'.tr,
        'weekday_wednesday'.tr,
        'weekday_thursday'.tr,
        'weekday_friday'.tr,
        'weekday_saturday'.tr,
      ];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder<HomeInsuranceController>(
      init: HomeInsuranceController(),
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
                    onTap: () => Get.back(),
                    svgPath: ImageConstant.imgClose,
                  )
                ],
              ),
            ),
            SizedBox(height: getVerticalSize(16)),
            CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                weekdayLabelTextStyle: theme.textTheme.labelLarge,
                weekdayLabels: weekdayLabels,
                lastDate: widget.isBOD
                    ? DateTime.now()
                    : DateTime(DateTime.now().year + 10),
                currentDate: DateTime.now(),
                firstDate: widget.isStartDate
                    ? DateTime.now()
                    : widget.isEndDate
                        ? DateTime.parse(controller.startController.text)
                            .add(const Duration(days: 365))
                        : null,
                controlsTextStyle: TextStyle(
                  color: appTheme.black900,
                  fontSize: getFontSize(17),
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                ),
                customModePickerIcon: Icon(Icons.keyboard_arrow_down_outlined),
                //  CustomImageView(
                //   svgPath: ImageConstant.imglastMonth,
                //   height: getVerticalSize(11.44),
                //   width: getHorizontalSize(6.69),
                //   margin: getMargin(left: 8, top: 4, bottom: 4),
                // ),
                lastMonthIcon: Icon(Icons.keyboard_arrow_left),
                // CustomImageView(
                //   svgPath: ImageConstant.imgPrevious,
                //   height: getVerticalSize(17.32),
                //   width: getHorizontalSize(9.97),
                //   margin: getMargin(left: 8, top: 4, bottom: 4),
                // ),
                nextMonthIcon: Icon(Icons.keyboard_arrow_right),
                dayTextStyle: TextStyle(
                  color: appTheme.black900,
                  fontSize: getFontSize(20),
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),
                selectedDayHighlightColor: appTheme.buttonColor,
                selectedDayTextStyle: CustomTextStyles.dayStyle
                    .copyWith(letterSpacing: getHorizontalSize(0.38)),
              ),
              value: _dates,
              onValueChanged: (dates) {
                setState(() {
                  _dates = dates;
                });

                final String formattedDate =
                    DateFormat('yyyy-MM-dd').format(_dates[0]!);
                final String formattedDateOneYear = DateFormat('yyyy-MM-dd')
                    .format(_dates[0]!.add(const Duration(days: 365)));

                if (widget.isBOD) {
                  controller.dateController.text = formattedDate;
                } else if (widget.isStartDate) {
                  controller.startController.text = formattedDate;
                  controller.endController.text = formattedDateOneYear;
                } else if (widget.isEndDate) {
                  controller.endController.text = formattedDate;
                }

                controller.update();
                Get.back();
                if (widget.isStartDate) {
                  controller.showCustomDialog();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
