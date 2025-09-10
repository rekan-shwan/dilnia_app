import 'dart:io';

import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:file_picker/file_picker.dart';
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
import 'controller/medical_insurance_controller.dart';
import 'models/family_member_model.dart';
import 'models/medical_insurance_details_model.dart';
import 'widgets/choose_a_date_screen.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart'
    as ht;

class MedicalInsuranceContainerPage extends StatefulWidget {
  const MedicalInsuranceContainerPage({super.key});

  @override
  State<MedicalInsuranceContainerPage> createState() =>
      _MedicalInsuranceContainerPageState();
}

class _MedicalInsuranceContainerPageState
    extends State<MedicalInsuranceContainerPage> {
  final MedicalInsuranceController controller =
      Get.put(MedicalInsuranceController());
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
        controller.medicalRegistrationDocument.value =
            result.files.single.path!;
        controller.medicalRegistrationDocumentController.text =
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
        controller.medicalRegistrationDocument.value = image.path;
        controller.medicalRegistrationDocumentController.text = image.name;
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
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.black, size: 20),
              ),
              centerTitle: false,
              title: AppbarTitle(text: "lbl_medical_insurance_form".tr),
            ),
            bottomNavigationBar: Obx(
              () => controller.showMainForm.value
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                      child: Row(
                        children: [
                          if (controller.currentStep.value > 0)
                            Expanded(
                              child: CustomElevatedButton(
                                onTap: () => controller.previousStep(),
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
                                onTap: () => controller.nextStep(),
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
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                          onTap: () => controller.showMainForm.value = true,
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
                        onStepReached: controller.onStepTapped,
                        activeStep: controller.currentStep.value,
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
                            title: "lbl_medical".tr,
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
                                    ? _medicalDetailsStep()
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
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Obx(() {
                          final data =
                              controller.detailsModelData.value.data?.data;

                          if (data == null) {
                            return const Padding(
                              padding: EdgeInsets.all(24),
                              child: Center(
                                child:
                                    CircularProgressIndicator(strokeWidth: 2.5),
                              ),
                            );
                          }

                          String description = '';
                          final lang =
                              localizationController.selectedLanguage.value;

                          if (lang == 'English') {
                            description = data.description ?? '';
                          } else if (lang == 'عربي') {
                            description = data.descriptionAr ?? '';
                          } else {
                            description = data.descriptionKr ?? '';
                          }

                          return SingleChildScrollView(
                            padding: const EdgeInsets.all(8),
                            physics: const BouncingScrollPhysics(),
                            child: ht.HtmlWidget(
                              description,
                              textStyle:
                                  const TextStyle(fontSize: 20, height: 2),
                              onTapUrl: (url) async => true,
                            ),
                          );
                        }),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: CustomTextFormField(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getHorizontalSize(32)),
                              topRight:
                                  Radius.circular(getHorizontalSize(32)))),
                      context: context,
                      builder: (context) {
                        return const ChooseADateScreen(
                          isBOD: true,
                        );
                      },
                    );
                  },
                  controller: controller.dateController,
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
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text("${"lbl_age".tr}: ${controller.age()} Year",
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleSmallBold),
              ),
            ],
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

          // SizedBox(
          //   child: DropdownButtonFormField<String>(
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return "lbl_required_field".tr;
          //       }
          //       return null;
          //     },
          //     decoration: CustomButtonStyles.defultInputDecoration,
          //     value: controller.gender.value.isEmpty
          //         ? null
          //         : controller.gender.value,
          //     hint:
          //         Text("lbl_gender".tr, style: CustomTextStyles.bodyLargeBlack),
          //     items: ['Male', 'Female', 'Other']
          //         .map((gender) => DropdownMenuItem(
          //             value: gender,
          //             child:
          //                 Text(gender, style: CustomTextStyles.bodyLargeBlack)))
          //         .toList(),
          //     onChanged: (value) => controller.gender.value = value!,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _medicalDetailsStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            "lbl_select_medical_condition".tr,
            style: CustomTextStyles.titleLargeBold.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),

          // Condition List
          ListView.separated(
            itemCount: controller.conditionList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(height: 6),
            itemBuilder: (c, i) {
              return Obx(() => Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.grey.shade100,
                    child: CheckboxListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      activeColor: theme.colorScheme.primary,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        controller.conditionList[i],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: controller.isConditionSelected(i.toString()),
                      onChanged: (value) {
                        if (controller.isConditionSelected(i.toString())) {
                          controller.removeCondition(i.toString());
                        } else {
                          controller.addCondition(i.toString());
                        }
                      },
                    ),
                  ));
            },
          ),

          const SizedBox(height: 24),

          // Upload Document Field
          Text(
            "lbl_document".tr,
            style: CustomTextStyles.titleMedium17.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            autofocus: false,
            onTap: () async {
              await _pickFileOrImage(false);
            },
            controller: controller.medicalRegistrationDocumentController,
            suffixConstraints:
                BoxConstraints(minHeight: getSize(24), maxHeight: getSize(24)),
            suffix: Padding(
              padding: getPadding(right: 16),
              child: CustomImageView(
                svgPath: ImageConstant.imgFile,
              ),
            ),
            contentPadding:
                getPadding(left: 16, top: 17, right: 16, bottom: 17),
            hintText: "lbl_document".tr,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.none,
            filled: true,
            fillColor: appTheme.gray200,
          ),

          const SizedBox(height: 20),

          // Upload Images Button
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: ElevatedButton.icon(
          //     style: ElevatedButton.styleFrom(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //       backgroundColor: theme.colorScheme.primary,
          //     ),
          //     onPressed: controller.selectImages,
          //     icon: const Icon(Icons.add_a_photo_rounded, size: 20),
          //     label: Text(
          //       "Upload Images",
          //       style: const TextStyle(
          //           fontSize: 14,
          //           fontWeight: FontWeight.w600,
          //           color: Colors.white),
          //     ),
          //   ),
          // ),

          const SizedBox(height: 16),

          // Preview Images
          if (controller.images.isNotEmpty)
            Container(
              height: 200,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: GridView.builder(
                itemCount: controller.images.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(controller.images[index].path),
                      fit: BoxFit.cover,
                    ),
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
          CustomDropdownField(
            value: controller.planType.value,
            items: controller.planList
                .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type, style: CustomTextStyles.bodyLargeBlack)))
                .toList(),
            hintText: 'lbl_insurance_plan'.tr,
            onChanged: (value) => controller.selectPlan(value ?? ''),
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
          const SizedBox(height: 10),
          Center(
            child: CustomElevatedButton(
                onTap: () {
                  onTapConfirm(context);
                },
                text: "lbl_family".tr,
                margin: getMargin(left: 20, right: 20, bottom: 32),
                buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                    fixedSize: WidgetStateProperty.all<Size>(
                        Size(getHorizontalSize(200), getVerticalSize(50)))),
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA700),
          ),
          ListView.builder(
              itemCount: controller.familyPlanList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(96, 158, 158, 158)),
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                    trailing: IconButton(
                      onPressed: () {
                        controller.deleteFamily(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    leading: Text(
                      "${index + 1}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    title:
                        Text(controller.familyPlanList[index].name ?? 'Family'),
                    subtitle: Row(
                      children: [
                        Text(controller.familyPlanList[index].relation?.tr ??
                            'Family'),
                        const SizedBox(width: 10),
                        controller.familyPlanList[index].dob != null
                            ? Text(
                                "DOB: ${controller.familyPlanList[index].dob!.substring(0, 10)}")
                            : const SizedBox(),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  // Widget _reviewAndSubmitStep() {
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
  //                               formatCurrency(
  //                                   (controller.calculatedTotalPremium() -
  //                                       controller.discountAmount.value)),
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
  //                   const SizedBox(height: 20),
  //                   controller.detailsModelData.value.data!.data!
  //                               .isInstallment ==
  //                           1
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
  //                 ])),
  //         const SizedBox(height: 20),
  //         Text("lbl_terms_n_condition".tr,
  //             style: CustomTextStyles.titleSmallBold),
  //         localizationController.selectedLanguage.value == 'English'
  //             ? ht.HtmlWidget(
  //                 controller.detailsModelData.value.data?.data?.termCondition ??
  //                     "English")
  //             : localizationController.selectedLanguage.value == 'عربي'
  //                 ? ht.HtmlWidget(controller
  //                         .detailsModelData.value.data?.data?.termConditionAr ??
  //                     "")
  //                 : ht.HtmlWidget(controller
  //                         .detailsModelData.value.data?.data?.termConditionKr ??
  //                     ''),

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
  //         ))
  //       ],
  //     ),
  //   );
  // }

  Widget _reviewAndSubmitStep() {
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
                    controller.calculatedTotalPremium() -
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
                child: const Text(
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
      controller.detailsModelData.value.data!.data!.isInstallment == 1;

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
                "lbl_coupon_code".tr,
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
                child: SizedBox(
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
            controller.detailsModelData.value.data?.data?.termCondition ??
                "English");
        break;
      case 'عربي':
        termsContent = ht.HtmlWidget(
            controller.detailsModelData.value.data?.data?.termConditionAr ??
                "");
        break;
      default:
        termsContent = ht.HtmlWidget(
            controller.detailsModelData.value.data?.data?.termConditionKr ??
                "");
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

  onTapConfirm(context) {
    // Helper function to calculate age
    String _calculateAge(String dateString) {
      if (dateString.isEmpty) return "0";
      try {
        DateTime birthDate = DateTime.parse(dateString);
        DateTime today = DateTime.now();
        int age = today.year - birthDate.year;
        if (today.month < birthDate.month ||
            (today.month == birthDate.month && today.day < birthDate.day)) {
          age--;
        }
        return age.toString();
      } catch (e) {
        return "0";
      }
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        // Controllers
        TextEditingController nameController = TextEditingController();
        TextEditingController emailController = TextEditingController();
        TextEditingController phoneController = TextEditingController();
        TextEditingController dateController = TextEditingController();

        // Form state
        List<String> selectedConditionList = <String>[];
        String genderValue = '';
        String relationValue = '';
        String planType = '';
        int planTypeId = 0;
        GlobalKey<FormState> formKey = GlobalKey<FormState>();

        return AlertDialog(
          insetPadding: const EdgeInsets.all(16),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.zero,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                width: getHorizontalSize(396),
                padding: getPadding(left: 20, top: 24, right: 20, bottom: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                  color: appTheme.whiteA700,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // === PERSONAL INFORMATION SECTION ===

                        // Full Name Field
                        CustomTextFormField(
                          controller: nameController,
                          contentPadding: getPadding(
                              left: 16, top: 17, right: 16, bottom: 17),
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

                        const SizedBox(height: 20),

                        // Email Field
                        CustomTextFormField(
                          controller: emailController,
                          contentPadding: getPadding(
                              left: 16, top: 17, right: 16, bottom: 17),
                          hintText: "lbl_email_address".tr,
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

                        const SizedBox(height: 20),

                        // Phone Field
                        CustomTextFormField(
                          controller: phoneController,
                          textInputType: TextInputType.phone,
                          contentPadding: getPadding(
                              left: 16, top: 17, right: 16, bottom: 17),
                          hintText: "lbl_mobile".tr,
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

                        const SizedBox(height: 20),

                        // Date of Birth Field with Age Display
                        // Replace the date selection part in your onTapConfirm method with this:

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomTextFormField(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            getHorizontalSize(32)),
                                        topRight: Radius.circular(
                                            getHorizontalSize(32)),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return ChooseADateScreen(
                                        isBOD: true,
                                        onDateSelected: (selectedDate) {
                                          // This callback will update the local dateController
                                          setState(() {
                                            dateController.text = selectedDate;
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                                controller: dateController,
                                suffixConstraints: BoxConstraints(
                                    minHeight: getSize(24),
                                    maxHeight: getSize(24)),
                                suffix: Padding(
                                  padding: getPadding(right: 16),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgCalendreIcon,
                                  ),
                                ),
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
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                "${"lbl_age".tr}: ${_calculateAge(dateController.text)} Year",
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.titleSmallBold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // === DROPDOWN SECTION ===

                        // Gender Dropdown with Icons
                        CustomDropdownField(
                          value: genderValue.isEmpty ? null : genderValue,
                          onChanged: (val) {
                            setState(() {
                              genderValue = val ?? '';
                            });
                            debugPrint("genderValue $genderValue");
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

                        const SizedBox(height: 10),

                        // Relation Dropdown with Icons
                        CustomDropdownField(
                          value: relationValue.isEmpty ? null : relationValue,
                          onChanged: (val) {
                            setState(() {
                              relationValue = val ?? '';
                            });
                          },
                          hintText: "lbl_relation".tr,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "lbl_required_field".tr;
                            }
                            return null;
                          },
                          items: [
                            DropdownMenuItem(
                              value: "lbl_father",
                              child: Row(
                                children: [
                                  const Icon(Icons.man, color: Colors.blue),
                                  const SizedBox(width: 8),
                                  Text("lbl_father".tr),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "lbl_mother",
                              child: Row(
                                children: [
                                  const Icon(Icons.woman, color: Colors.pink),
                                  const SizedBox(width: 8),
                                  Text("lbl_mother".tr),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "lbl_child",
                              child: Row(
                                children: [
                                  const Icon(Icons.child_care,
                                      color: Colors.orange),
                                  const SizedBox(width: 8),
                                  Text("lbl_child".tr),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "lbl_sister",
                              child: Row(
                                children: [
                                  const Icon(Icons.woman, color: Colors.purple),
                                  const SizedBox(width: 8),
                                  Text("lbl_sister".tr),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "lbl_brother",
                              child: Row(
                                children: [
                                  const Icon(Icons.man, color: Colors.green),
                                  const SizedBox(width: 8),
                                  Text("lbl_brother".tr),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "lbl_wife",
                              child: Row(
                                children: [
                                  const Icon(Icons.favorite, color: Colors.red),
                                  const SizedBox(width: 8),
                                  Text("lbl_wife".tr),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // === MEDICAL CONDITIONS SECTION ===

                        // Section Title
                        Text(
                          "lbl_select_medical_condition".tr,
                          style: CustomTextStyles.titleLargeBold,
                        ),

                        const SizedBox(height: 10),

                        // Conditions List
                        ListView.separated(
                          itemCount: controller.conditionList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final condition = controller.conditionList[index];
                            final isSelected = selectedConditionList
                                .contains(index.toString());

                            return Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: isSelected
                                  ? theme.colorScheme.primary.withOpacity(0.1)
                                  : Colors.grey.shade100,
                              child: CheckboxListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                activeColor: theme.colorScheme.primary,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(
                                  condition,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    color: isSelected
                                        ? theme.colorScheme.primary
                                        : Colors.grey.shade800,
                                  ),
                                ),
                                value: isSelected,
                                onChanged: (value) {
                                  setState(() {
                                    if (isSelected) {
                                      selectedConditionList
                                          .remove(index.toString());
                                    } else {
                                      selectedConditionList
                                          .add(index.toString());
                                    }
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // === DIALOG ACTIONS ===
          actions: [
            // Close Button
            SizedBox(
              width: 120,
              child: CustomOutlinedButton(
                text: "lbl_close".tr,
                margin: getMargin(right: 8),
                buttonStyle: CustomButtonStyles.outlinePrimary.copyWith(
                  fixedSize: WidgetStateProperty.all<Size>(
                    Size(double.maxFinite, getVerticalSize(54)),
                  ),
                ),
                onTap: () {
                  Get.back();
                },
                buttonTextStyle: CustomTextStyles.titleMediumPrimary_1,
              ),
            ),

            SizedBox(width: getHorizontalSize(10)),

            // Save Button
            SizedBox(
              width: 120,
              child: CustomElevatedButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    PackagePackage? pack = controller.getPlanDetails(
                      dateController.text.trim(),
                      planTypeId,
                    );

                    controller.saveFamilyMemberInList(
                      FamilyMemberModel(
                        name: nameController.text.trim(),
                        medicalCondition: selectedConditionList,
                        email: emailController.text.trim(),
                        phone: phoneController.text.trim(),
                        gender: genderValue,
                        relation: relationValue,
                        dob: dateController.text.trim(),
                        plan: planType,
                        medicalInsurancePackageId: pack?.id ?? null,
                        premium: pack?.price ?? 0,
                      ),
                    );
                    Get.back();
                  }
                },
                text: "lbl_member".tr,
                margin: getMargin(left: 8),
                buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                  fixedSize: WidgetStateProperty.all<Size>(
                    Size(double.maxFinite, getVerticalSize(54)),
                  ),
                ),
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
              ),
            ),
          ],
        );
      },
    );
  }

  // onTapConfirm(context) {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (context) {
  //       TextEditingController nameController = TextEditingController();
  //       TextEditingController genderController = TextEditingController();
  //       TextEditingController emailController = TextEditingController();
  //       TextEditingController phoneController = TextEditingController();
  //       TextEditingController dateController = TextEditingController();
  //       List<String> selectedConditionList = <String>[];
  //       String genderValue = '';
  //       String relationValue = '';
  //       String planType = '';
  //       int planTypeId = 0;
  //       GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  //       return AlertDialog(
  //         insetPadding: const EdgeInsets.all(16),
  //         actionsAlignment: MainAxisAlignment.center,
  //         actionsPadding: const EdgeInsets.all(8),
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //         contentPadding: EdgeInsets.zero,
  //         content: StatefulBuilder(
  //             builder: (BuildContext context, StateSetter setState2) {
  //           return Container(
  //               width: getHorizontalSize(396),
  //               padding: getPadding(left: 20, top: 24, right: 20, bottom: 24),
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(
  //                     getHorizontalSize(16),
  //                   ),
  //                   color: appTheme.whiteA700),
  //               child: SingleChildScrollView(
  //                 child: Form(
  //                   key: fromKey,
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       CustomTextFormField(
  //                         controller: nameController,
  //                         margin: getMargin(top: 0),
  //                         contentPadding: getPadding(
  //                             left: 16, top: 17, right: 16, bottom: 17),
  //                         hintText: "lbl_full_name".tr,
  //                         textInputAction: TextInputAction.next,
  //                         filled: true,
  //                         fillColor: appTheme.gray200,
  //                         validator: (value) {
  //                           if (value == null || value.isEmpty) {
  //                             return "lbl_required_field".tr;
  //                           }
  //                           return null;
  //                         },
  //                       ),
  //                       CustomTextFormField(
  //                           controller: emailController,
  //                           margin: getMargin(top: 20),
  //                           contentPadding: getPadding(
  //                               left: 16, top: 17, right: 16, bottom: 17),
  //                           hintText: "lbl_email_address".tr,
  //                           textInputAction: TextInputAction.next,
  //                           filled: true,
  //                           fillColor: appTheme.gray200,
  //                           validator: (value) {
  //                             if (value == null || value.isEmpty) {
  //                               return "lbl_required_field".tr;
  //                             }
  //                             return null;
  //                           }),
  //                       CustomTextFormField(
  //                           controller: phoneController,
  //                           textInputType: TextInputType.phone,
  //                           margin: getMargin(top: 20),
  //                           contentPadding: getPadding(
  //                               left: 16, top: 17, right: 16, bottom: 17),
  //                           hintText: "lbl_mobile".tr,
  //                           textInputAction: TextInputAction.next,
  //                           filled: true,
  //                           fillColor: appTheme.gray200,
  //                           validator: (value) {
  //                             if (value == null || value.isEmpty) {
  //                               return "lbl_required_field".tr;
  //                             }
  //                             return null;
  //                           }),
  //                       CustomTextFormField(
  //                         onTap: () async {
  //                           final date = await showDatePickerDialog(
  //                             context: context,
  //                             minDate: DateTime(1900, 1, 1),
  //                             maxDate: DateTime.now(),
  //                           );
  //                           if (date != null) {
  //                             dateController.text = date.format('yyyy-MM-dd');
  //                           }
  //                           print("DATE === $date");
  //                         },
  //                         controller: dateController,
  //                         suffixConstraints: BoxConstraints(
  //                             minHeight: getSize(24), maxHeight: getSize(24)),
  //                         suffix: Padding(
  //                           padding: getPadding(right: 16),
  //                           child: CustomImageView(
  //                             svgPath: ImageConstant.imgCalendreIcon,
  //                           ),
  //                         ),
  //                         margin: getMargin(top: 20),
  //                         contentPadding: getPadding(
  //                             left: 16, top: 17, right: 16, bottom: 17),
  //                         hintText: "lbl_dob".tr,
  //                         textInputAction: TextInputAction.next,
  //                         textInputType: TextInputType.none,
  //                         validator: (value) {
  //                           if (value == null || value.isEmpty) {
  //                             return "lbl_required_field".tr;
  //                           }
  //                           return null;
  //                         },
  //                         filled: true,
  //                         fillColor: appTheme.gray200,
  //                       ),
  //                       const SizedBox(height: 10),
  //                       DropdownButtonFormField<String>(
  //                         value: genderValue.isEmpty ? null : genderValue,
  //                         decoration: CustomButtonStyles.defultInputDecoration,
  //                         hint: Text("lbl_gender".tr,
  //                             style: CustomTextStyles.bodyLargeBlack),
  //                         items: ['Male', 'Female', 'Other']
  //                             .map((gender) => DropdownMenuItem(
  //                                 value: gender,
  //                                 child: Text(gender,
  //                                     style: CustomTextStyles.bodyLargeBlack)))
  //                             .toList(),
  //                         validator: (value) {
  //                           if (value == null || value.isEmpty) {
  //                             return "lbl_required_field".tr;
  //                           }
  //                           return null;
  //                         },
  //                         onChanged: (value) {
  //                           setState2(() {
  //                             genderValue = value!;
  //                           });
  //                           debugPrint("genderValue $genderValue");
  //                         },
  //                       ),
  //                       const SizedBox(height: 10),
  //                       // DropdownButtonFormField<String>(
  //                       //   value: relationValue.isEmpty ? null : relationValue,
  //                       //   decoration: CustomButtonStyles.defultInputDecoration,
  //                       //   hint: Text("lbl_relation".tr,
  //                       //       style: CustomTextStyles.bodyLargeBlack),
  //                       //   items: [
  //                       //     'Father',
  //                       //     'Mother',
  //                       //     'Child',
  //                       //     'Sister',
  //                       //     'Brother',
  //                       //     'Wife'
  //                       //   ]
  //                       //       .map((gender) => DropdownMenuItem(
  //                       //           value: gender,
  //                       //           child: Text(gender,
  //                       //               style: CustomTextStyles.bodyLargeBlack)))
  //                       //       .toList(),
  //                       //   validator: (value) {
  //                       //     if (value == null || value.isEmpty) {
  //                       //       return "lbl_required_field".tr;
  //                       //     }
  //                       //     return null;
  //                       //   },
  //                       //   onChanged: (value) {
  //                       //     setState2(() {
  //                       //       relationValue = value!;
  //                       //     });
  //                       //   },
  //                       // ),
  //                       DropdownButtonFormField<String>(
  //                         value: relationValue.isEmpty ? null : relationValue,
  //                         decoration: CustomButtonStyles.defultInputDecoration,
  //                         hint: Text(
  //                           "lbl_relation".tr,
  //                           style: CustomTextStyles.bodyLargeBlack,
  //                         ),
  //                         items: [
  //                           'lbl_father',
  //                           'lbl_mother',
  //                           'lbl_child',
  //                           'lbl_sister',
  //                           'lbl_brother',
  //                           'lbl_wife',
  //                         ]
  //                             .map((relationKey) => DropdownMenuItem(
  //                                   value: relationKey,
  //                                   child: Text(
  //                                     relationKey.tr,
  //                                     style: CustomTextStyles.bodyLargeBlack,
  //                                   ),
  //                                 ))
  //                             .toList(),
  //                         validator: (value) {
  //                           if (value == null || value.isEmpty) {
  //                             return "lbl_required_field".tr;
  //                           }
  //                           return null;
  //                         },
  //                         onChanged: (value) {
  //                           setState2(() {
  //                             relationValue = value!;
  //                           });
  //                         },
  //                       ),

  //                       SizedBox(height: getVerticalSize(10)),
  //                       // DropdownButtonFormField<String>(
  //                       //   value: planType.isEmpty ? null : planType,
  //                       //   decoration: CustomButtonStyles.defultInputDecoration,
  //                       //   hint: Text('lbl_insurance_plan'.tr,
  //                       //       style: CustomTextStyles.bodyLargeBlack),
  //                       //   items: controller.planList
  //                       //       .map((type) => DropdownMenuItem(
  //                       //           value: type,
  //                       //           child: SizedBox(
  //                       //             width: 125,
  //                       //             child: Text(type,
  //                       //                 maxLines: 1,
  //                       //                 style: CustomTextStyles.bodyLargeBlack),
  //                       //           )))
  //                       //       .toList(),
  //                       //   validator: (value) {
  //                       //     if (value == null || value.isEmpty) {
  //                       //       return "lbl_required_field".tr;
  //                       //     }
  //                       //     return null;
  //                       //   },
  //                       //   onChanged: (value) {
  //                       //     setState2(() {
  //                       //       planType = value!;
  //                       //       planTypeId =
  //                       //           controller.planList.indexOf(value) + 1;
  //                       //     });
  //                       //   },
  //                       // ),
  //                       Text("lbl_select_medical_condition".tr,
  //                           style: CustomTextStyles.titleLargeBold),
  //                       ListView.separated(
  //                         itemCount: controller.conditionList.length,
  //                         physics: const NeverScrollableScrollPhysics(),
  //                         shrinkWrap: true,
  //                         separatorBuilder: (_, __) =>
  //                             const SizedBox(height: 8),
  //                         itemBuilder: (c, i) {
  //                           final condition = controller.conditionList[i];
  //                           final isSelected =
  //                               selectedConditionList.contains(i.toString());

  //                           return Card(
  //                             elevation: 1,
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(12),
  //                             ),
  //                             color: isSelected
  //                                 ? theme.colorScheme.primary.withOpacity(0.1)
  //                                 : Colors.grey.shade100,
  //                             child: CheckboxListTile(
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                   horizontal: 12, vertical: 4),
  //                               activeColor: theme.colorScheme.primary,
  //                               controlAffinity:
  //                                   ListTileControlAffinity.leading,
  //                               title: Text(
  //                                 condition,
  //                                 style: TextStyle(
  //                                   fontSize: 14,
  //                                   fontWeight: isSelected
  //                                       ? FontWeight.w600
  //                                       : FontWeight.w500,
  //                                   color: isSelected
  //                                       ? theme.colorScheme.primary
  //                                       : Colors.grey.shade800,
  //                                 ),
  //                               ),
  //                               value: isSelected,
  //                               onChanged: (value) {
  //                                 setState2(() {
  //                                   if (isSelected) {
  //                                     selectedConditionList
  //                                         .remove(i.toString());
  //                                   } else {
  //                                     selectedConditionList.add(i.toString());
  //                                   }
  //                                 });
  //                               },
  //                             ),
  //                           );
  //                         },
  //                       ),

  //                       const SizedBox(height: 10),
  //                       // Row(
  //                       //   children: [
  //                       //     Expanded(
  //                       //       child: CustomOutlinedButton(
  //                       //         text: "lbl_close".tr,
  //                       //         margin: getMargin(
  //                       //           right: 8,
  //                       //         ),
  //                       //         buttonStyle: CustomButtonStyles.outlinePrimary
  //                       //             .copyWith(
  //                       //                 fixedSize:
  //                       //                     WidgetStateProperty.all<Size>(Size(
  //                       //           double.maxFinite,
  //                       //           getVerticalSize(
  //                       //             54,
  //                       //           ),
  //                       //         ))),
  //                       //         onTap: () {
  //                       //           Get.back();
  //                       //         },
  //                       //         buttonTextStyle:
  //                       //             CustomTextStyles.titleMediumPrimary_1,
  //                       //       ),
  //                       //     ),
  //                       //     SizedBox(
  //                       //       width: getHorizontalSize(10),
  //                       //     ),
  //                       //     Expanded(
  //                       //       child: CustomElevatedButton(
  //                       //         onTap: () {
  //                       //           if (fromKey.currentState!.validate()) {
  //                       //             PackagePackage? pack =
  //                       //                 controller.getPlanDetails(
  //                       //                     dateController.text.trim(),
  //                       //                     planTypeId);
  //                       //             controller
  //                       //                 .saveFamilyMemberInList(
  //                       //                     FamilyMemberModel(
  //                       //                         name:
  //                       //                             nameController.text.trim(),
  //                       //                         medicalCondition:
  //                       //                             selectedConditionList,
  //                       //                         email:
  //                       //                             emailController.text.trim(),
  //                       //                         phone:
  //                       //                             phoneController.text.trim(),
  //                       //                         gender: genderValue,
  //                       //                         relation: relationValue,
  //                       //                         dob: dateController.text.trim(),
  //                       //                         plan: planType,
  //                       //                         medicalInsurancePackageId:
  //                       //                             pack?.id ?? null,
  //                       //                         premium: pack?.price ?? 0));
  //                       //             Get.back();
  //                       //           }
  //                       //         },
  //                       //         text: "lbl_member".tr,
  //                       //         margin: getMargin(
  //                       //           left: 8,
  //                       //         ),
  //                       //         buttonStyle: CustomButtonStyles.fillPrimary
  //                       //             .copyWith(
  //                       //                 fixedSize:
  //                       //                     WidgetStateProperty.all<Size>(Size(
  //                       //           double.maxFinite,
  //                       //           getVerticalSize(
  //                       //             54,
  //                       //           ),
  //                       //         ))),
  //                       //         buttonTextStyle:
  //                       //             CustomTextStyles.titleMediumWhiteA700,
  //                       //       ),
  //                       //     ),
  //                       //   ],
  //                       // ),
  //                     ],
  //                   ),
  //                 ),
  //               ));
  //         }),
  //         actions: [
  //           SizedBox(
  //             width: 120,
  //             child: CustomOutlinedButton(
  //               text: "lbl_close".tr,
  //               margin: getMargin(
  //                 right: 8,
  //               ),
  //               buttonStyle: CustomButtonStyles.outlinePrimary.copyWith(
  //                   fixedSize: WidgetStateProperty.all<Size>(Size(
  //                 double.maxFinite,
  //                 getVerticalSize(
  //                   54,
  //                 ),
  //               ))),
  //               onTap: () {
  //                 Get.back();
  //               },
  //               buttonTextStyle: CustomTextStyles.titleMediumPrimary_1,
  //             ),
  //           ),
  //           SizedBox(
  //             width: getHorizontalSize(10),
  //           ),
  //           SizedBox(
  //             width: 120,
  //             child: CustomElevatedButton(
  //               onTap: () {
  //                 if (fromKey.currentState!.validate()) {
  //                   PackagePackage? pack = controller.getPlanDetails(
  //                       dateController.text.trim(), planTypeId);
  //                   controller.saveFamilyMemberInList(FamilyMemberModel(
  //                       name: nameController.text.trim(),
  //                       medicalCondition: selectedConditionList,
  //                       email: emailController.text.trim(),
  //                       phone: phoneController.text.trim(),
  //                       gender: genderValue,
  //                       relation: relationValue,
  //                       dob: dateController.text.trim(),
  //                       plan: planType,
  //                       medicalInsurancePackageId: pack?.id ?? null,
  //                       premium: pack?.price ?? 0));
  //                   Get.back();
  //                 }
  //               },
  //               text: "lbl_member".tr,
  //               margin: getMargin(
  //                 left: 8,
  //               ),
  //               buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
  //                   fixedSize: WidgetStateProperty.all<Size>(Size(
  //                 double.maxFinite,
  //                 getVerticalSize(
  //                   54,
  //                 ),
  //               ))),
  //               buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
