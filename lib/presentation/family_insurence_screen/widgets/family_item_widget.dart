import '../controller/family_insurence_controller.dart';
import '../models/family_item_model.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class FamilyItemWidget extends StatelessWidget {
  FamilyItemWidget(
    this.familyItemModelObj, {
    Key? key,
    this.onTapColumnmotorbike,
  }) : super(
          key: key,
        );

  FamilyItemModel familyItemModelObj;

  var controller = Get.find<FamilyInsurenceController>();

  VoidCallback? onTapColumnmotorbike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumnmotorbike?.call();
      },
      child: Container(
        padding: getPadding(
          left: 24,
          top: 16,
          right: 24,
          bottom: 16,
        ),
        decoration: AppDecoration.fill3.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              height: 64,
              width: 64,
              padding: getPadding(
                all: 12,
              ),
              child: CustomImageView(
                svgPath: ImageConstant.imgMotorbike1,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 10,
                bottom: 1,
              ),
              child: Obx(
                () => Text(
                  familyItemModelObj.bikeinsuranceTxt.value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
