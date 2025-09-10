import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurance_app/added/custom_drop_search_widget.dart';
import 'package:insurance_app/core/utils/custom_dropdown_field.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../localization/controller/localization_controller.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_elevated_button_loading.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/car_insurance_controller.dart';
import 'models/car_insurance_details_model.dart';
import 'widgets/choose_a_date_screen.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart'
    as ht;

class CarInsuranceContainerPage extends StatefulWidget {
  const CarInsuranceContainerPage({super.key});

  @override
  State<CarInsuranceContainerPage> createState() =>
      _CarInsuranceContainerPageState();
}

class _CarInsuranceContainerPageState extends State<CarInsuranceContainerPage> {
  final CarInsuranceController controller = Get.put(CarInsuranceController());
  final LocalizationController localizationController =
      Get.put(LocalizationController());
  final ImagePicker _picker = ImagePicker();
  Future<void> pickCustomFiles(bool isPropertyOwn) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'jpg', 'jpeg', 'png', 'txt', 'doc'],
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      if (isPropertyOwn) {
        controller.ownerIdDocument.value = result.files.single.path!;
        controller.ownerIdDocumentController.text = result.files.single.name;
      } else {
        controller.carRegistrationDocument.value = result.files.single.path!;
        controller.carRegistrationDocumentController.text =
            result.files.single.name;
      }

      print("Selected custom file: $filePath");
    } else {
      print("File picking canceled");
    }
  }

  Future<void> pickImage(bool isPropertyOwn) async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      if (isPropertyOwn) {
        controller.ownerIdDocument.value = image.path;
        controller.ownerIdDocumentController.text = image.name;
      } else {
        controller.carRegistrationDocument.value = image.path;
        controller.carRegistrationDocumentController.text = image.name;
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
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
              height: getVerticalSize(79),
              leadingWidth: getSize(42),
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios,
                      color: Colors.black, size: 20)),
              centerTitle: false,
              title: AppbarTitle(text: "lbl_car_insurance_form"),
            ),
            bottomNavigationBar: Obx(
              () => controller.showMainForm.value
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 32),
                      child: Row(
                        children: [
                          if (controller.currentStep.value > 0)
                            Expanded(
                              child: CustomElevatedButton(
                                onTap: () {
                                  controller.previousStep();
                                },
                                text: "lbl_previous".tr,
                                buttonStyle:
                                    CustomButtonStyles.fillPrimary.copyWith(
                                  fixedSize: WidgetStateProperty.all<Size>(
                                    Size(double.infinity, getVerticalSize(50)),
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
                                onTap: () {
                                  controller.nextStep();
                                },
                                text: "lbl_next".tr,
                                buttonStyle:
                                    CustomButtonStyles.fillPrimary.copyWith(
                                  fixedSize: WidgetStateProperty.all<Size>(
                                    Size(double.infinity, getVerticalSize(50)),
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
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 32),
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                          onTap: () {
                            controller.showMainForm.value = true;
                          },
                          text: "lbl_continue".tr,
                          buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                            fixedSize: WidgetStateProperty.all<Size>(
                              Size(double.infinity, getVerticalSize(50)),
                            ),
                          ),
                          buttonTextStyle:
                              CustomTextStyles.titleMediumWhiteA700,
                        ),
                      ),
                    ),
            ),
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
                            title: "lbl_car".tr,
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
                                    ? _carDetailsStep()
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: controller.detailsModelData.value.description !=
                                null
                            ? SingleChildScrollView(
                                padding: EdgeInsets.all(8),
                                physics: BouncingScrollPhysics(),
                                child: Builder(
                                  builder: (context) {
                                    if (localizationController
                                            .selectedLanguage.value ==
                                        'English') {
                                      return ht.HtmlWidget(
                                        controller.detailsModelData.value
                                                .description ??
                                            "",
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          height: 2,
                                        ),
                                      );
                                    } else if (localizationController
                                            .selectedLanguage.value ==
                                        'عربي') {
                                      return ht.HtmlWidget(
                                        controller.detailsModelData.value
                                                .descriptionAr ??
                                            "",
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          height: 2,
                                        ),
                                      );
                                    } else {
                                      return ht.HtmlWidget(
                                        controller.detailsModelData.value
                                                .descriptionKr ??
                                            '',
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          height: 2,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.all(24),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
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
              } else if (calculateAge(value) < 18) {
                return "lbl_age_less_18".tr;
              }
              return null;
            },
            filled: true,
            fillColor: appTheme.gray200,
          ),
          const SizedBox(height: 20),
          CustomDropdownField(
            value: controller.gender.value,
            onChanged: (value) => controller.gender.value = value!,
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

  Widget _carDetailsStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // CustomDropSearchWidget(
          //     overlayPortalController: OverlayPortalController(),
          //     onItemSelected: (item) {
          //       //controller.selectCarBrand(item);
          //     }),
          CustomDropSearchWidget(
              overlayPortalController: OverlayPortalController(),
              onItemSelected: (item) {
                controller.selectCarBrand(item);
              },
              items: controller.carBrandList),
          // DropdownButtonFormField<Brand>(
          //   value: (controller.carBrand.value.name?.isEmpty ?? true)
          //       ? null
          //       : controller.carBrand.value,
          //   onChanged: (value) => controller.selectCarBrand(value),
          //   validator: (value) {
          //     if (value == null) {
          //       return "lbl_required_field".tr;
          //     }
          //     return null;
          //   },
          //   decoration: InputDecoration(
          //     contentPadding:
          //         const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          //     fillColor: Colors.grey[200],
          //     filled: true,
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10),
          //       borderSide: const BorderSide(color: Colors.grey),
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10),
          //       borderSide: const BorderSide(color: Colors.grey),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10),
          //       borderSide: const BorderSide(color: Colors.grey),
          //     ),
          //   ),
          //   hint: Text(
          //     "lbl_car_brand".tr,
          //     style: const TextStyle(fontSize: 16, color: Colors.black),
          //   ),
          //   dropdownColor: Colors.white,
          //   icon: const Icon(Icons.keyboard_arrow_down),
          //   style: const TextStyle(fontSize: 16, color: Colors.black),
          //   isExpanded: true,
          //   items: controller.carBrandList
          //       .toSet()
          //       .map((value) => DropdownMenuItem<Brand>(
          //             value: value,
          //             child: Text(value.name ?? '',
          //                 style: const TextStyle(
          //                     fontSize: 16, color: Colors.black)),
          //           ))
          //       .toList(),
          // ),
          const SizedBox(height: 10),
          controller.carBrand.value.name != null
              ? DropdownButtonFormField<Brand>(
                  value: controller.carModelList
                          .contains(controller.carModel.value)
                      ? controller.carModel.value
                      : null,
                  onChanged: (value) => controller.carModel.value = value!,
                  validator: (value) {
                    if (value == null) {
                      return "lbl_required_field".tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  hint: Text(
                    "lbl_car_model".tr,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  isExpanded: true,
                  items: controller.carModelList
                      .toSet()
                      .map((value) => DropdownMenuItem<Brand>(
                            value: value,
                            child: Text(
                              value.name ?? '',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ))
                      .toList(),
                )
              : const SizedBox(),
          CustomTextFormField(
              controller: controller.manufactureYearController,
              margin: getMargin(top: 10),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: 'lbl_manufacture_year'.tr,
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
          CustomTextFormField(
              controller: controller.chassisNumberController,
              margin: getMargin(top: 10),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: 'lbl_chasis_number'.tr,
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
              controller: controller.carNumberPlateController,
              margin: getMargin(top: 10),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: 'lbl_number_plate'.tr,
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
              controller: controller.carSeatController,
              margin: getMargin(top: 10),
              textInputType: TextInputType.number,
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: 'lbl_no_seat'.tr,
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
              controller: controller.carValueController,
              isCurrency: true,
              margin: getMargin(top: 10, bottom: 0),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: 'lbl_car_value'.tr,
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
            onTap: () async {
              await _pickFileOrImage(true);
            },
            controller: controller.ownerIdDocumentController,
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
            hintText: "lbl_owner_id".tr,
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
              controller: controller.carRegistrationDocumentController,
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
              hintText: "lbl_car_registration_document".tr,
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
          ImageButton(
            onTap: controller.selectImages,
          ),
          Text(
              'please take pictures of: \n 1- front of your car\n 2- rare of your car\n 3- left of your car\n 4- right of your car\n 5- vim number (windshield)\n 6- top of your car'
                  .tr),
          Container(
            margin: EdgeInsets.all(10),
            height: 300,
            alignment: Alignment.center,
            child: GridView.builder(
              itemCount: controller.images.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
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

  Widget _coverageDetailsStep(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<TypeModel>(
            validator: (value) {
              if (value == null) {
                return "lbl_required_field".tr;
              }
              return null;
            },
            value: (controller.selectDropDown.value.name?.isEmpty ?? true)
                ? null
                : controller.selectDropDown.value,
            onChanged: (value) => controller.selectPlan(value!),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              fillColor: Colors.grey[200],
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
            hint: Text(
              "lbl_insurance_plan".tr,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            dropdownColor: Colors.white,
            icon: const Icon(Icons.keyboard_arrow_down),
            style: const TextStyle(fontSize: 16, color: Colors.black),
            isExpanded: true,
            items: controller.planList.map((plan) {
              return DropdownMenuItem<TypeModel>(
                value: plan,
                child: Text(
                  plan.value!.tr,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              );
            }).toList(),
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
          // CheckboxListTile(
          //   tileColor: appTheme.gray200,
          //   contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12.0)),
          //   title: Text("lbl_personal_accident_cover".tr),
          //   value: controller.personalAccidentCoverage.value,
          //   onChanged: (value) =>
          //       controller.personalAccidentCoverage.value = value!,
          // ),
          // const SizedBox(height: 20),
          // CheckboxListTile(
          //   tileColor: appTheme.gray200,
          //   contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12.0)),
          //   title: Text("lbl_roadside_assistance".tr),
          //   value: controller.roadSideAssistanceCoverage.value,
          //   onChanged: (value) =>
          //       controller.roadSideAssistanceCoverage.value = value!,
          // ),
        ],
      ),
    );
  }

  Widget _reviewAndSubmitStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Premium Summary Card
          _buildPremiumSummaryCard(),

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
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "lbl_total_premium".tr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(62, 7, 206, 14),
                  borderRadius: BorderRadius.circular(20)),
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
              const SizedBox(height: 8),
              Text(
                formatCurrency(
                  controller.calculatedTotalPremium() -
                      controller.discountAmount.value,
                ),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "DISCOUNT APPLIED",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade700,
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
          Text(title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700)),
        ],
      ),
    );
  }

  /// ---------- Installments ----------
  bool _isInstallmentAvailable() =>
      controller.detailsModelData.value.isInstallment == 1;

  Widget _buildInstallmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          activeColor: Colors.orange,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text("lbl_pay_installment".tr,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          value: controller.selectInstallment.value,
          onChanged: (value) =>
              controller.selectInstallment.value = value ?? false,
        ),
        if (controller.selectInstallment.value) ...[
          Row(
            children: [
              Text("lbl_installment_month".tr,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(width: 10),
              Text("${controller.installmentMonth.value}"),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("lbl_installment_per_month".tr,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(width: 10),
              Text(formatCurrency(controller.calculateInstallment())),
            ],
          ),
        ]
      ],
    );
  }

  /// ---------- Terms & Conditions ----------
  Widget _buildTermsAndConditions() {
    final language = localizationController.selectedLanguage.value;
    Widget termsContent;

    switch (language) {
      case 'English':
        termsContent = ht.HtmlWidget(
            controller.detailsModelData.value.termCondition ?? "English");
        break;
      case 'عربي':
        termsContent = ht.HtmlWidget(
            controller.detailsModelData.value.termConditionAr ?? "");
        break;
      default:
        termsContent = ht.HtmlWidget(
            controller.detailsModelData.value.termConditionKr ?? "");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("lbl_terms_n_condition".tr,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        termsContent,
      ],
    );
  }

  /// ---------- Accept Conditions ----------
  Widget _buildAcceptConditionsCheckbox() {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text("lbl_accept_condition".tr),
      value: controller.acceptCondition.value,
      onChanged: (value) => controller.acceptCondition.value = value ?? false,
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
                isAccepted ? Theme.of(context).primaryColor : Colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text("lbl_confirm".tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
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
            Colors.transparent
          ],
        ),
      ),
    );
  }
}
