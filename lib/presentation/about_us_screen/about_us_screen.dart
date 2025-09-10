// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
// import 'package:insurance_app/core/app_export.dart';
// import 'package:insurance_app/widgets/app_bar/appbar_image.dart';
// import 'package:insurance_app/widgets/app_bar/appbar_title.dart';
// import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';

// import '../../localization/controller/localization_controller.dart';
// import 'controller/about_us_controller.dart';
// import 'models/about_us_model.dart';

// class AboutUsScreen extends StatefulWidget {
//   const AboutUsScreen({super.key});

//   @override
//   State<AboutUsScreen> createState() => _AboutUsScreenState();
// }

// class _AboutUsScreenState extends State<AboutUsScreen> {
//   AboutUsController controller = Get.put(AboutUsController());
//   final LocalizationController localizationController =
//       Get.put(LocalizationController());
//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return WillPopScope(
//       onWillPop: () async {
//         Get.back();
//         return true;
//       },
//       child: SafeArea(
//           child: Scaffold(
//               backgroundColor: appTheme.whiteA700,
//               appBar: CustomAppBar(
//                 height: getVerticalSize(79),
//                 leadingWidth: getSize(42),
//                 leading: IconButton(
//                     onPressed: () => Get.back(),
//                     icon: Icon(
//                       Icons.arrow_back_ios,
//                       color: Colors.black,
//                       size: 20,
//                     )),
//                 centerTitle: false,
//                 title: AppbarTitle(text: "lbl_about_us".tr),
//               ),
//               body: Container(
//                   width: double.maxFinite,
//                   padding: getPadding(left: 20, top: 16, right: 20, bottom: 16),
//                   child: Obx(() {
//                     AboutUsData? _tempData =
//                         controller.aboutUsModelObj.value.data ?? null;
//                     return SingleChildScrollView(
//                       child: _tempData == null
//                           ? const Center(child: CircularProgressIndicator())
//                           : Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                   CustomImageView(
//                                       url: _tempData.imagePath,
//                                       height: getVerticalSize(160),
//                                       width: getHorizontalSize(388),
//                                       radius: BorderRadius.circular(
//                                           getHorizontalSize(16))),
//                                   Card(
//                                     child: Text('aboutustext'.tr),
//                                   ),
//                                   Padding(
//                                       padding: getPadding(top: 20),
//                                       child: Text(
//                                           localizationController
//                                                       .selectedLanguage.value ==
//                                                   'English'
//                                               ? _tempData.name ?? ''
//                                               : localizationController
//                                                           .selectedLanguage
//                                                           .value ==
//                                                       'عربي'
//                                                   ? _tempData.nameAr
//                                                   : _tempData.nameKr,
//                                           overflow: TextOverflow.ellipsis,
//                                           textAlign: TextAlign.left,
//                                           style:
//                                               CustomTextStyles.titleLargeBold)),
//                                   const SizedBox(height: 10.0),
//                                   Row(children: [
//                                     const Icon(Icons.call, color: Colors.blue),
//                                     const SizedBox(width: 10.0),
//                                     Text(_tempData.phone ?? ''),
//                                     const Spacer(),
//                                     const Icon(Icons.mail, color: Colors.red),
//                                     const SizedBox(width: 10.0),
//                                     Text(_tempData.email ?? ''),
//                                   ]),
//                                   const SizedBox(height: 10.0),
//                                   localizationController
//                                               .selectedLanguage.value ==
//                                           'English'
//                                       ? HtmlWidget(
//                                           _tempData.description ?? "English")
//                                       : localizationController
//                                                   .selectedLanguage.value ==
//                                               'عربي'
//                                           ? HtmlWidget(
//                                               _tempData.descriptionAr ?? "")
//                                           : HtmlWidget(
//                                               _tempData.descriptionKr ?? ''),
//                                 ]),
//                     );
//                   })))),
//     );
//   }

//   onTapArrowleft2() {
//     Get.back();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/appbar_image.dart';
import 'package:insurance_app/widgets/app_bar/appbar_title.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../localization/controller/localization_controller.dart';
import 'controller/about_us_controller.dart';
import 'models/about_us_model.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen>
    with TickerProviderStateMixin {
  AboutUsController controller = Get.put(AboutUsController());
  final LocalizationController localizationController =
      Get.put(LocalizationController());

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: CustomScrollView(
          slivers: [
            // Enhanced App Bar with gradient
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 4, 79, 141)),
                ),
                title: Text(
                  "lbl_about_us".tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                centerTitle: true,
              ),
            ),
            // Content
            SliverToBoxAdapter(
              child: Obx(() {
                AboutUsData? tempData = controller.aboutUsModelObj.value.data;
                return tempData == null
                    ? const SizedBox(
                        height: 400,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF6366F1),
                            ),
                          ),
                        ),
                      )
                    : FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                // Hero Image Card
                                _buildHeroImageCard(tempData),
                                const SizedBox(height: 24),

                                // Company Name Card
                                _buildCompanyNameCard(tempData),
                                const SizedBox(height: 20),

                                // Contact Information Card
                                _buildContactCard(tempData),
                                const SizedBox(height: 20),

                                // Description Card
                                _buildDescriptionCard(tempData),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroImageCard(AboutUsData data) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomImageView(
              url: data.imagePath,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyNameCard(AboutUsData data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'aboutustext'.tr,
              style: const TextStyle(
                color: Color.fromARGB(255, 2, 55, 99),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _getLocalizedText(data.name, data.nameAr, data.nameKr) ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(AboutUsData data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.contact_phone,
                  color: Color(0xFF6366F1),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildContactItem(
            Icons.phone,
            data.phone ?? '',
            Colors.green,
            () => _launchPhone(data.phone ?? ''),
          ),
          const SizedBox(height: 16),
          _buildContactItem(
            Icons.email,
            data.email ?? '',
            Colors.red,
            () => _launchEmail(data.email ?? ''),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String text,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: color.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: color.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionCard(AboutUsData data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFEC4899).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.info_outline,
                  color: Color(0xFFEC4899),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  String? _getLocalizedText(String? english, String? arabic, String? kurdish) {
    final selectedLanguage = localizationController.selectedLanguage.value;
    switch (selectedLanguage) {
      case 'English':
        return english;
      case 'عربي':
        return arabic;
      default:
        return kurdish;
    }
  }

  void _launchPhone(String phone) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  void _launchEmail(String email) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }
}
