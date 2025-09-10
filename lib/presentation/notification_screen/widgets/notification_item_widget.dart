import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_image_view.dart';
import '../controller/notification_controller.dart';
import '../models/notification_model_data.dart';

// ignore: must_be_immutable
class NotificationItemWidget extends StatelessWidget {
  NotificationItemWidget(
    this.notificationData,
    this.index, {
    super.key,
  });

  NotificationItemData notificationData;
  int index;

  NotificationControllers searchScreenController =
      Get.put(NotificationControllers());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationControllers>(
      init: NotificationControllers(),
      builder: (controller) => Container(
        margin: getPadding(top: 10),
        padding: getPadding(all: 10),
        color: Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              svgPath: ImageConstant.notification,
              height: getSize(20),
              width: getSize(20),
              margin: getMargin(top: 3, bottom: 1),
            ),
            SizedBox(
              width: getHorizontalSize(10),
            ),
            Padding(
              padding: getPadding(left: 12, top: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationData.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(
                    notificationData.description ?? '',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
