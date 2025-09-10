import '../../../localization/controller/localization_controller.dart';
import '../controller/home_screen_container_controller.dart';
import '../models/banner_list_model.dart';
import 'package:insurance_app/core/app_export.dart';

// ignore: must_be_immutable
class SlidervectorItemWidget extends StatelessWidget {
  SlidervectorItemWidget(
    this.slidervectorItemModelObj, {
    super.key,
  });

  BannerData slidervectorItemModelObj;

  var controller = Get.find<HomeScreenContainerController>();
  final LocalizationController localizationController =
      Get.put(LocalizationController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: getPadding(left: 8, right: 8),
        child: Container(
            height: getVerticalSize(
              160,
            ),
            width: getHorizontalSize(
              364,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(slidervectorItemModelObj.imagePath!),
                  fit: BoxFit.fill),
            ),
            child: Padding(
              padding: getPadding(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getSize(144),
                    child: Text(
                      // localizationController.selectedLanguage.value == 'English'
                      //     ? slidervectorItemModelObj.name ?? ''
                      //     : localizationController.selectedLanguage.value ==
                      //             'عربي'
                      //         ? slidervectorItemModelObj.nameAr ?? ''
                      //         : slidervectorItemModelObj.nameKr ?? '',
                      slidervectorItemModelObj.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleLargeBold,
                    ),
                  ),
                  SizedBox(
                    height: getVerticalSize(12),
                  ),
                  // CustomElevatedButton(
                  //   onTap: () {
                  //     // Get.toNamed(AppRoutes.bikeInsurenceOneScreen);
                  //   },
                  //   text: "lbl_view_plans".tr,
                  //   margin: getMargin(
                  //     top: 15,
                  //   ),
                  //   buttonStyle:
                  //       CustomButtonStyles.fillWhiteA700border8.copyWith(
                  //           fixedSize: MaterialStateProperty.all<Size>(Size(
                  //     getHorizontalSize(
                  //       94,
                  //     ),
                  //     getVerticalSize(
                  //       30,
                  //     ),
                  //   ))),
                  //   buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
                  // ),
                ],
              ),
            )),
      ),
    );
  }
}
