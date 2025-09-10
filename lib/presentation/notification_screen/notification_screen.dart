import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/notification_screen/widgets/notification_item_widget.dart';
import 'controller/notification_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationControllers controller = Get.put(NotificationControllers());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width,
      padding: getPadding(top: 16),
      child: Column(
        children: [
          Container(
              width: double.maxFinite,
              padding: getPadding(left: 20, top: 10, right: 20, bottom: 10),
              decoration: AppDecoration.white,
              child: Row(
                children: [
                  Text("lbl_notifications".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.headlineMedium),
                ],
              )),
          Obx(() => !controller.isLoading.value
              ? Expanded(
                  child: RefreshIndicator(
                    // backgroundColor: Colors.red,
                    onRefresh: () async {
                      controller.notificationList();
                    },
                    child: ListView.builder(
                        padding: getPadding(left: 16, right: 16, top: 16),
                        shrinkWrap: true,
                        // primary: false,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.notificationListData.length,
                        itemBuilder: (context, index) {
                          return NotificationItemWidget(
                            controller.notificationListData[index],
                            index,
                          );
                        }),
                  ),
                )
              : const Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}
