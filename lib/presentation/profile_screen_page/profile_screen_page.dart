import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:insurance_app/presentation/delete_account/delete_account_popup_screen.dart';
import '../log_out_popup_screen/log_out_popup_screen.dart';
import '../rate_us_screen/rate_us_screen.dart';
import 'controller/profile_screen_controller.dart';

class ProfileScreenPage extends StatefulWidget {
  const ProfileScreenPage({super.key});

  @override
  State<ProfileScreenPage> createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  ProfileScreenController controller = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            width: double.maxFinite,
            padding: getPadding(left: 20, top: 19, right: 20, bottom: 19),
            decoration: AppDecoration.white,
            child: Row(
              children: [
                Text("lbl_profile".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headlineMedium),
              ],
            )),
        Obx(() {
          return Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: getPadding(left: 20, top: 16),
                  child: Row(children: [
                    Container(
                      height: getSize(100),
                      width: getSize(100),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: controller.user_image.value.isNotEmpty
                                  ? CachedNetworkImageProvider(
                                      controller.user_image.value)
                                  : fs.Svg(ImageConstant.imgAvtar1),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(width: 20),
                    Padding(
                        padding: getPadding(left: 23, top: 26, bottom: 23),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(controller.user.value,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.titleMedium),
                              Padding(
                                  padding: getPadding(top: 6),
                                  child: Text(controller.user_email.value,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.bodyLargeGray600_1))
                            ]))
                  ])));
        }),
        GestureDetector(
            onTap: () {
              onTapProfile();
            },
            child: Container(
                margin: getMargin(left: 20, top: 40, right: 20),
                padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
                decoration: AppDecoration.fill9
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgUserBlack900,
                          height: getSize(24),
                          width: getSize(24)),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                          padding: getPadding(left: 12, top: 4),
                          child: Text("lbl_my_profile".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.bodyLarge)),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: theme.colorScheme.onPrimary,
                        size: 20,
                      ),
                    ]))),
        GestureDetector(
            onTap: () {
              onTapProfile1();
            },
            child: Container(
                margin: getMargin(left: 20, top: 16, right: 20),
                padding: getPadding(all: 16),
                decoration: AppDecoration.fill9
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgFile,
                          height: getSize(24),
                          width: getSize(24)),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                          padding: getPadding(left: 12, top: 2, bottom: 1),
                          child: Text("lbl_about_us".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.bodyLarge)),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: theme.colorScheme.onPrimary,
                        size: 20,
                      ),
                    ]))),
        GestureDetector(
            onTap: () {
              onTapProfile3();
            },
            child: Container(
                margin: getMargin(left: 20, top: 16, right: 20),
                padding: getPadding(all: 16),
                decoration: AppDecoration.fill9
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgStar1,
                          height: getSize(24),
                          width: getSize(24),
                          radius: BorderRadius.circular(getHorizontalSize(2))),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                          padding: getPadding(left: 12, top: 2, bottom: 1),
                          child: Text("lbl_rate_us".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.bodyLarge)),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: theme.colorScheme.onPrimary,
                        size: 20,
                      ),
                    ]))),
        GestureDetector(
            onTap: () {
              onTapProfile4();
            },
            child: Container(
                margin: getMargin(left: 20, top: 16, right: 20),
                padding: getPadding(all: 16),
                decoration: AppDecoration.fill9
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgIcfeedback,
                          height: getSize(24),
                          width: getSize(24)),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                          padding: getPadding(left: 12, top: 2, bottom: 1),
                          child: Text("lbl_ticket".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.bodyLarge)),
                      const Spacer(),
                      Row(
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgArrowrightOnprimary,
                              height: getSize(24),
                              width: getSize(24),
                              margin: getMargin(top: 1)),
                        ],
                      )
                    ]))),
        GestureDetector(
          onTap: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  insetPadding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  contentPadding: EdgeInsets.zero,
                  content: const LogOutPopupScreen(),
                );
              },
            );
          },
          child: Container(
              margin: getMargin(left: 20, top: 16, right: 20, bottom: 5),
              padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
              decoration: AppDecoration.fill9
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgArrowrightBlack900,
                        height: getSize(24),
                        width: getSize(24)),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                        padding: getPadding(left: 12, top: 4),
                        child: Text("lbl_logout".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.bodyLarge)),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: theme.colorScheme.onPrimary,
                      size: 20,
                    ),
                  ])),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  insetPadding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  contentPadding: EdgeInsets.zero,
                  content: SizedBox(
                    width:
                        MediaQuery.of(context).size.width * 0.85, // 👈 أهم سطر
                    child: const DeleteAccountPopupScreen(),
                  ),
                );
              },
            );
          },
          child: Container(
            margin: getMargin(left: 20, top: 16, right: 20, bottom: 5),
            padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
            decoration: AppDecoration.fill9.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  color: Colors.red,
                  svgPath: ImageConstant.imgArrowrightBlack900,
                  height: getSize(24),
                  width: getSize(24),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: getPadding(left: 12, top: 4),
                  child: Text(
                    "delete_account".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style:
                        theme.textTheme.bodyLarge?.copyWith(color: Colors.red),
                  ),
                ),
                const Spacer(),
                Icon(Icons.arrow_forward_ios,
                    color: theme.colorScheme.onPrimary, size: 20),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  onTapProfile() {
    Get.toNamed(
      AppRoutes.myProfileScreen,
    );
  }

  onTapProfile1() {
    Get.toNamed(
      AppRoutes.aboutUsScreen,
    );
  }

  onTapProfile2() {
    Get.toNamed(
      AppRoutes.helpScreen,
    );
  }

  onTapProfile3() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.zero,
          content: const RateUsScreen(),
        );
      },
    );
  }

  onTapProfile4() {
    Get.toNamed(
      //AppRoutes.feedbackScreen,
      AppRoutes.ticketListScreen,
    );
  }
}
