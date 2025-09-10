// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';

import 'app_bar/custum_bottom_bar_controller.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  CustomBottomBarController customBottomBarController =
      Get.put(CustomBottomBarController());

  // RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      activeIcon: ImageConstant.imgHome,
      title: "lbl_home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.notification,
      activeIcon: ImageConstant.notification,
      title: "lbl_notifications",
      type: BottomBarEnum.Notification,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCheckmark,
      activeIcon: ImageConstant.imgCheckmark,
      title: "lbl_my_policies",
      type: BottomBarEnum.Mypolicies,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      activeIcon: ImageConstant.imgUser,
      title: "lbl_profile",
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: appTheme.whiteA700,
        ),
        child: GetBuilder<CustomBottomBarController>(
          init: CustomBottomBarController(),
          builder: (controller) => BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            currentIndex: controller.selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            items: List.generate(bottomMenuList.length, (index) {
              return BottomNavigationBarItem(
                backgroundColor: Colors.amber,
                icon: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(20),
                        ),
                      ),
                      child: CustomImageView(
                        color: appTheme.gray600,
                        svgPath: bottomMenuList[index].icon,
                        height: getVerticalSize(
                          24,
                        ),
                        width: getHorizontalSize(
                          24,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            16,
                          ),
                        ),
                        margin:
                            getMargin(top: 4, bottom: 4, left: 14, right: 14),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(7),
                    ),
                    Text(bottomMenuList[index].title.tr,
                        style: CustomTextStyles.title)
                  ],
                ),
                activeIcon: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(20),
                          ),
                          color: appTheme.buttonColor),
                      child: CustomImageView(
                        color: appTheme.whiteA700,
                        svgPath: bottomMenuList[index].icon,
                        height: getVerticalSize(
                          24,
                        ),
                        width: getHorizontalSize(
                          24,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            16,
                          ),
                        ),
                        margin:
                            getMargin(top: 4, bottom: 4, left: 14, right: 14),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(7),
                    ),
                    Text(
                      bottomMenuList[index].title.tr,
                      style: CustomTextStyles.bodyMediumPrimary.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    )
                  ],
                ),
                label: '',
              );
            }),
            onTap: (index) {
              print("index is ======== ${controller.selectedIndex}");
              controller.getIndex(index);
              // widget.onChanged?.call(bottomMenuList[controller.selectedIndex].type);
            },
          ),
        ));
  }
}

enum BottomBarEnum {
  Home,
  Notification,
  Mypolicies,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.type,
    required this.activeIcon,
    required this.title,
  });

  String icon;
  String title;
  String activeIcon;
  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
