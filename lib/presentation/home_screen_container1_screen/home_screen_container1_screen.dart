import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/home_screen_container_page/home_screen_container_page.dart';
import 'package:insurance_app/presentation/policies_page/policies_page.dart';
import 'package:insurance_app/presentation/profile_screen_page/profile_screen_page.dart';
import 'package:insurance_app/presentation/notification_screen/notification_screen.dart';
import 'package:insurance_app/widgets/custom_bottom_bar.dart';

import '../../widgets/app_bar/custum_bottom_bar_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'controller/home_screen_container1_controller.dart';

class HomeScreenContainer1Screen extends StatefulWidget {
  const HomeScreenContainer1Screen({super.key});

  @override
  State<HomeScreenContainer1Screen> createState() =>
      _HomeScreenContainer1ScreenState();
}

class _HomeScreenContainer1ScreenState
    extends State<HomeScreenContainer1Screen> {
  HomeScreenContainer1Controller homeScreenContainer1Controller =
      Get.put(HomeScreenContainer1Controller());
  CustomBottomBarController customBottomBarController =
      Get.put(CustomBottomBarController());
  @override
  void initState() {
    setSafeAreaColor();
    super.initState();
  }

  List<Widget> screen = [
    HomeScreenContainerPage(),
    const NotificationScreen(),
    PoliciesPage(),
    const ProfileScreenPage()
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomBarController>(
      init: CustomBottomBarController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          if (controller.selectedIndex == 0) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                    insetPadding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: EdgeInsets.zero,
                    content: Container(
                        width: getHorizontalSize(396),
                        padding: getPadding(
                            left: 20, top: 24, right: 20, bottom: 24),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(16),
                            ),
                            color: appTheme.whiteA700),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Are you sure want to ext ?".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleLargeBold,
                            ),
                            SizedBox(
                              height: getVerticalSize(28),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomOutlinedButton(
                                    text: "No",
                                    margin: getMargin(
                                      right: 8,
                                    ),
                                    buttonStyle: CustomButtonStyles
                                        .outlinePrimary
                                        .copyWith(
                                            fixedSize:
                                                WidgetStateProperty.all<Size>(
                                                    Size(
                                      double.maxFinite,
                                      getVerticalSize(
                                        54,
                                      ),
                                    ))),
                                    onTap: () {
                                      Get.back();
                                    },
                                    buttonTextStyle:
                                        CustomTextStyles.titleMediumPrimary_1,
                                  ),
                                ),
                                SizedBox(
                                  width: getHorizontalSize(10),
                                ),
                                Expanded(
                                  child: CustomElevatedButton(
                                    onTap: () {
                                      if (controller.selectedIndex == 0) {
                                        closeApp();
                                      } else {
                                        controller.getIndex(0);
                                        Get.back();
                                      }
                                    },
                                    text: "Yes",
                                    margin: getMargin(
                                      left: 8,
                                    ),
                                    buttonStyle: CustomButtonStyles.fillPrimary
                                        .copyWith(
                                            fixedSize:
                                                WidgetStateProperty.all<Size>(
                                                    Size(
                                      double.maxFinite,
                                      getVerticalSize(
                                        54,
                                      ),
                                    ))),
                                    buttonTextStyle:
                                        CustomTextStyles.titleMediumWhiteA700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )));
              },
            );
          } else {
            controller.getIndex(0);
            // Get.back();
          }

          return false;
        },
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            // body: Navigator(
            //     key: Get.nestedKey(1),
            //     initialRoute: AppRoutes.homeScreenContainerPage,
            //     onGenerateRoute: (routeSetting) => GetPageRoute(
            //         page: () => getCurrentPage(routeSetting.name!),
            //         transition: Transition.noTransition)),
            body: SafeArea(child: screen[controller.selectedIndex]),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })),
      ),
    );
  }

  closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemNavigator.pop();
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenContainerPage;

      case BottomBarEnum.Mypolicies:
        return AppRoutes.policiesPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreenPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenContainerPage:
        return HomeScreenContainerPage();
      case AppRoutes.searchScreen:
        return const NotificationScreen();
      case AppRoutes.policiesPage:
        return PoliciesPage();
      case AppRoutes.profileScreenPage:
        return const ProfileScreenPage();
      default:
        return DefaultWidget();
    }
  }
}
