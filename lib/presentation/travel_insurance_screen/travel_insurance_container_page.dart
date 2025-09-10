import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurance_app/added/city_drop_down.dart';
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
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/travel_insurance_controller.dart';
import 'models/family_member_model.dart';
import 'models/travel_insurance_details_model.dart';
import 'widgets/choose_a_date_screen.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart'
    as ht;

class TravelInsuranceContainerPage extends StatefulWidget {
  const TravelInsuranceContainerPage({super.key});

  @override
  State<TravelInsuranceContainerPage> createState() =>
      _TravelInsuranceContainerPageState();
}

class _TravelInsuranceContainerPageState
    extends State<TravelInsuranceContainerPage> {
  final TravelInsuranceController controller =
      Get.put(TravelInsuranceController());
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

      controller.passportDocument.value = result.files.single.path!;
      controller.passportDocumentController.text = result.files.single.name;

      print("Selected custom file: $filePath");
    } else {
      print("File picking canceled");
    }
  }

  Future<void> pickImage(bool isPropertyOwn) async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      controller.passportDocument.value = image.path;
      controller.passportDocumentController.text = image.name;
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
              title: AppbarTitle(text: "lbl_travel_insurance_form".tr),
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
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
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
                            title: "lbl_travel_details".tr,
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
                                    ? _travelDetailsStep()
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
                          final content =
                              controller.detailsModelData.value.data?.data;

                          if (content == null) {
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
                            description = content.description ?? '';
                          } else if (lang == 'عربي') {
                            description = content.descriptionAr ?? '';
                          } else {
                            description = content.descriptionKr ?? '';
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
          Obx(() => CustomDropdownField(
                validator: (value) => (value == null || value.isEmpty)
                    ? "lbl_required_field".tr
                    : null,
                value: controller.meetingLocation.value.isEmpty
                    ? null
                    : controller.meetingLocation.value,
                items: const [
                  DropdownMenuItem(value: 'Erbil', child: Text('Erbil')),
                  DropdownMenuItem(value: 'Baghdad', child: Text('Baghdad')),
                ],
                hintText: 'place of meeting'.tr,
                onChanged: (va) {
                  controller.meetingLocation.value = (va ?? '').toString();
                },
              )),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            controller: controller.nameController,
            margin: getMargin(top: 0),
            contentPadding:
                getPadding(left: 16, top: 17, right: 16, bottom: 17),
            hintText: "lbl_first_name".tr,
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
            controller: controller.middleNameController,
            margin: getMargin(top: 20),
            contentPadding:
                getPadding(left: 16, top: 17, right: 16, bottom: 17),
            hintText: "lbl_middle_name".tr,
            textInputAction: TextInputAction.next,
            filled: true,
            fillColor: appTheme.gray200,
            validator: (value) {
              // if (value == null || value.isEmpty) {
              //   return "lbl_required_field".tr;
              // }
              return null;
            },
          ),
          CustomTextFormField(
            controller: controller.lastNameController,
            margin: getMargin(top: 20),
            contentPadding:
                getPadding(left: 16, top: 17, right: 16, bottom: 17),
            hintText: "lbl_last_name".tr,
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
          Row(
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
          CustomTextFormField(
              controller: controller.passportNumberController,
              margin: getMargin(top: 20),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: "lbl_passport_number".tr,
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
              showCountryPickerWidget(context);
            },
            controller: controller.nationalityController,
            suffixConstraints:
                BoxConstraints(minHeight: getSize(24), maxHeight: getSize(24)),
            suffix: Padding(
              padding: getPadding(right: 16),
              child: const Icon(Icons.flag_outlined),
            ),
            margin: getMargin(top: 20),
            contentPadding:
                getPadding(left: 16, top: 17, right: 16, bottom: 17),
            hintText: "lbl_residency".tr,
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
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget _travelDetailsStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            onTap: () {
              showDestinationPickerWidget(context);
            },
            controller: controller.destinationController,
            suffixConstraints:
                BoxConstraints(minHeight: getSize(24), maxHeight: getSize(24)),
            suffix: Padding(
              padding: getPadding(right: 16),
              child: const Icon(Icons.flag_outlined),
            ),
            margin: getMargin(bottom: 0),
            contentPadding:
                getPadding(left: 16, top: 17, right: 16, bottom: 17),
            hintText: "lbl_destination".tr,
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
          const SizedBox(height: 10),
          Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(84, 17, 189, 17)),
              child: Column(
                children: [
                  Text(
                    "lbl_passport_document".tr,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ImageButton(
                    onTap: controller.selectImages,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: GridView.builder(
                      itemCount: controller.images.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
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
              )),
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
          CustomTextFormField(
              onTap: () {
                // controller._pickFileOrImage(false);
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
              margin: getMargin(top: 0),
              contentPadding:
                  getPadding(left: 16, top: 17, right: 16, bottom: 17),
              hintText: "lbl_travel_from_date".tr,
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
              hintText: "lbl_travel_to_date".tr,
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
          Obx(() => controller.end.value.isNotEmpty
              ? CustomDropdownField(
                  value: controller.catType.value,
                  items: controller.catList
                      .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type,
                              style: CustomTextStyles.bodyLargeBlack)))
                      .toList(),
                  hintText: 'lbl_package_select'.tr,
                  onChanged: (value) => controller.selectCat(value ?? ''),
                )
              : const SizedBox()),
          const SizedBox(height: 20),
          controller.catType.value == controller.catList[0]
              ? CustomDropdownField(
                  value: controller.planType.value,
                  items: controller.covid19PlanList
                      .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type,
                              style: CustomTextStyles.bodyLargeBlack)))
                      .toList(),
                  hintText: 'lbl_covid_19_plan_select'.tr,
                  onChanged: (value) => controller.selectPlan(value ?? ''),
                )
              : const SizedBox(),
          controller.catType.value == controller.catList[1]
              ? CustomDropdownField(
                  value: controller.planType.value,
                  items: controller.myJourneyPlanList
                      .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type,
                              style: CustomTextStyles.bodyLargeBlack)))
                      .toList(),
                  hintText: 'lbl_my_journey_plan_select'.tr,
                  onChanged: (value) => controller.selectPlan(value ?? ''),
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          // Center(
          //   child: CustomElevatedButton(
          //       onTap: () {
          //         onTapConfirm(context);
          //       },
          //       text: "lbl_family".tr,
          //       margin: getMargin(left: 20, right: 20, bottom: 32),
          //       buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
          //           fixedSize: WidgetStateProperty.all<Size>(
          //               Size(getHorizontalSize(200), getVerticalSize(50)))),
          //       buttonTextStyle: CustomTextStyles.titleMediumWhiteA700),
          // ),
          // ListView.builder(
          //     itemCount: controller.familyPlanList.length,
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemBuilder: (context, index) {
          //       return Padding(
          //         padding: const EdgeInsets.all(5.0),
          //         child: ListTile(
          //           tileColor: Colors.grey.shade300,
          //           contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          //           trailing: IconButton(
          //             onPressed: () {
          //               controller.deleteFamily(index);
          //             },
          //             icon: const Icon(
          //               Icons.delete,
          //               color: Colors.red,
          //             ),
          //           ),
          //           leading: Text(
          //             "${index + 1}",
          //             style: const TextStyle(fontSize: 18),
          //           ),
          //           title:
          //               Text(controller.familyPlanList[index].name ?? 'Family'),
          //           subtitle: Row(
          //             children: [
          //               Text(controller.familyPlanList[index].relation ??
          //                   'Family'),
          //               const SizedBox(width: 10),
          //               controller.familyPlanList[index].dob != null
          //                   ? Text(
          //                       "DOB: ${controller.familyPlanList[index].dob!.substring(0, 10)}")
          //                   : const SizedBox(),
          //             ],
          //           ),
          //         ),
          //       );
          //     })
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
  //                   Column(
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
  //                               style: CustomTextStyles.titleSmallBold,
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
  //                     calculateDifference(controller.startController.text,
  //                         controller.endController.text),
  //                     style: CustomTextStyles.titleSmallBold,
  //                   ),
  //                   const SizedBox(height: 10),
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
  //                                               .titleSmallBold),
  //                                       const SizedBox(width: 10),
  //                                       Text(
  //                                         controller
  //                                             .calculateInstallment()
  //                                             .toString(),
  //                                         style:
  //                                             CustomTextStyles.titleSmallBold,
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
          // Premium Summary Card with beautiful design
          _buildPremiumSummaryCard(),

          const SizedBox(height: 24),

          // Terms & Conditions Card
          _buildTermsAndConditions(),

          const SizedBox(height: 20),

          // Accept Conditions Card
          _buildAcceptConditionsCheckbox(),

          const SizedBox(height: 24),

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
          colors: [Colors.blue.shade50, Colors.cyan.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Colors.blue.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            // Travel Insurance Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.flight_takeoff,
                      color: Colors.blue.shade700, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    "Travel Insurance Premium",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Premium Amount Section
            _buildTotalPremiumSection(),

            const SizedBox(height: 28),
            _divider(),
            const SizedBox(height: 28),

            // Travel Info Cards
            Row(
              children: [
                Expanded(child: _buildTravelDateCard()),
                const SizedBox(width: 16),
                Expanded(child: _buildTravelDurationCard()),
              ],
            ),

            // Installment Option
            if (controller.detailsModelData.value.data!.data!.isInstallment ==
                1) ...[
              const SizedBox(height: 28),
              _divider(),
              const SizedBox(height: 20),
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
        // Original price
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: hasDiscount
                ? Colors.red.withOpacity(0.1)
                : Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: hasDiscount
                  ? Colors.red.withOpacity(0.3)
                  : Colors.green.withOpacity(0.3),
            ),
          ),
          child: Text(
            formatCurrency(controller.calculatedTotalPremium()),
            style: TextStyle(
              fontSize: hasDiscount ? 20 : 28,
              fontWeight: hasDiscount ? FontWeight.w500 : FontWeight.bold,
              decoration: hasDiscount ? TextDecoration.lineThrough : null,
              color: hasDiscount ? Colors.red.shade600 : Colors.green.shade700,
            ),
          ),
        ),

        // Discounted price (if applicable)
        if (hasDiscount) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade400, Colors.green.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              formatCurrency(
                controller.calculatedTotalPremium() -
                    controller.discountAmount.value,
              ),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange.shade500,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "✨ DISCOUNT APPLIED",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTravelDateCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade50, Colors.purple.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.purple.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(Icons.calendar_today_rounded,
              color: Colors.purple.shade600, size: 24),
          const SizedBox(height: 12),
          Text(
            "lbl_premium_date".tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.purple.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${controller.startController.text} - ${controller.endController.text}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.purple.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTravelDurationCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade50, Colors.orange.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(Icons.access_time_rounded,
              color: Colors.orange.shade600, size: 24),
          const SizedBox(height: 12),
          Text(
            "lbl_premium_range".tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.orange.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            calculateDifference(
              controller.startController.text,
              controller.endController.text,
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.orange.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// ---------- Installment Section ----------
  Widget _buildInstallmentSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade50, Colors.teal.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.teal.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.credit_card_rounded,
                  color: Colors.teal.shade600, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: CheckboxListTile(
                  activeColor: Colors.teal.shade600,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "lbl_pay_installment".tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.teal.shade700,
                    ),
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
                border: Border.all(color: Colors.teal.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "${controller.installmentMonth.value} months",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.teal.shade700,
                          ),
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
                          color: Colors.teal.shade700,
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
                '');
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade50, Colors.grey.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
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
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withOpacity(0.05),
            theme.colorScheme.primary.withOpacity(0.1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
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

        return Container(
          decoration: BoxDecoration(
            gradient: isAccepted
                ? LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.primary.withOpacity(0.8)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: isAccepted ? null : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isAccepted
                ? [
                    BoxShadow(
                      color: theme.colorScheme.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: ElevatedButton(
            onPressed: isAccepted && !isLoading ? controller.submitForm : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
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
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        "lbl_confirm".tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
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
            Colors.blue.shade200,
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  onTapConfirm(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        TextEditingController nameController = TextEditingController();
        TextEditingController genderController = TextEditingController();
        TextEditingController emailController = TextEditingController();
        TextEditingController phoneController = TextEditingController();
        TextEditingController dateController = TextEditingController();
        TextEditingController nationalityController = TextEditingController();
        TextEditingController passportNumberController =
            TextEditingController();
        String genderValue = '';
        String relationValue = '';
        String packageType = '';
        String planType = '';

        GlobalKey<FormState> fromKey = GlobalKey<FormState>();
        return AlertDialog(
            insetPadding: const EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding: EdgeInsets.zero,
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState2) {
              return Container(
                  width: getHorizontalSize(396),
                  padding: getPadding(left: 20, top: 24, right: 20, bottom: 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(16),
                      ),
                      color: appTheme.whiteA700),
                  child: SingleChildScrollView(
                    child: Form(
                      key: fromKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            controller: nameController,
                            margin: getMargin(top: 0),
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
                          CustomTextFormField(
                              controller: emailController,
                              margin: getMargin(top: 20),
                              contentPadding: getPadding(
                                  left: 16, top: 17, right: 16, bottom: 17),
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
                              controller: phoneController,
                              textInputType: TextInputType.phone,
                              margin: getMargin(top: 20),
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
                              }),
                          CustomTextFormField(
                              controller: passportNumberController,
                              margin: getMargin(top: 20),
                              contentPadding: getPadding(
                                  left: 16, top: 17, right: 16, bottom: 17),
                              hintText: "lbl_passport_number".tr,
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
                              final date = await showDatePickerDialog(
                                context: context,
                                minDate: DateTime(1900, 1, 1),
                                maxDate: DateTime.now(),
                              );
                              if (date != null) {
                                dateController.text = date.toString();
                              }
                              print("DATE === $date");
                            },
                            controller: dateController,
                            suffixConstraints: BoxConstraints(
                                minHeight: getSize(24), maxHeight: getSize(24)),
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
                          CustomTextFormField(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                onSelect: (Country country) {
                                  nationalityController.text = country.name;

                                  print(
                                      'Select country: ${country.displayName}');
                                },
                                moveAlongWithKeyboard: false,
                                countryListTheme: CountryListThemeData(
                                  inputDecoration: InputDecoration(
                                    labelText: 'Search',
                                    hintText: 'Start typing to search',
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xFF8C98A8)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                  // Optional. Styles the text in the search field
                                  searchTextStyle: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            },
                            controller: nationalityController,
                            suffixConstraints: BoxConstraints(
                                minHeight: getSize(24), maxHeight: getSize(24)),
                            suffix: Padding(
                              padding: getPadding(right: 16),
                              child: const Icon(Icons.flag_outlined),
                            ),
                            margin: getMargin(top: 20),
                            contentPadding: getPadding(
                                left: 16, top: 17, right: 16, bottom: 17),
                            hintText: "lbl_nationality".tr,
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
                          const SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("lbl_gender".tr,
                                    style: CustomTextStyles.titleSmallBold),
                                const SizedBox(width: 50),
                                SizedBox(
                                  child: DropdownButtonFormField<String>(
                                    validator: (value) {
                                      if (value == null) {
                                        return "lbl_required_field".tr;
                                      }
                                      return null;
                                    },
                                    value: genderValue.isEmpty
                                        ? null
                                        : genderValue,
                                    hint: Text("lbl_gender".tr),
                                    items: ['Male', 'Female', 'Other']
                                        .map((gender) => DropdownMenuItem(
                                            value: gender, child: Text(gender)))
                                        .toList(),
                                    onChanged: (value) {
                                      setState2(() {
                                        genderValue = value!;
                                      });
                                    },
                                  ),
                                ),
                              ]),
                          const SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("lbl_relation".tr,
                                    style: CustomTextStyles.titleSmallBold),
                                const SizedBox(width: 50),
                                SizedBox(
                                  child: DropdownButtonFormField<String>(
                                    validator: (value) {
                                      if (value == null) {
                                        return "lbl_required_field".tr;
                                      }
                                      return null;
                                    },
                                    value: relationValue.isEmpty
                                        ? null
                                        : relationValue,
                                    hint: Text("lbl_relation".tr),
                                    items: ['Father', 'Mother', 'Child']
                                        .map((gender) => DropdownMenuItem(
                                            value: gender, child: Text(gender)))
                                        .toList(),
                                    onChanged: (value) {
                                      setState2(() {
                                        relationValue = value!;
                                      });
                                    },
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: getVerticalSize(10),
                          ),
                          //todo
                          Row(children: [
                            Text("lbl_package_select".tr,
                                style: CustomTextStyles.titleSmallBold),
                            const SizedBox(width: 15),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "lbl_required_field".tr;
                                  }
                                  return null;
                                },
                                value: packageType.isEmpty ? null : packageType,
                                hint: Text('lbl_package_select'.tr),
                                items: controller.catList
                                    .map((type) => DropdownMenuItem(
                                        value: type, child: Text(type)))
                                    .toList(),
                                onChanged: (value) {
                                  setState2(() {
                                    packageType = value ?? '';
                                  });
                                },
                              ),
                            ),
                          ]),
                          packageType == controller.catList[0]
                              ? Row(children: [
                                  Text("lbl_covid_19_plan_select".tr,
                                      style: CustomTextStyles.titleSmallBold),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      validator: (value) {
                                        if (value == null) {
                                          return "lbl_required_field".tr;
                                        }
                                        return null;
                                      },
                                      value: planType.isEmpty ? null : planType,
                                      hint: Text('lbl_insurance_plan'.tr),
                                      items: controller.covid19PlanList
                                          .map((type) => DropdownMenuItem(
                                              value: type, child: Text(type)))
                                          .toList(),
                                      onChanged: (value) {
                                        setState2(() {
                                          planType = value ?? '';
                                        });
                                      },
                                    ),
                                  ),
                                ])
                              : const SizedBox(),
                          packageType == controller.catList[1]
                              ? Row(children: [
                                  Text("lbl_my_journey_plan_select".tr,
                                      style: CustomTextStyles.titleSmallBold),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      validator: (value) {
                                        if (value == null) {
                                          return "lbl_required_field".tr;
                                        }
                                        return null;
                                      },
                                      value: planType.isEmpty ? null : planType,
                                      hint: Text('lbl_insurance_plan'.tr),
                                      items: controller.myJourneyPlanList
                                          .map((type) => DropdownMenuItem(
                                              value: type, child: Text(type)))
                                          .toList(),
                                      onChanged: (value) {
                                        setState2(() {
                                          planType = value ?? '';
                                        });
                                      },
                                    ),
                                  ),
                                ])
                              : const SizedBox(),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: CustomOutlinedButton(
                                  text: "lbl_close".tr,
                                  margin: getMargin(
                                    right: 8,
                                  ),
                                  buttonStyle: CustomButtonStyles.outlinePrimary
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
                                    if (fromKey.currentState!.validate()) {
                                      PackagePackage? pack =
                                          controller.getPlanDetails(
                                              dateController.text.trim(),
                                              planType);
                                      controller.saveFamilyMemberInList(
                                          FamilyMemberModel(
                                              name: nameController.text.trim(),
                                              email:
                                                  emailController.text.trim(),
                                              phone:
                                                  phoneController.text.trim(),
                                              gender:
                                                  genderController.text.trim(),
                                              relation: relationValue,
                                              dob: dateController.text.trim(),
                                              nationality:
                                                  nationalityController.text,
                                              passportNumber:
                                                  passportNumberController.text
                                                      .trim(),
                                              plan: planType,
                                              travelInsurancePackageId:
                                                  pack?.id ?? null,
                                              premium: pack?.price ?? 0));
                                      Get.back();
                                    }
                                  },
                                  text: "lbl_member".tr,
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
                      ),
                    ),
                  ));
            }));
      },
    );
  }

  showCountryPickerWidget(context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        controller.nationalityController.text = country.name;
        controller.phoneCodeController.text = country.phoneCode;
        print('Select country: ${country.displayName}');
      },
      moveAlongWithKeyboard: false,
      countryListTheme: CountryListThemeData(
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
        // Optional. Styles the text in the search field
        searchTextStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }

  String _sanitizeHtml(String htmlString) {
    // Remove <html>, <head>, and <body> tags from the beginning and end of the string
    String sanitizedString = htmlString
        .replaceAll('<html>', '')
        .replaceAll('</html>', '')
        .replaceAll('<head>', '')
        .replaceAll('</head>', '')
        .replaceAll('<body>', '')
        .replaceAll('</body>', '')
        .trim(); // Trim any leading/trailing whitespace

    sanitizedString = sanitizedString.replaceAll(RegExp(r'<html.*?>'), '');
    sanitizedString = sanitizedString.replaceAll(RegExp(r'<body.*?>'), '');
    sanitizedString = sanitizedString.replaceAll(RegExp(r'</html.*?>'), '');
    sanitizedString = sanitizedString.replaceAll(RegExp(r'</body.*?>'), '');

    return sanitizedString;
  }

  showDestinationPickerWidget(context) {
    final loc = controller.meetingLocation.value.trim().toLowerCase();
    final excludeList =
        (loc == 'erbil') ? ['DE', 'FR', 'IT', 'CZ', 'PL', 'GR', 'RO'] : null;
    showCountryPicker(
      context: context,
      //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
      // exclude: <String>['KN', 'MF'],
      // favorite: <String>['SE'],
      //Optional. Shows phone code before the country name.
      exclude: excludeList,
      showPhoneCode: true,
      onSelect: (Country country) {
        controller.destinationController.text = country.name;

        print('Select country: ${country.displayName}');
      },
      // Optional. Sheet moves when keyboard opens.
      moveAlongWithKeyboard: false,
      // Optional. Sets the theme for the country list picker.
      countryListTheme: CountryListThemeData(
        // Optional. Sets the border radius for the bottomsheet.
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(40.0),
        //   topRight: Radius.circular(40.0),
        // ),
        // Optional. Styles the search field.

        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
        // Optional. Styles the text in the search field
        searchTextStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }
}
