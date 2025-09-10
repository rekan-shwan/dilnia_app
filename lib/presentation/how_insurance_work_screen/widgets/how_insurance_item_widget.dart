import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

import '../controller/how_insurance_work_controller.dart';
import '../models/how_insurance_item_model.dart';

// ignore: must_be_immutable
class HowInsuranceItemWidget extends StatelessWidget {
  HowInsuranceItemWidget(
    this.howInsuranceItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HowInsuranceItemModel howInsuranceItemModelObj;

  var controller = Get.find<HowInsuranceWorkController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 8, bottom: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: appTheme.gray50,
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              16,
            ),
          ),
        ),
        child: Padding(
          padding: getPadding(all: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: getSize(132),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                    image: DecorationImage(
                        image: AssetImage(howInsuranceItemModelObj.image!),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: getPadding(
                  left: 4,
                  top: 9,
                ),
                child: Text(
                  howInsuranceItemModelObj.title!,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.titleMedium17,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 4,
                  top: 4,
                  right: 4,
                ),
                child: Text(
                  howInsuranceItemModelObj.subTitle!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              CustomElevatedButton(
                text: "lbl_explore_now".tr,
                margin: getMargin(
                  left: 4,
                  top: 9,
                  bottom: 4,
                ),
                buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                  getHorizontalSize(
                    104,
                  ),
                  getVerticalSize(
                    33,
                  ),
                ))),
                buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
              ),
            ],
          ),
        ),
      ),
    );

  }
}
