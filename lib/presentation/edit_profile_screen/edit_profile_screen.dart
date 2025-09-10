import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:image_picker/image_picker.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/core/utils/custom_dropdown_field.dart';
import 'package:insurance_app/core/utils/validation_functions.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_icon_button.dart';
import 'package:insurance_app/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import 'controller/edit_profile_controller.dart';
import 'package:image/image.dart' as img;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  EditProfileController controller = Get.put(EditProfileController());
  // @override
  // void initState() {
  //   setSafeAreaColor();
  //   super.initState();
  // }
  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage(bool isCamera) async {
    XFile? image;
    if (isCamera) {
      image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      final File file = File(image.path);
      final img.Image? originalImage = img.decodeImage(file.readAsBytesSync());

      if (originalImage != null) {
        final img.Image resizedImage =
            img.copyResize(originalImage, width: 800);
        final compressedFile = File(image.path)
          ..writeAsBytesSync(img.encodeJpg(resizedImage, quality: 75));

        controller.image.value = compressedFile.path;
      }
    }
  }

// Function to pick file or image
  Future<void> _pickFileOrImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text('lbl_take_photo'.tr),
                onTap: () async {
                  Navigator.pop(context);
                  pickImage(true);
                },
              ),
              ListTile(
                leading: const Icon(Icons.album),
                title: Text('lbl_select_file'.tr),
                onTap: () async {
                  Navigator.pop(context);
                  pickImage(false);
                },
              ),
            ],
          ),
        );
      },
    );
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
                centerTitle: false,
                title: AppbarTitle(text: "lbl_edit_profile".tr),
              ),
              body: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: getPadding(
                            left: 20, top: 16, right: 20, bottom: 16),
                        child: Obx(() {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: getSize(100),
                                          width: getSize(100),
                                          child: Stack(
                                              alignment: Alignment.bottomRight,
                                              children: [
                                                controller
                                                        .image.value.isNotEmpty
                                                    ? ClipOval(
                                                        clipBehavior:
                                                            Clip.hardEdge,
                                                        child: Image.file(
                                                          File(controller
                                                              .image.value),
                                                          height: getSize(100),
                                                          width: getSize(100),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )
                                                    : Container(
                                                        height: getSize(100),
                                                        width: getSize(100),
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: controller
                                                                        .userImage
                                                                        .isNotEmpty
                                                                    ? CachedNetworkImageProvider(
                                                                        controller
                                                                            .userImage)
                                                                    : fs.Svg(
                                                                        ImageConstant
                                                                            .imgAvtar1),
                                                                fit: BoxFit
                                                                    .cover))),
                                                CustomIconButton(
                                                    onTap: () {
                                                      _pickFileOrImage();
                                                    },
                                                    height: 40,
                                                    width: 40,
                                                    padding: getPadding(all: 8),
                                                    decoration:
                                                        IconButtonStyleHelper
                                                            .outlineBlack900,
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgClockBlack900))
                                              ])),
                                      // Padding(
                                      //     padding: getPadding(
                                      //         left: 23, top: 26, bottom: 23),
                                      //     child: Column(
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.start,
                                      //         children: [
                                      //           Text("lbl_john_abram".tr,
                                      //               overflow: TextOverflow.ellipsis,
                                      //               textAlign: TextAlign.left,
                                      //               style:
                                      //                   theme.textTheme.titleMedium),
                                      //           Padding(
                                      //               padding: getPadding(top: 6),
                                      //               child: Text(
                                      //                   "msg_johnabram_gmail_com".tr,
                                      //                   overflow:
                                      //                       TextOverflow.ellipsis,
                                      //                   textAlign: TextAlign.left,
                                      //                   style: CustomTextStyles
                                      //                       .bodyLargeGray600_1))
                                      //         ]))
                                    ]),
                                CustomTextFormField(
                                    controller: controller.firstnameController,
                                    margin: getMargin(top: 40),
                                    contentPadding: getPadding(
                                        left: 16,
                                        top: 17,
                                        right: 16,
                                        bottom: 17),
                                    hintText: "lbl_full_name".tr,
                                    textInputAction: TextInputAction.next,
                                    filled: true,
                                    fillColor: appTheme.gray50),
                                CustomTextFormField(
                                    controller: controller.phoneController,
                                    margin: getMargin(top: 22),
                                    contentPadding: getPadding(
                                        left: 16,
                                        top: 17,
                                        right: 16,
                                        bottom: 17),
                                    hintText: "lbl_mobile".tr,
                                    textInputAction: TextInputAction.next,
                                    filled: true,
                                    fillColor: appTheme.gray50),
                                IgnorePointer(
                                  ignoring: true,
                                  child: CustomTextFormField(
                                      controller: controller.emailoneController,
                                      margin: getMargin(top: 22, bottom: 5),
                                      contentPadding: getPadding(
                                          left: 15,
                                          top: 17,
                                          right: 15,
                                          bottom: 17),
                                      hintText: "lbl_email_address".tr,
                                      textInputType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidEmail(value,
                                                isRequired: true))) {
                                          return "Please enter valid email";
                                        }
                                        return null;
                                      },
                                      filled: true,
                                      fillColor: appTheme.gray50),
                                ),
                                CustomTextFormField(
                                  onTap: () async {
                                    final date = await showDatePickerDialog(
                                      context: context,
                                      minDate: DateTime(1900, 1, 1),
                                      maxDate: DateTime.now(),
                                    );
                                    if (date != null) {
                                      controller.dobController.text =
                                          date.format('yyyy-MM-dd');
                                    }
                                    debugPrint("DOB DATE === $date");
                                  },
                                  controller: controller.dobController,
                                  suffixConstraints: BoxConstraints(
                                      minHeight: getSize(24),
                                      maxHeight: getSize(24)),
                                  suffix: Padding(
                                    padding: getPadding(right: 16),
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgCalendreIcon,
                                    ),
                                  ),
                                  margin: getMargin(top: 20),
                                  contentPadding: getPadding(
                                      left: 16, top: 17, right: 16, bottom: 17),
                                  hintText: "lbl_dob".tr,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.none,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "lbl_required_field".tr;
                                    }
                                    return null;
                                  },
                                  filled: true,
                                  fillColor: appTheme.gray200,
                                ),
                                const SizedBox(height: 20),
                                CustomDropdownField(
                                  value: controller.gender.value.toLowerCase(),
                                  onChanged: (val) {
                                    controller.gender.value = val ?? '';
                                  },
                                  hintText: "lbl_gender".tr,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "lbl_required_field".tr;
                                    }
                                    return null;
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      value: "male",
                                      child: Row(
                                        children: [
                                          const Icon(Icons.male,
                                              color: Colors.blue),
                                          const SizedBox(width: 8),
                                          Text("lbl_gender_male".tr),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "female",
                                      child: Row(
                                        children: [
                                          const Icon(Icons.female,
                                              color: Colors.pink),
                                          const SizedBox(width: 8),
                                          Text("lbl_gender_female".tr),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "other",
                                      child: Row(
                                        children: [
                                          const Icon(Icons.transgender,
                                              color: Colors.grey),
                                          const SizedBox(width: 8),
                                          Text("lbl_gender_other".tr),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                CustomTextFormField(
                                    controller: controller.addressController,
                                    margin: getMargin(top: 22, bottom: 5),
                                    contentPadding: getPadding(
                                        left: 15,
                                        top: 17,
                                        right: 15,
                                        bottom: 17),
                                    hintText: "lbl_address".tr,
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) {
                                      return null;
                                    },
                                    filled: true,
                                    fillColor: appTheme.gray50),
                                CustomTextFormField(
                                    controller: controller.bioController,
                                    margin: getMargin(top: 22, bottom: 5),
                                    contentPadding: getPadding(
                                        left: 15,
                                        top: 17,
                                        right: 15,
                                        bottom: 17),
                                    hintText: "lbl_bio".tr,
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) {
                                      return null;
                                    },
                                    filled: true,
                                    fillColor: appTheme.gray50)
                              ]);
                        }))),
              ),
              bottomNavigationBar: CustomElevatedButton(
                  onTap: () {
                    controller.submitProfile();
                    //Get.back();
                  },
                  text: "lbl_save".tr,
                  margin: getMargin(left: 20, right: 20, bottom: 32),
                  buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                      fixedSize: WidgetStateProperty.all<Size>(
                          Size(double.maxFinite, getVerticalSize(54)))),
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA700))),
    );
  }

  onTapEditprofile() {
    Get.back();
  }
}
