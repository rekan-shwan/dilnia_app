import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insurance_app/added/snack_bar_widget.dart';
import 'package:insurance_app/added/submit_claim_screen.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/aqsati/aqsati_controller.dart';
import 'package:insurance_app/presentation/aqsati/aqsati_view.dart';
import 'package:insurance_app/widgets/app_bar/appbar_title.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../localization/controller/localization_controller.dart';
import '../family_insurence_screen/models/family_item_model.dart';
import '../home_screen_container_page/widgets/gridmotorbikeon_item_widget.dart';
import '../home_screen_container_page/widgets/slidervector_item_widget.dart';
import 'controller/home_screen_container_controller.dart';
import 'models/banner_list_model.dart';

// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeScreenContainerPage extends StatefulWidget {
  HomeScreenContainerPage({super.key});

  @override
  State<HomeScreenContainerPage> createState() =>
      _HomeScreenContainerPageState();
}

class _HomeScreenContainerPageState extends State<HomeScreenContainerPage> {
  // late final WebViewController webViewController = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   ..setNavigationDelegate(
  //     NavigationDelegate(
  //       onProgress: (int progress) {
  //         // Update loading bar.
  //       },
  //       onPageStarted: (String url) {},
  //       onPageFinished: (String url) {
  //         // Add mobile compatibility fixes here
  //         webViewController.runJavaScript("""
  //           (function() {
  //             // Remove any existing viewport meta tag
  //             var existingMeta = document.querySelector('meta[name=viewport]');
  //             if (existingMeta) {
  //               existingMeta.remove();
  //             }

  //             // Create new optimized viewport meta tag
  //             var meta = document.createElement('meta');
  //             meta.name = 'viewport';
  //             meta.content = 'width=device-width, initial-scale=1, maximum-scale=1, user-scalable=yes, shrink-to-fit=no';
  //             document.head.appendChild(meta);

  //             // Apply mobile-friendly scaling
  //             var body = document.body;
  //             var html = document.documentElement;

  //             // Method 1: CSS Transform (most compatible)
  //             body.style.transform = 'scale(1)';
  //             body.style.transformOrigin = 'top left';
  //             body.style.width = '100%';

  //             // Fallback: CSS Zoom for older browsers
  //             if (!CSS.supports('transform', 'scale(1)')) {
  //               body.style.zoom = '1';
  //               body.style.width = 'auto';
  //             }

  //             // Prevent scrollbars and ensure full coverage
  //             body.style.margin = '0';
  //             body.style.padding = '0';
  //             body.style.overflowX = 'hidden';
  //             html.style.overflowX = 'hidden';
  //             html.style.margin = '0';
  //             html.style.padding = '0';

  //             console.log('Mobile optimization applied');
  //           })();
  //         """);

  //         // Add a delayed execution for stubborn pages
  //         Future.delayed(Duration(milliseconds: 500), () {
  //           webViewController.runJavaScript("""
  //             (function() {
  //               // Secondary application for pages that load content dynamically
  //               if (!document.body.style.transform && !document.body.style.zoom) {
  //                 document.body.style.transform = 'scale(1)';
  //                 document.body.style.transformOrigin = 'top left';
  //                 document.body.style.width = '60%';
  //                 document.body.style.overflowX = 'hidden';
  //                 document.documentElement.style.overflowX = 'hidden';
  //               }
  //             })();
  //           """);
  //         });
  //       },
  //       onHttpError: (HttpResponseError error) {},
  //       onWebResourceError: (WebResourceError error) {},
  //       onNavigationRequest: (NavigationRequest request) {
  //         if (request.url.startsWith(
  //             'https://dilnia.com/ku/%d8%a6%db%8c%d8%af%db%8c%d8%b9%d8%a7%db%8c%db%95%da%a9-%d8%a8%da%a9%db%95/')) {
  //           return NavigationDecision.prevent;
  //         }
  //         return NavigationDecision.navigate;
  //       },
  //     ),
  //   )
  //   ..loadRequest(Uri.parse(
  //       'https://dilnia.com/ku/%d8%a6%db%8c%d8%af%db%8c%d8%b9%d8%a7%db%8c%db%95%da%a9-%d8%a8%da%a9%db%95/'));

  final HomeScreenContainerController controller =
      Get.put(HomeScreenContainerController());

