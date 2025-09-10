import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';

import '../verify_bike_details_screen/controller/verify_bike_details_controller.dart';
import 'controller/current_policy_status_controller.dart';
import 'models/current_policy_status_model.dart';



class CurrentPolicyStatusScreen extends StatefulWidget {
  const CurrentPolicyStatusScreen({super.key});

  @override
  State<CurrentPolicyStatusScreen> createState() => _CurrentPolicyStatusScreenState();
}

class _CurrentPolicyStatusScreenState extends State<CurrentPolicyStatusScreen> {
  VerifyBikeDetailsController verifyBikeDetailsController =
  Get.put(VerifyBikeDetailsController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder<CurrentPolicyStatusController>(
      init: CurrentPolicyStatusController(),
      builder:(controller) =>  Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(left: 20,right: 20,top: 24,bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("msg_current_policy_status".tr,style:  CustomTextStyles.titleLargeBold_1,),
                  CustomImageView(
                      onTap: (){
                        Get.back();
                      },
                      svgPath:
                      ImageConstant.imgClose)

                ],
              ),
            ),
            ListView.separated(
                padding: getPadding(left: 20,right: 20,bottom: 24),
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  CurrentPolicyStatusModel data = controller.currentPolicyStatusModelObj[index];
                  return GestureDetector(
                    onTap: (){
                      verifyBikeDetailsController.setCurrentPolicyStatus(data.title);
                      Get.back();
                    },
                    child: Text(data.title!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyLarge),
                  );
                }, separatorBuilder: (context, index) {
              return   Padding(
                  padding: getPadding(top: 16,bottom: 16),
                  child: Divider(
                      height: getVerticalSize(1),
                      thickness: getVerticalSize(1),
                      color: appTheme.gray200));
            }, itemCount: controller.currentPolicyStatusModelObj.length),
          ]),
    );
  }

  onTapCurrentpolicy() {
    Get.toNamed(
      AppRoutes.verifyBikeDetailsScreen,
    );
  }
}






