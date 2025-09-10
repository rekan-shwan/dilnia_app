import '../controller/search_fill_controller.dart';
import '../models/search_fill_item_model.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class SearchFillItemWidget extends StatelessWidget {
  SearchFillItemWidget(
    this.searchFillItemModelObj, {
    Key? key,
    this.onTapColumnmotorbike,
  }) : super(
          key: key,
        );

  SearchFillItemModel searchFillItemModelObj;

  var controller = Get.find<SearchFillController>();

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
                  searchFillItemModelObj.bikeinsuranceTxt.value,
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