  final LocalizationController localizationController =
      Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SizedBox(
        width: mediaQueryData.size.width,
        child: Padding(
            padding: getPadding(bottom: 5),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SafeArea(
                child: Container(
                  padding: getPadding(left: 20, right: 20, top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageConstant.logoIcon,
                        height: getVerticalSize(50),
                        width: getHorizontalSize(50),
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: getVerticalSize(50),
                        width: getHorizontalSize(10),
                      ),
                      Expanded(
                        child: Obx(() {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppbarTitle(text: "lbl_welcome".tr),
                              Text(controller.userName.value,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.bodyLarge)
                            ],
                          );
                        }),
                      ),
                      Obx(() {
                        return DropdownButton<String>(
                          value: localizationController.selectedLanguage.value,
                          items: localizationController.languages.keys
                              .map((language) => DropdownMenuItem<String>(
                                    value: language,
                                    child: Text(language),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              localizationController.changeLanguage(value);
                            }
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: getPadding(bottom: 16),
                  children: [
                    Obx(() => !controller.isLoading.value
                        ? Directionality(
                            textDirection: TextDirection.ltr,
                            child: CarouselSlider.builder(
                                options: CarouselOptions(
                                    height: getVerticalSize(160),
                                    initialPage: 0,
                                    autoPlay: true,
                                    viewportFraction: 0.85,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index, reason) {
                                      controller.silderIndex.value = index;
                                    }),
                                itemCount: controller.bannerData.length,
                                itemBuilder: (context, index, realIndex) {
                                  BannerData model =
                                      controller.bannerData[index];
                                  return SlidervectorItemWidget(model);
                                }),
                          )
                        : const SizedBox()),
                    Obx(() => !controller.isLoading.value
                        ? Center(
                            child: Container(
                                height: getVerticalSize(8),
                                margin: getMargin(top: 10),
                                child: AnimatedSmoothIndicator(
                                    activeIndex: controller.silderIndex.value,
                                    count: controller.bannerData.length,
                                    axisDirection: Axis.horizontal,
                                    effect: ScrollingDotsEffect(
                                        spacing: 8,
                                        activeDotColor:
                                            theme.colorScheme.primary,
                                        dotColor: appTheme.gray200,
                                        dotHeight: getVerticalSize(8),
                                        dotWidth: getHorizontalSize(8)))),
                          )
                        : const SizedBox()),
                    Padding(
                        padding: getPadding(left: 20, top: 26, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("lbl_services".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.titleLargeBold_1),
                              // GestureDetector(
                              //     onTap: () {
                              //       onTapTxtViewall();
                              //     },
                              //     child: Padding(
                              //         padding: getPadding(top: 2),
                              //         child: Text("lbl_view_all".tr,
                              //             overflow: TextOverflow.ellipsis,
                              //             textAlign: TextAlign.left,
                              //             style: CustomTextStyles
                              //                 .bodyLargeGray600_1)))
                            ])),
                    //insurance category
                    GridView.builder(
                        padding: getPadding(left: 30, right: 30, top: 16),
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: getVerticalSize(150),
                            crossAxisCount: 2,
                            mainAxisSpacing: getHorizontalSize(16),
                            crossAxisSpacing: getHorizontalSize(16)),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.familyInsurenceModelObj.length > 4
                            ? 4
                            : controller.familyInsurenceModelObj.length,
                        itemBuilder: (context, index) {
                          FamilyItemModel model =
                              controller.familyInsurenceModelObj[index];
                          return GridmotorbikeonItemWidget(model,
                              onTapColumnmotorbike: () {
                            if (index == 0) {
                              onHomeInsurance();
                            } else if (index == 1) {
                              onCarInsurance();
                            } else if (index == 2) {
                              onMedicalInsurance();
                            } else if (index == 3) {
                              onTravelInsurance();
                            } else {
                              //onTapCheckprice();
                              SnackBarWidget().showSnackBar(
                                  context, 'Service not available yet');
                            }
                          });
                        }),

                    Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: SizedBox(
                        height: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusGeometry.circular(5)),
                                backgroundColor: const Color(0xFFA3DC9A)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SubmitClaimScreen()));
                            },
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    height: 60,
                                    width: 60,
                                    child: Icon(
                                      Icons.notes_sharp,
                                      color: appTheme.buttonColor,
                                      size: 50,
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "submit_claim".tr,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    )
                    // //faq
                    // Padding(
                    //     padding: getPadding(left: 20, top: 24, right: 20),
                    //     child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text("msg_how_insurance_work".tr,
                    //               overflow: TextOverflow.ellipsis,
                    //               textAlign: TextAlign.left,
                    //               style: CustomTextStyles.titleLargeBold_1),
                    //           GestureDetector(
                    //               onTap: () {
                    //                 onTapTxtViewallone();
                    //               },
                    //               child: Padding(
                    //                   padding: getPadding(top: 2),
                    //                   child: Text("lbl_view_all".tr,
                    //                       overflow: TextOverflow.ellipsis,
                    //                       textAlign: TextAlign.left,
                    //                       style: CustomTextStyles
                    //                           .bodyLargeGray600_1)))
                    //         ])),
                    // SizedBox(
                    //   height: getVerticalSize(14),
                    // ),
                    // Container(
                    //   height: getSize(240),
                    //   child: ListView.builder(
                    //     padding: getPadding(left: 8, right: 8),
                    //     itemCount: controller.howInsuranceWork.length > 2
                    //         ? 2
                    //         : controller.howInsuranceWork.length,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, index) {
                    //       HowInsuranceItemModel data =
                    //           controller.howInsuranceWork[index];
                    //       return Padding(
                    //         padding: getPadding(left: 8, right: 8),
                    //         child: Container(
                    //           width: getSize(269),
                    //           height: double.infinity,
                    //           decoration: AppDecoration.fill10.copyWith(
                    //               borderRadius:
                    //                   BorderRadiusStyle.roundedBorder16),
                    //           child: Padding(
                    //             padding: getPadding(all: 4),
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Container(
                    //                   width: double.infinity,
                    //                   height: getSize(121),
                    //                   decoration: BoxDecoration(
                    //                       borderRadius: BorderRadius.circular(
                    //                           getHorizontalSize(16)),
                    //                       image: DecorationImage(
                    //                           image: AssetImage(data.image!),
                    //                           fit: BoxFit.fill)),
                    //                 ),
                    //                 SizedBox(
                    //                   height: getVerticalSize(4),
                    //                 ),
                    //                 Padding(
                    //                   padding: getPadding(left: 4, right: 4),
                    //                   child: Text(data.title!,
                    //                       overflow: TextOverflow.ellipsis,
                    //                       textAlign: TextAlign.left,
                    //                       maxLines: 1,
                    //                       style: CustomTextStyles
                    //                           .titleMediumSemiBold17),
                    //                 ),
                    //                 Padding(
                    //                   padding:
                    //                       getPadding(top: 4, left: 4, right: 4),
                    //                   child: Text(data.subTitle!,
                    //                       maxLines: 2,
                    //                       overflow: TextOverflow.ellipsis,
                    //                       textAlign: TextAlign.left,
                    //                       style: CustomTextStyles
                    //                           .bodyMediumBlack900),
                    //                 ),
                    //                 CustomElevatedButton(
                    //                   text: "lbl_explore_now".tr,
                    //                   margin: getMargin(
                    //                     left: 4,
                    //                     top: 0,
                    //                     bottom: 0,
                    //                   ),
                    //                   buttonStyle: CustomButtonStyles
                    //                       .fillPrimary
                    //                       .copyWith(
                    //                           fixedSize: MaterialStateProperty
                    //                               .all<Size>(Size(
                    //                     getHorizontalSize(
                    //                       104,
                    //                     ),
                    //                     getVerticalSize(
                    //                       23,
                    //                     ),
                    //                   ))),
                    //                   buttonTextStyle:
                    //                       CustomTextStyles.bodyMediumWhiteA700,
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // //blog
                    // Padding(
                    //     padding: getPadding(left: 20, top: 28, right: 20),
                    //     child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text("lbl_blog".tr,
                    //               overflow: TextOverflow.ellipsis,
                    //               textAlign: TextAlign.left,
                    //               style: CustomTextStyles.titleLargeBold_1),
                    //           GestureDetector(
                    //               onTap: () {
                    //                 onTapTxtViewalltwo();
                    //               },
                    //               child: Padding(
                    //                   padding: getPadding(bottom: 2),
                    //                   child: Text("lbl_view_all".tr,
                    //                       overflow: TextOverflow.ellipsis,
                    //                       textAlign: TextAlign.left,
                    //                       style: CustomTextStyles
                    //                           .bodyLargeGray600_1)))
                    //         ])),
                    // SizedBox(
                    //   height: getVerticalSize(16),
                    // ),
                    // Container(
                    //   height: getSize(104),
                    //   child: ListView.builder(
                    //     padding: getPadding(left: 8, right: 8),
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: controller.blogData.length > 3
                    //         ? 3
                    //         : controller.blogData.length,
                    //     itemBuilder: (context, index) {
                    //       BlogItemModel data = controller.blogData[index];
                    //       return Padding(
                    //         padding: getPadding(left: 8, right: 8),
                    //         child: GestureDetector(
                    //             onTap: () {
                    //               onTapBlog();
                    //             },
                    //             child: Container(
                    //               width: getSize(307),
                    //               height: double.infinity,
                    //               decoration: AppDecoration.fill10.copyWith(
                    //                   borderRadius:
                    //                       BorderRadiusStyle.roundedBorder16),
                    //               child: Padding(
                    //                 padding: getPadding(all: 4),
                    //                 child: Row(
                    //                   children: [
                    //                     Container(
                    //                       height: getSize(96),
                    //                       width: getSize(96),
                    //                       decoration: BoxDecoration(
                    //                           borderRadius:
                    //                               BorderRadius.circular(
                    //                                   getHorizontalSize(16)),
                    //                           image: DecorationImage(
                    //                               image:
                    //                                   AssetImage(data.image!),
                    //                               fit: BoxFit.fill)),
                    //                     ),
                    //                     SizedBox(
                    //                       width: getSize(12),
                    //                     ),
                    //                     Expanded(
                    //                       child: Column(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.center,
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.start,
                    //                         children: [
                    //                           Container(
                    //                             width: getHorizontalSize(185),
                    //                             child: Expanded(
                    //                               child: Text(data.title!,
                    //                                   overflow:
                    //                                       TextOverflow.ellipsis,
                    //                                   maxLines: 1,
                    //                                   textAlign: TextAlign.left,
                    //                                   style: CustomTextStyles
                    //                                       .titleMediumSemiBold),
                    //                             ),
                    //                           ),
                    //                           Container(
                    //                               width: getHorizontalSize(182),
                    //                               child: Expanded(
                    //                                 child: Text(data.subTitle!,
                    //                                     maxLines: 2,
                    //                                     overflow: TextOverflow
                    //                                         .ellipsis,
                    //                                     textAlign:
                    //                                         TextAlign.left,
                    //                                     style: CustomTextStyles
                    //                                         .bodyMediumBlack900),
                    //                               )),
                    //                           Padding(
                    //                               padding: getPadding(top: 6),
                    //                               child: Text(data.date!,
                    //                                   overflow:
                    //                                       TextOverflow.ellipsis,
                    //                                   textAlign: TextAlign.left,
                    //                                   style: CustomTextStyles
                    //                                       .bodyMediumGray700))
                    //                         ],
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //             )),
                    //       );
                    //     },
                    //   ),
                    // )
                  ],
                ),
              ),
            ])));
  }

  onTapColumnmotorbike() {
    Get.toNamed(AppRoutes.bikeInsurenceOneScreen);
  }

  onHomeInsurance() {
    Get.toNamed(
      AppRoutes.homeInsuranceRoute,
    );
  }

  onCarInsurance() {
    Get.toNamed(
      AppRoutes.carInsuranceRoute,
      //AppRoutes.paymentConfirmOneScreen,
    );
  }

  onMedicalInsurance() {
    Get.toNamed(
      AppRoutes.medicalInsuranceRoute,
      //AppRoutes.paymentConfirmOneScreen,
    );
  }

  onTravelInsurance() {
    Get.toNamed(
      AppRoutes.travelInsuranceRoute,
      //AppRoutes.paymentConfirmOneScreen,
    );
  }

  onTapCheckprice() {
    Get.toNamed(
      AppRoutes.detailsTabContainerScreen,
    );
  }

  onTapIcnotification() {
    Get.toNamed(
      AppRoutes.paymentConfirmScreen,
    );
  }

  onTapTxtViewall() {
    Get.toNamed(
      AppRoutes.familyInsurenceScreen,
    );
  }

  onTapTxtViewallone() {
    Get.toNamed(
      AppRoutes.howInsuranceWorkScreen,
    );
  }

  onTapTxtViewalltwo() {
    Get.toNamed(
      AppRoutes.blogScreen,
    );
  }

  onTapBlog() {
    Get.toNamed(
      AppRoutes.bikeInsurenceScreen,
    );
  }
}
