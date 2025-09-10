import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurance_app/core/utils/custom_dropdown_field.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../localization/controller/localization_controller.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_elevated_button_loading.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/home_insurance_controller.dart';
import 'widgets/choose_a_date_screen.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart'
    as ht;

class HomeInsuranceContainerPage extends StatefulWidget {
  const HomeInsuranceContainerPage({super.key});

  @override
  State<HomeInsuranceContainerPage> createState() =>
      _HomeInsuranceContainerPageState();
}

class _HomeInsuranceContainerPageState
    extends State<HomeInsuranceContainerPage> {
  final HomeInsuranceController controller = Get.put(HomeInsuranceController());
  final LocalizationController localizationController =
      Get.put(LocalizationController());
  Future<void> pickCustomFiles(bool isPropertyOwn) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'jpg', 'jpeg', 'png', 'txt', 'doc'],
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      if (isPropertyOwn) {
        controller.propertyOwnerDocument.value = result.files.single.path!;
        controller.propertyOwnerDocumentController.text =
            result.files.single.name;
      } else {
        controller.inventoryListDocument.value = result.files.single.path!;
        controller.inventoryListDocumentController.text =
            result.files.single.name;
      }

      print("Selected custom file: $filePath");
    } else {
      print("File picking canceled");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage(bool isPropertyOwn) async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      if (isPropertyOwn) {
        controller.propertyOwnerDocument.value = image.path;
        controller.propertyOwnerDocumentController.text = image.name;
      } else {
        controller.inventoryListDocument.value = image.path;
        controller.inventoryListDocumentController.text = image.name;
      }
    }
  }

