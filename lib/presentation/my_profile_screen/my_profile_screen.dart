import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:insurance_app/widgets/app_bar/appbar_image.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_icon_button.dart';

import '../../widgets/app_bar/appbar_title.dart';
import 'controller/my_profile_controller.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  MyProfileController controller = Get.put(MyProfileController());

  @override
  void initState() {
    setSafeAreaColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: appTheme.whiteA700,
              appBar: CustomAppBar(
                height: getVerticalSize(79),
                leadingWidth: getSize(42),
                leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20,
                    )),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgEditIcon,
                      onTap: onTapEdit),
                ],
                centerTitle: false,
                title: AppbarTitle(text: "lbl_my_profile".tr),
              ),
              body: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 20, top: 16, right: 20, bottom: 16),
                  child: SingleChildScrollView(
                    child: Obx(() {
                      UserData? _tempData =
                          controller.myProfileModelObj.value.data ?? null;
                      return _tempData == null
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  Row(children: [
                                    Container(
                                      height: getSize(100),
                                      width: getSize(100),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: _tempData.imagePath != null
                                                  ? CachedNetworkImageProvider(
                                                      _tempData.imagePath)
                                                  : fs.Svg(
                                                      ImageConstant.imgAvtar1),
                                              fit: BoxFit.cover)),
                                    ),
                                    Padding(
                                        padding: getPadding(
                                            left: 23, top: 26, bottom: 23),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(_tempData.name ?? '',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.titleMedium),
                                              Padding(
                                                  padding: getPadding(top: 6),
                                                  child: Text(
                                                      _tempData.email ?? '',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: CustomTextStyles
                                                          .bodyLargeGray600_1))
                                            ]))
                                  ]),
                                  SizedBox(height: getVerticalSize(40)),
                                  profileOption(
                                      "lbl_full_name".tr, _tempData.name),
                                  SizedBox(
                                    height: getVerticalSize(16),
                                  ),
                                  profileOption(
                                      "lbl_mobile".tr, _tempData.phone),
                                  SizedBox(
                                    height: getVerticalSize(16),
                                  ),
                                  profileOption(
                                      "lbl_email_address".tr, _tempData.email),
                                  SizedBox(
                                    height: getVerticalSize(16),
                                  ),
                                  profileOption(
                                      "lbl_address".tr, _tempData.address),
                                  SizedBox(
                                    height: getVerticalSize(16),
                                  ),
                                  profileOption(
                                    "lbl_dob".tr,
                                    (_tempData.dob != null &&
                                            _tempData.dob.toString().length >=
                                                10)
                                        ? _tempData.dob
                                            .toString()
                                            .substring(0, 10)
                                        : "-",
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(16),
                                  ),
                                  profileOption(
                                      "lbl_gender".tr, _tempData.gender),
                                  SizedBox(
                                    height: getVerticalSize(16),
                                  ),
                                  profileOption("lbl_bio".tr, _tempData.bio),
                                ]);
                    }),
                  )))),
    );
  }

  Widget profileOption(title, value) {
    return Container(
      width: double.infinity,
      decoration: AppDecoration.fillgray5010
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
      child: Padding(
        padding: getPadding(all: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: getSize(25),
              child: Text(
                title,
                style: CustomTextStyles.bodyLargeGray600_1,
              ),
            ),
            SizedBox(
              height: getVerticalSize(4),
            ),
            Container(
                height: getSize(27),
                child: Text(
                  value,
                  style: CustomTextStyles.titleMediumSemiBold_1,
                ))
          ],
        ),
      ),
    );
  }

  onTapEdit() {
    Get.toNamed(AppRoutes.editProfileScreen,
        arguments: controller.myProfileModelObj.value.data ?? null);
  }
}
