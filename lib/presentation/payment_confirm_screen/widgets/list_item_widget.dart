import '../controller/payment_confirm_controller.dart';
import '../models/list_item_model.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ListItemWidget extends StatelessWidget {
  ListItemWidget(
    this.listItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListItemModel listItemModelObj;

  var controller = Get.find<PaymentConfirmController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 8,
        top: 9,
        right: 8,
        bottom: 9,
      ),
      decoration: AppDecoration.fill9.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        children: [
          CustomIconButton(
            height: 48,
            width: 48,
            padding: getPadding(
              all: 12,
            ),
            decoration: IconButtonStyleHelper.fillWhiteA700TL24,
            child: CustomImageView(
              svgPath: ImageConstant.imgIcnotification,
            ),
          ),
          Expanded(
            child: Padding(
              padding: getPadding(
                left: 16,
                top: 3,
                bottom: 1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    listItemModelObj.messege!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyLarge,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 5,
                    ),
                    child: Text(
                      listItemModelObj.time!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
