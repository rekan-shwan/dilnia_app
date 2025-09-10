import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../how_insurance_work_screen/widgets/how_insurance_item_widget.dart';
import 'controller/how_insurance_work_controller.dart';
import 'models/how_insurance_item_model.dart';



class HowInsuranceWorkScreen extends StatefulWidget {
  const HowInsuranceWorkScreen({super.key});

  @override
  State<HowInsuranceWorkScreen> createState() => _HowInsuranceWorkScreenState();
}

class _HowInsuranceWorkScreenState extends State<HowInsuranceWorkScreen> {
  HowInsuranceWorkController controller = Get.put(HowInsuranceWorkController());
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
        child:SafeArea(
            child: Scaffold(
                backgroundColor: appTheme.whiteA700,
                appBar: CustomAppBar(
                  height: getVerticalSize(79),
                  leadingWidth: getSize(42),
                  leading: Padding(
                    padding:getPadding(right: 16),
                    child: AppbarImage(
                        height: getSize(24),
                        width: getSize(24),
                        svgPath: ImageConstant.imgArrowleft,
                        // margin: getMargin(left: 16, top: 29, bottom: 26),

                        onTap: () {
                          Get.back();
                        }),
                  ),
                  centerTitle: false,
                  title: AppbarTitle(text: "msg_how_insurance_work".tr),),
                body: ListView.builder(
                  padding: getPadding(left: 20,right: 20,bottom: 8),
primary: false,
                    shrinkWrap: true,
                  itemCount: controller.howInsuranceWork.length,

                  itemBuilder: (context, index) {
                    HowInsuranceItemModel data = controller.howInsuranceWork[index];
                    return HowInsuranceItemWidget(data);
                  },)

    )),
    );
  }


  onTapHowinsurance() {
    Get.toNamed(
      AppRoutes.homeScreenContainer1Screen,
    );
  }
}



