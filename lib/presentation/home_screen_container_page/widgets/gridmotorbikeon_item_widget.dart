import '../../family_insurence_screen/models/family_item_model.dart';
import '../controller/home_screen_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';

class GridmotorbikeonItemWidget extends StatelessWidget {
  GridmotorbikeonItemWidget(
    this.gridmotorbikeonItemModelObj, {
    super.key,
    this.onTapColumnmotorbike,
  });

  FamilyItemModel gridmotorbikeonItemModelObj;

  var controller = Get.find<HomeScreenContainerController>();

  VoidCallback? onTapColumnmotorbike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapColumnmotorbike?.call();
        },
        child: Container(
          decoration: AppDecoration.fill3.copyWith(
            color: gridmotorbikeonItemModelObj.bgColor,
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Padding(
            padding: getPadding(top: 15, bottom: 15, left: 12, right: 12),
            child: Column(
              children: [
                Container(
                  height: getSize(70),
                  width: getSize(70),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: appTheme.whiteA700),
                  child: Padding(
                    padding: getPadding(all: 12),
                    child: CustomImageView(
                      svgPath: gridmotorbikeonItemModelObj.icon,
                    ),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(8),
                ),
                Text(
                  gridmotorbikeonItemModelObj.title!.tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ));
  }
}
