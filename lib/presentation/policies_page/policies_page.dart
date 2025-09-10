import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';

import '../policies_page/widgets/mypolicies_item_widget.dart';
import 'controller/policies_controller.dart';
import 'models/mypolicies_item_model.dart';

// ignore_for_file: must_be_immutable
class PoliciesPage extends StatelessWidget {
  PoliciesPage({super.key});

  PoliciesController controller = Get.put(PoliciesController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width,
      padding: getPadding(top: 16),
      child: Column(children: [
        Container(
            width: double.maxFinite,
            padding: getPadding(left: 20, top: 10, right: 20, bottom: 17),
            decoration: AppDecoration.white,
            child: Row(
              children: [
                Text("lbl_my_policies2".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headlineMedium),
              ],
            )),
        Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: RefreshIndicator(
                // backgroundColor: Colors.red,
                onRefresh: () async {
                  controller.insuranceList();
                },
                child: ListView.builder(
                    // physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,

                    // separatorBuilder: (context, index) {
                    //   return SizedBox(height: getVerticalSize(16));
                    // },
                    itemCount: controller.dataList.length,
                    itemBuilder: (context, index) {
                      InsuranceData model = controller.dataList[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MypoliciesItemWidget(model, onTapPolicy: () {
                          if (model.insurance! == 'home') {
                            Get.toNamed(AppRoutes.policiesOneScreen,
                                arguments: model);
                          } else if (model.insurance! == 'car') {
                            Get.toNamed(AppRoutes.carFormDetailsScreen,
                                arguments: model);
                          } else if (model.insurance! == 'medical') {
                            Get.toNamed(AppRoutes.medicalDetailsScreen,
                                arguments: model);
                          } else if (model.insurance! == 'travel') {
                            Get.toNamed(AppRoutes.travelDetailsScreen,
                                arguments: model);
                          }
                        }),
                      );
                    }),
              )))
      ]),
    );
  }

  onTapPolicy() {}
}