// Function to pick file or image
  Future<void> _pickFileOrImage(bool isPropertyOwn) async {
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
                  pickImage(isPropertyOwn);
                },
              ),
              ListTile(
                leading: const Icon(Icons.folder),
                title: Text('lbl_select_file'.tr),
                onTap: () async {
                  Navigator.pop(context);
                  pickCustomFiles(isPropertyOwn);
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
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            appBar: CustomAppBar(
              height: getVerticalSize(79),
              leadingWidth: getSize(42),
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_new_outlined,
                      size: getHorizontalSize(20))),
              centerTitle: false,
              title: AppbarTitle(text: "lbl_home_insurance_form".tr),
            ),
            bottomNavigationBar: Obx(() => controller.showMainForm.value
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      children: [
                        if (controller.currentStep.value > 0)
                          Expanded(
                            child: CustomElevatedButton(
                              onTap: controller.previousStep,
                              text: "lbl_previous".tr,
                              height: getVerticalSize(48),
                              buttonStyle:
                                  CustomButtonStyles.fillPrimary.copyWith(
                                padding: WidgetStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 16),
                                ),
                              ),
                              buttonTextStyle:
                                  CustomTextStyles.titleMediumWhiteA700,
                            ),
                          ),
                        if (controller.currentStep.value > 0 &&
                            controller.currentStep.value < 3)
                          const SizedBox(width: 16),
                        if (controller.currentStep.value < 3)
                          Expanded(
                            child: CustomElevatedButton(
                              height: getVerticalSize(48),
                              onTap: controller.nextStep,
                              text: "lbl_next".tr,
                              buttonStyle:
                                  CustomButtonStyles.fillPrimary.copyWith(
                                padding: WidgetStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 16),
                                ),
                              ),
                              buttonTextStyle:
                                  CustomTextStyles.titleMediumWhiteA700,
                            ),
                          ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: CustomElevatedButton(
                      height: getVerticalSize(48),
                      onTap: () {
                        controller.showMainForm.value = true;
                      },
                      text: "lbl_continue".tr,
                      buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 18),
                        ),
                      ),
                      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                    ),
                  )),
            body: Obx(() => controller.showMainForm.value
                ? Column(
                    children: [
                      EasyStepper(
                        stepRadius: 20,
                        enableStepTapping: false,
                        finishedStepTextColor: Colors.black87,
                        internalPadding: 10,
                        disableScroll: false,
                        //showLoadingAnimation: false,
                        // type: StepperType.horizontal,
                        onStepReached: controller.onStepTapped,
                        activeStep: controller.currentStep.value,
                        // onStepContinue: controller.nextStep,
                        // onStepCancel: controller.previousStep,
                        steps: [
                          EasyStep(
                            title: "lbl_personal".tr,
                            customStep: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor:
                                    controller.currentStep.value >= 0
                                        ? theme.primaryColor
                                        : Colors.white,
                              ),
                            ),
                          ),
                          EasyStep(
                            title: "lbl_property".tr,
                            customStep: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor:
                                    controller.currentStep.value >= 0
                                        ? theme.primaryColor
                                        : Colors.white,
                              ),
                            ),
                          ),
                          EasyStep(
                            title: "lbl_coverage".tr,
                            customStep: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor:
                                    controller.currentStep.value >= 0
                                        ? theme.primaryColor
                                        : Colors.white,
                              ),
                            ),
                          ),
                          EasyStep(
                            title: "lbl_submit".tr,
                            customStep: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor:
                                    controller.currentStep.value >= 0
                                        ? theme.primaryColor
                                        : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Form(
                          key:
                              controller.formKeys[controller.currentStep.value],
                          child: SingleChildScrollView(
                            child: controller.currentStep.value == 0
                                ? _personalDetailsStep(context)
                                : controller.currentStep.value == 1
                                    ? _propertyDetailsStep()
                                    : controller.currentStep.value == 2
                                        ? _coverageDetailsStep(context)
                                        : _reviewAndSubmitStep(),
                          ),
                        ),
                      )
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    child: Obx(() {
                      final content = controller.detailsModelData.value.data;

                      if (content == null) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).primaryColor),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                localizationController.selectedLanguage.value ==
                                        'English'
                                    ? 'Loading content...'
                                    : localizationController
                                                .selectedLanguage.value ==
                                            'عربي'
                                        ? 'جاري تحميل المحتوى...'
                                        : 'بەرنامهكە بار دهكات...',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        );
                      }

                      String description = '';
                      final lang =
                          localizationController.selectedLanguage.value;

                      if (lang == 'English') {
                        description = content.description ?? '';
                      } else if (lang == 'عربي') {
                        description = content.descriptionAr ?? '';
                      } else {
                        description = content.descriptionKr ?? '';
                      }

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8),
                            child: ht.HtmlWidget(
                              description,
                              textStyle: TextStyle(
                                fontSize: lang == 'كوردى' ? 16 : 20,
                                height: lang == 'كوردى' ? 1.5 : 2,
                              ),
                              onTapUrl: (url) async => true,
                            ),
                          ),
                        ),
                      );
                    }),
                  ))));
  }

  Widget _personalDetailsStep(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            controller: controller.nameController,
            margin: getMargin(top: 0),
            contentPadding:
                getPadding(left: 16, top: 17, right: 16, bottom: 17),
            hintText: "lbl_full_name".tr,
            textInputAction: TextInputAction.next,
            filled: true,
            fillColor: appTheme.gray200,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "lbl_required_field".tr;
              }
              return null;
            },
          ),
          CustomTextFormField(
              controller: controller.emailController,
              margin: getMargin(top: 20),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: "lbl_email_address".tr,
              textInputAction: TextInputAction.next,
              filled: true,
              fillColor: appTheme.gray200,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "lbl_required_field".tr;
                } else if (!isValidEmail(value)) {
                  return "Please enter valid email";
                }
                return null;
              }),
          CustomTextFormField(
              controller: controller.phoneController,
              textInputType: TextInputType.phone,
              margin: getMargin(top: 20),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: "lbl_mobile".tr,
              textInputAction: TextInputAction.next,
              filled: true,
              fillColor: appTheme.gray200,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "lbl_required_field".tr;
                }
                return null;
              }),
          CustomTextFormField(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(getHorizontalSize(32)),
                        topRight: Radius.circular(getHorizontalSize(32)))),
                context: context,
                builder: (context) {
                  return const ChooseADateScreen(
                    isBOD: true,
                  );
                },
              );
            },
            controller: controller.dateController,
            suffixConstraints:
                BoxConstraints(minHeight: getSize(24), maxHeight: getSize(24)),
            suffix: Padding(
              padding: getPadding(right: 16),
              child: CustomImageView(
                svgPath: ImageConstant.imgCalendreIcon,
              ),
            ),
            margin: getMargin(top: 20),
            contentPadding:
                getPadding(left: 16, top: 17, right: 16, bottom: 17),
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
            value: controller.gender.value,
            onChanged: (val) => controller.gender.value = val ?? '',
            hintText: "lbl_gender".tr,
            validator: (val) {
              if (val == null || val.isEmpty) return "lbl_required_field".tr;
              return null;
            },
            items: [
              DropdownMenuItem(
                value: "male",
                child: Row(
                  children: [
                    const Icon(Icons.male, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text("lbl_gender_male".tr),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: "female",
                child: Row(
                  children: [
                    const Icon(Icons.female, color: Colors.pink),
                    const SizedBox(width: 8),
                    Text("lbl_gender_female".tr),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _propertyDetailsStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDropdownField(
            value: controller.province.value,
            items: controller.provinces
                .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(
                      type,
                      style: CustomTextStyles.bodyLargeBlack,
                    )))
                .toList(),
            hintText: 'lbl_province'.tr,
            onChanged: (value) => controller.province.value = value!,
          ),

          const SizedBox(height: 10),
          CustomDropdownField(
            value: controller.homeType.value,
            items: ['house', 'apartment']
                .map((type) => DropdownMenuItem(
                      value: type,
                      child: Text(
                        type == 'house'
                            ? 'lbl_home_type_house'.tr
                            : 'lbl_home_type_apartment'.tr,
                        style: CustomTextStyles.bodyLargeBlack,
                      ),
                    ))
                .toList(),
            hintText: 'lbl_home_type'.tr,
            onChanged: (value) => controller.homeType.value = value!,
          ),

          //House
          controller.homeType.value == "House"
              ? Column(
                  children: [
                    CustomTextFormField(
                        controller: controller.propertyAreaController,
                        margin: getMargin(top: 10),
                        contentPadding: getPadding(
                            left: 16, top: 17, right: 16, bottom: 17),
                        hintText: 'lbl_property_area'.tr,
                        textInputAction: TextInputAction.next,
                        filled: true,
                        fillColor: appTheme.gray200,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "lbl_required_field".tr;
                          }
                          return null;
                        }),
                    CustomTextFormField(
                        controller: controller.propertyBlockController,
                        margin: getMargin(top: 10),
                        contentPadding: getPadding(
                            left: 16, top: 17, right: 16, bottom: 17),
                        hintText: 'lbl_property_block'.tr,
                        textInputAction: TextInputAction.next,
                        filled: true,
                        fillColor: appTheme.gray200,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "lbl_required_field".tr;
                          }
                          return null;
                        }),
                    CustomTextFormField(
                        controller: controller.propertyAlleyController,
                        margin: getMargin(top: 10),
                        contentPadding: getPadding(
                            left: 16, top: 17, right: 16, bottom: 17),
                        hintText: 'lbl_property_alley'.tr,
                        textInputAction: TextInputAction.next,
                        filled: true,
                        fillColor: appTheme.gray200,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "lbl_required_field".tr;
                          }
                          return null;
                        }),
                    CustomTextFormField(
                        controller: controller.propertyHouseController,
                        margin: getMargin(top: 10),
                        contentPadding: getPadding(
                            left: 16, top: 17, right: 16, bottom: 17),
                        hintText: 'lbl_property_house'.tr,
                        textInputAction: TextInputAction.next,
                        filled: true,
                        fillColor: appTheme.gray200,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "lbl_required_field".tr;
                          }
                          return null;
                        }),
                  ],
                )
              : const SizedBox(),

          controller.homeType.value == "Apartment"
              ? Column(
                  children: [
                    CustomTextFormField(
                        controller: controller.propertyProjectController,
                        margin: getMargin(top: 10),
                        contentPadding: getPadding(
                            left: 16, top: 17, right: 16, bottom: 17),
                        hintText: 'lbl_property_project'.tr,
                        textInputAction: TextInputAction.next,
                        filled: true,
                        fillColor: appTheme.gray200,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "lbl_required_field".tr;
                          }
                          return null;
                        }),
                    CustomTextFormField(
                        controller: controller.propertyHouseController,
                        margin: getMargin(top: 10),
                        contentPadding: getPadding(
                            left: 16, top: 17, right: 16, bottom: 17),
                        hintText: 'lbl_property_building'.tr,
                        textInputAction: TextInputAction.next,
                        filled: true,
                        fillColor: appTheme.gray200,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "lbl_required_field".tr;
                          }
                          return null;
                        }),
                    CustomTextFormField(
                        controller: controller.propertyFloorController,
                        margin: getMargin(top: 10),
                        contentPadding: getPadding(
                            left: 16, top: 17, right: 16, bottom: 17),
                        hintText: 'lbl_property_floor'.tr,
                        textInputAction: TextInputAction.next,
                        filled: true,
                        fillColor: appTheme.gray200,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "lbl_required_field".tr;
                          }
                          return null;
                        }),
                    CustomTextFormField(
                        controller: controller.propertyApartmentController,
                        margin: getMargin(top: 10),
                        contentPadding: getPadding(
                            left: 16, top: 17, right: 16, bottom: 17),
                        hintText: 'lbl_property_apartment'.tr,
                        textInputAction: TextInputAction.next,
                        filled: true,
                        fillColor: appTheme.gray200,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "lbl_required_field".tr;
                          }
                          return null;
                        }),
                  ],
                )
              : const SizedBox(),

          CustomTextFormField(
              controller: controller.propertyAddressController,
              margin: getMargin(top: 10),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: 'lbl_property_address'.tr,

              ///"lbl_mobile".tr,
              textInputAction: TextInputAction.next,
              filled: true,
              fillColor: appTheme.gray200,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "lbl_required_field".tr;
                }
                return null;
              }),
          CustomTextFormField(
              controller: controller.constructionValueController,
              isCurrency: true,
              margin: getMargin(top: 10),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: 'lbl_construction_value'.tr,
              textInputType: TextInputType.number,

              ///"lbl_mobile".tr,
              textInputAction: TextInputAction.next,
              filled: true,
              fillColor: appTheme.gray200,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "lbl_required_field".tr;
                }
                return null;
              }),
          CustomTextFormField(
              controller: controller.contentValueController,
              isCurrency: true,
              margin: getMargin(top: 10),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: 'lbl_content_value'.tr,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
              filled: true,
              fillColor: appTheme.gray200,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "lbl_required_field".tr;
                }
                return null;
              }),
          const SizedBox(height: 10),

          // DropdownButtonFormField<String>(
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return "lbl_required_field".tr;
          //     }
          //     return null;
          //   },
          //   decoration: CustomButtonStyles.defultInputDecoration,
          //   value: controller.propertyType.value.isEmpty
          //       ? null
          //       : controller.propertyType.value,
          //   hint: Text(
          //     'lbl_property_type'.tr,
          //     style: CustomTextStyles.bodyLargeBlack,
          //   ),
          //   items: ['Construction', 'Tenants Liability']
          //       .map((type) => DropdownMenuItem(
          //           value: type,
          //           child: Text(
          //             type,
          //             style: CustomTextStyles.bodyLargeBlack,
          //           )))
          //       .toList(),
          //   onChanged: (value) => controller.propertyType.value = value!,
          // ),
          CustomDropdownField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "lbl_required_field".tr;
              }
              return null;
            },
            value: controller.propertyType.value,
            items: ['construction', 'tenants_liability']
                .map((type) => DropdownMenuItem(
                      value: type,
                      child: Text(
                        type == 'construction'
                            ? 'lbl_property_type_construction'.tr
                            : 'lbl_property_type_tenants_liability'.tr,
                        style: CustomTextStyles.bodyLargeBlack,
                      ),
                    ))
                .toList(),
            hintText: 'lbl_property_type'.tr,
            onChanged: (value) => controller.propertyType.value = value!,
          ),

          CustomTextFormField(
            onTap: () {
              _pickFileOrImage(true);
            },
            controller: controller.propertyOwnerDocumentController,
            suffixConstraints:
                BoxConstraints(minHeight: getSize(24), maxHeight: getSize(24)),
            suffix: Padding(
              padding: getPadding(right: 16),
              child: CustomImageView(
                svgPath: ImageConstant.imgFile,
              ),
            ),
            margin: getMargin(top: 10),
            contentPadding:
                getPadding(left: 16, top: 17, right: 16, bottom: 17),
            hintText: "lbl_property_owner_document".tr,
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
          CustomTextFormField(
              onTap: () async {
                await _pickFileOrImage(false);
              },
              controller: controller.inventoryListDocumentController,
              suffixConstraints: BoxConstraints(
                  minHeight: getSize(24), maxHeight: getSize(24)),
              suffix: Padding(
                padding: getPadding(right: 16),
                child: CustomImageView(
                  svgPath: ImageConstant.imgFile,
                ),
              ),
              margin: getMargin(top: 10),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: "lbl_inventory_list_document".tr,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.none,
              filled: true,
              fillColor: appTheme.gray200,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "lbl_required_field".tr;
                }
                return null;
              }),
          const SizedBox(height: 10),

          Container(
            height: 200,
            alignment: Alignment.center,
            child: GridView.builder(
              itemCount: controller.images.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                return Image.file(
                  File(controller.images[index].path),
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _alertDialog() {
    if (controller.startController.text.isNotEmpty) {
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
                  padding: getPadding(left: 20, top: 24, right: 20, bottom: 24),
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
                        "lbl_your_coverage".tr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.titleLargeBold,
                      ),
                      SizedBox(height: getVerticalSize(28)),
                      Text("lbl_liability_coverage".tr,
                          style: CustomTextStyles.titleMediumPrimary),
                      SizedBox(height: getVerticalSize(10)),
                      Text("lbl_content_coverage".tr,
                          style: CustomTextStyles.titleMediumPrimary),
                      SizedBox(height: getVerticalSize(10)),
                      Text("lbl_personal_liability_coverage".tr,
                          style: CustomTextStyles.titleMediumPrimary),
                      SizedBox(height: getVerticalSize(10)),
                      Text("lbl_fire_theft_liability_coverage".tr,
                          style: CustomTextStyles.titleMediumPrimary),
                      SizedBox(height: getVerticalSize(20)),
                      Row(
                        children: [
                          Expanded(
                            child: CustomOutlinedButton(
                              text: "Close",
                              margin: getMargin(
                                right: 8,
                              ),
                              buttonStyle: CustomButtonStyles.outlinePrimary
                                  .copyWith(
                                      fixedSize:
                                          WidgetStateProperty.all<Size>(Size(
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
                        ],
                      ),
                    ],
                  )));
        },
      );
    }
  }

  Widget _coverageDetailsStep(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Icon(
              CupertinoIcons.calendar_circle,
              size: 80,
              color: appTheme.buttonColor,
            ),
          ),
          CustomTextFormField(
              onTap: () {
                // controller.pickCustomFiles(false);
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(getHorizontalSize(32)),
                          topRight: Radius.circular(getHorizontalSize(32)))),
                  context: context,
                  builder: (context) {
                    return const ChooseADateScreen(
                      isStartDate: true,
                    );
                  },
                );
              },
              controller: controller.startController,
              suffixConstraints: BoxConstraints(
                  minHeight: getSize(24), maxHeight: getSize(24)),
              suffix: Padding(
                padding: getPadding(right: 16),
                child: CustomImageView(
                  svgPath: ImageConstant.imgCalendreIcon,
                ),
              ),
              margin: getMargin(top: 20),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: "msg_policy_start_date".tr,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.none,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "lbl_required_field".tr;
                }
                return null;
              },
              filled: true,
              fillColor: appTheme.gray200),
          CustomTextFormField(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(getHorizontalSize(32)),
                          topRight: Radius.circular(getHorizontalSize(32)))),
                  context: context,
                  builder: (context) {
                    return const ChooseADateScreen(
                      isEndDate: true,
                    );
                  },
                );
              },
              controller: controller.endController,
              suffixConstraints: BoxConstraints(
                  minHeight: getSize(24), maxHeight: getSize(24)),
              suffix: Padding(
                padding: getPadding(right: 16),
                child: CustomImageView(
                  svgPath: ImageConstant.imgCalendreIcon,
                ),
              ),
              margin: getMargin(top: 20),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: "msg_policy_end_date".tr,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.none,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "lbl_required_field".tr;
                }
                return null;
              },
              filled: true,
              fillColor: appTheme.gray200),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Widget _reviewAndSubmitStep() {
  //   debugPrint("LANGUAGE == ${localizationController.selectedLanguage.value}");
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //             alignment: Alignment.center,
  //             padding: const EdgeInsets.all(8.0),
  //             decoration: BoxDecoration(
  //               border: Border.all(),
  //               borderRadius: BorderRadius.circular(12.0),
  //             ),
  //             child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Text("lbl_total_premium".tr,
  //                       style: CustomTextStyles.titleLargeBold),
  //                   const SizedBox(height: 5),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         formatCurrency(controller.calculatedTotalPremium()),
  //                         style: TextStyle(
  //                             fontWeight: controller.discountAmount > 0
  //                                 ? FontWeight.w500
  //                                 : FontWeight.w700,
  //                             decoration: controller.discountAmount > 0
  //                                 ? TextDecoration.lineThrough
  //                                 : null),
  //                       ),
  //                       controller.discountAmount > 0
  //                           ? Text(
  //                               formatCurrency((controller.totalPremium.value -
  //                                       controller.discountAmount.value))
  //                                   .toString(),
  //                               style: const TextStyle(
  //                                   fontWeight: FontWeight.w700),
  //                             )
  //                           : const SizedBox(),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 20),
  //                   Text("lbl_premium_date".tr,
  //                       style: CustomTextStyles.titleLargeBold),
  //                   const SizedBox(height: 5),
  //                   Text(
  //                       "${controller.startController.text} - ${controller.endController.text}",
  //                       style: CustomTextStyles.titleSmallBold),
  //                   const SizedBox(height: 20),
  //                   Text("lbl_premium_range".tr,
  //                       style: CustomTextStyles.titleLargeBold),
  //                   const SizedBox(height: 5),
  //                   Text(
  //                       calculateDifference(controller.startController.text,
  //                           controller.endController.text),
  //                       style: CustomTextStyles.titleSmallBold),
  //                 ])),

  //         const SizedBox(height: 10),

  //         controller.detailsModelData.value.data!.isInstallment == 1
  //             ? Column(
  //                 children: [
  //                   CheckboxListTile(
  //                     activeColor: theme.colorScheme.primary,
  //                     controlAffinity: ListTileControlAffinity.leading,
  //                     tristate: true,
  //                     title: Text("lbl_pay_installment".tr),
  //                     value: controller.selectInstallment.value,
  //                     onChanged: (value) =>
  //                         controller.selectInstallment.value = value ?? false,
  //                   ),
  //                   controller.selectInstallment.value
  //                       ? Row(
  //                           children: [
  //                             Text("lbl_installment_month".tr,
  //                                 style: CustomTextStyles.titleSmallBold),
  //                             const SizedBox(width: 10),
  //                             Text(
  //                               controller.installmentMonth.value.toString(),
  //                               style: const TextStyle(
  //                                 fontWeight: FontWeight.w400,
  //                               ),
  //                             ),
  //                           ],
  //                         )
  //                       : const SizedBox(),
  //                   controller.selectInstallment.value
  //                       ? Row(
  //                           children: [
  //                             Text("lbl_installment_per_month".tr,
  //                                 style: CustomTextStyles.titleSmallBold),
  //                             const SizedBox(width: 10),
  //                             Text(
  //                               controller.calculateInstallment().toString(),
  //                               style: const TextStyle(
  //                                 fontWeight: FontWeight.w400,
  //                               ),
  //                             ),
  //                           ],
  //                         )
  //                       : const SizedBox(),
  //                   const SizedBox(height: 20),
  //                   controller.detailsModelData.value.data!.isInstallment == 1
  //                       ? Column(
  //                           children: [
  //                             CheckboxListTile(
  //                               activeColor: theme.colorScheme.primary,
  //                               controlAffinity:
  //                                   ListTileControlAffinity.leading,
  //                               tristate: true,
  //                               title: Text("lbl_pay_installment".tr,
  //                                   style: CustomTextStyles.titleLargeBold),
  //                               value: controller.selectInstallment.value,
  //                               onChanged: (value) => controller
  //                                   .selectInstallment.value = value ?? false,
  //                             ),
  //                             controller.selectInstallment.value
  //                                 ? Row(
  //                                     children: [
  //                                       Text("lbl_installment_month".tr,
  //                                           style: CustomTextStyles
  //                                               .titleLargeBold),
  //                                       const SizedBox(width: 10),
  //                                       Text(
  //                                         controller.installmentMonth.value
  //                                             .toString(),
  //                                         style:
  //                                             CustomTextStyles.titleSmallBold,
  //                                       ),
  //                                     ],
  //                                   )
  //                                 : const SizedBox(),
  //                             controller.selectInstallment.value
  //                                 ? Row(
  //                                     children: [
  //                                       Text("lbl_installment_per_month".tr,
  //                                           style: CustomTextStyles
  //                                               .titleLargeBold),
  //                                       const SizedBox(width: 10),
  //                                       Text(
  //                                         controller
  //                                             .calculateInstallment()
  //                                             .toString(),
  //                                         style: const TextStyle(
  //                                           fontWeight: FontWeight.w400,
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   )
  //                                 : const SizedBox(),
  //                           ],
  //                         )
  //                       : const SizedBox(),
  //                 ],
  //               )
  //             : const SizedBox(),
  //         const SizedBox(height: 20),
  //         Text("lbl_terms_n_condition".tr,
  //             style: CustomTextStyles.titleSmallBold),
  //         localizationController.selectedLanguage.value == 'English'
  //             ? ht.HtmlWidget(
  //                 controller.detailsModelData.value.data?.termCondition ??
  //                     "English")
  //             : localizationController.selectedLanguage.value == 'عربي'
  //                 ? ht.HtmlWidget(
  //                     controller.detailsModelData.value.data?.termConditionAr ??
  //                         "")
  //                 : ht.HtmlWidget(
  //                     controller.detailsModelData.value.data?.termConditionKr ??
  //                         ''),
  //         const SizedBox(height: 20.0),
  //         //coupon
  //         Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Expanded(
  //                 child: CustomTextFormField(
  //                   onTap: () {},
  //                   controller: controller.couponController,
  //                   margin: getMargin(top: 0),
  //                   contentPadding:
  //                       getPadding(left: 16, top: 17, right: 16, bottom: 17),
  //                   hintText: "lbl_coupon_code".tr,
  //                   textInputAction: TextInputAction.next,
  //                   textInputType: TextInputType.text,
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return "lbl_required_field".tr;
  //                     }
  //                     return null;
  //                   },
  //                   filled: true,
  //                   fillColor: appTheme.gray200,
  //                 ),
  //               ),
  //               Expanded(
  //                   child: CustomElevatedButton(
  //                       text: "lbl_apply".tr,
  //                       margin: getMargin(left: 10, right: 10, bottom: 0),
  //                       buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
  //                           fixedSize: WidgetStateProperty.all<Size>(
  //                               Size(double.maxFinite, getVerticalSize(55)))),
  //                       buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
  //                       onTap: () {
  //                         if (controller.couponController.text.isNotEmpty) {
  //                           controller.submitCoupon();
  //                         }
  //                       }))
  //             ]),
  //         CheckboxListTile(
  //           activeColor: theme.colorScheme.primary,
  //           controlAffinity: ListTileControlAffinity.leading,
  //           tristate: true,
  //           title: Text("lbl_accept_condition".tr),
  //           value: controller.acceptCondition.value,
  //           onChanged: (value) =>
  //               controller.acceptCondition.value = value ?? false,
  //         ),
  //         Center(
  //             child: Obx(
  //           () => controller.isLoading.value
  //               ? CustomElevatedButtonLoading(
  //                   text: "lbl_confirm".tr,
  //                   margin: getMargin(left: 20, right: 20, bottom: 32),
  //                   buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
  //                       fixedSize: WidgetStateProperty.all<Size>(
  //                           Size(double.maxFinite, getVerticalSize(54)))),
  //                   buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
  //                 )
  //               : CustomElevatedButton(
  //                   text: "lbl_confirm".tr,
  //                   margin: getMargin(left: 20, right: 20, bottom: 32),
  //                   buttonStyle: controller.acceptCondition.value
  //                       ? CustomButtonStyles.fillPrimary.copyWith(
  //                           fixedSize: WidgetStateProperty.all<Size>(
  //                               Size(double.maxFinite, getVerticalSize(54))))
  //                       : CustomButtonStyles.outlineBlack900.copyWith(
  //                           fixedSize: WidgetStateProperty.all<Size>(
  //                               Size(double.maxFinite, getVerticalSize(54)))),
  //                   buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
  //                   onTap: () {
  //                     if (controller.acceptCondition.value) {
  //                       controller.submitForm();
  //                     }
  //                   }),
  //         )),
  //       ],
  //     ),
  //   );
  // }

  Widget _reviewAndSubmitStep() {
    debugPrint("LANGUAGE == ${localizationController.selectedLanguage.value}");
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Premium Summary Card
          _buildPremiumSummaryCard(),

          const SizedBox(height: 32),

          // Coupon Section
          _buildCouponSection(),

          const SizedBox(height: 32),

          // Terms & Conditions Section
          _buildTermsAndConditions(),

          const SizedBox(height: 24),

          // Accept Conditions Checkbox
          _buildAcceptConditionsCheckbox(),

          const SizedBox(height: 32),

          // Confirm Button
          _buildConfirmButton(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// ---------- Premium Summary Card ----------
  Widget _buildPremiumSummaryCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            _buildTotalPremiumSection(),
            const SizedBox(height: 32),
            _divider(),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(child: _buildPremiumDateSection()),
                const SizedBox(width: 24),
                Expanded(child: _buildPremiumRangeSection()),
              ],
            ),
            if (_isInstallmentAvailable()) ...[
              const SizedBox(height: 32),
              _divider(),
              const SizedBox(height: 24),
              _buildInstallmentSection(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTotalPremiumSection() {
    final hasDiscount = controller.discountAmount > 0;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "lbl_total_premium".tr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: hasDiscount
                    ? Colors.red.withOpacity(0.1)
                    : Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                formatCurrency(controller.calculatedTotalPremium()),
                style: TextStyle(
                  fontSize: hasDiscount ? 20 : 32,
                  fontWeight: hasDiscount ? FontWeight.w500 : FontWeight.bold,
                  decoration: hasDiscount ? TextDecoration.lineThrough : null,
                  color:
                      hasDiscount ? Colors.grey.shade500 : Colors.grey.shade800,
                ),
              ),
            ),
            if (hasDiscount) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  formatCurrency(
                    controller.totalPremium.value -
                        controller.discountAmount.value,
                  ),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "DISCOUNT APPLIED",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }

  Widget _buildPremiumDateSection() {
    return _infoCard(
      icon: Icons.calendar_today_rounded,
      title: "lbl_premium_date".tr,
      value:
          "${controller.startController.text} - ${controller.endController.text}",
      color: Colors.blue,
    );
  }

  Widget _buildPremiumRangeSection() {
    return _infoCard(
      icon: Icons.access_time_rounded,
      title: "lbl_premium_range".tr,
      value: calculateDifference(
        controller.startController.text,
        controller.endController.text,
      ),
      color: Colors.purple,
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  /// ---------- Installments ----------
  bool _isInstallmentAvailable() =>
      controller.detailsModelData.value.data!.isInstallment == 1;

  Widget _buildInstallmentSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.payment_rounded, color: Colors.orange, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: CheckboxListTile(
                  activeColor: Colors.orange,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "lbl_pay_installment".tr,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  value: controller.selectInstallment.value,
                  onChanged: (value) =>
                      controller.selectInstallment.value = value ?? false,
                ),
              ),
            ],
          ),
          if (controller.selectInstallment.value) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_installment_month".tr,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${controller.installmentMonth.value} months",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.orange.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_installment_per_month".tr,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        formatCurrency(controller.calculateInstallment()),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// ---------- Coupon Section ----------
  Widget _buildCouponSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade50, Colors.blue.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.purple.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.local_offer_rounded, color: Colors.purple, size: 24),
              const SizedBox(width: 12),
              Text(
                "Coupon Code",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: CustomTextFormField(
                    autofocus: false,
                    onTap: () {},
                    controller: controller.couponController,
                    contentPadding:
                        getPadding(left: 16, top: 17, right: 16, bottom: 17),
                    hintText: "lbl_coupon_code".tr,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "lbl_required_field".tr;
                      }
                      return null;
                    },
                    filled: false,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: Container(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.couponController.text.isNotEmpty) {
                        controller.submitCoupon();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "lbl_apply".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ---------- Terms & Conditions ----------
  Widget _buildTermsAndConditions() {
    final language = localizationController.selectedLanguage.value;
    Widget termsContent;

    switch (language) {
      case 'English':
        termsContent = ht.HtmlWidget(
            controller.detailsModelData.value.data?.termCondition ?? "English");
        break;
      case 'عربي':
        termsContent = ht.HtmlWidget(
            controller.detailsModelData.value.data?.termConditionAr ?? "");
        break;
      default:
        termsContent = ht.HtmlWidget(
            controller.detailsModelData.value.data?.termConditionKr ?? "");
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.description_rounded,
                  color: Colors.grey.shade600, size: 24),
              const SizedBox(width: 12),
              Text(
                "lbl_terms_n_condition".tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          termsContent,
        ],
      ),
    );
  }

  /// ---------- Accept Conditions ----------
  Widget _buildAcceptConditionsCheckbox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
      ),
      child: CheckboxListTile(
        activeColor: theme.colorScheme.primary,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        title: Text(
          "lbl_accept_condition".tr,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        value: controller.acceptCondition.value,
        onChanged: (value) => controller.acceptCondition.value = value ?? false,
      ),
    );
  }

  /// ---------- Confirm Button ----------
  Widget _buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: Obx(() {
        final isAccepted = controller.acceptCondition.value;
        final isLoading = controller.isLoading.value;

        return ElevatedButton(
          onPressed: isAccepted && !isLoading ? controller.submitForm : null,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isAccepted ? theme.colorScheme.primary : Colors.grey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: isAccepted ? 4 : 0,
            shadowColor: theme.colorScheme.primary.withOpacity(0.3),
          ),
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  "lbl_confirm".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
        );
      }),
    );
  }

  /// ---------- Divider ----------
  Widget _divider() {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.grey.shade300,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
