// import '../controller/policies_controller.dart';
// import '../models/mypolicies_item_model.dart';
// import 'package:insurance_app/core/app_export.dart';

// // ignore: must_be_immutable
// class MypoliciesItemWidget extends StatelessWidget {
//   MypoliciesItemWidget(
//     this.mypoliciesItemModelObj, {
//     super.key,
//     this.onTapPolicy,
//   });

//   InsuranceData mypoliciesItemModelObj;
//   var controller = Get.put(PoliciesController());

//   VoidCallback? onTapPolicy;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onTapPolicy?.call();
//       },
//       child: Container(
//         width: double.infinity,
//         margin: getMargin(top: 4, bottom: 4),
//         padding: getPadding(
//           top: 8,
//           bottom: 8,
//           left: 8,
//           right: 8,
//         ),
//         decoration: AppDecoration.fill9.copyWith(
//           borderRadius: BorderRadiusStyle.roundedBorder16,
//           color: Colors.grey[200],
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 8,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: getPadding(left: 4, right: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     height: getSize(52),
//                     width: getSize(52),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                           getHorizontalSize(16),
//                         ),
//                         image: DecorationImage(
//                             image: AssetImage(
//                               mypoliciesItemModelObj.insurance! == 'home'
//                                   ? 'assets/images/home_icon.png'
//                                   : mypoliciesItemModelObj.insurance! == 'car'
//                                       ? 'assets/images/car_icon.png'
//                                       : mypoliciesItemModelObj.insurance! ==
//                                               'medical'
//                                           ? 'assets/images/health_icon.png'
//                                           : mypoliciesItemModelObj.insurance! ==
//                                                   'travel'
//                                               ? 'assets/images/travel_icon.png'
//                                               : '',
//                             ),
//                             fit: BoxFit.fill)),
//                   ),
//                   SizedBox(
//                     width: getHorizontalSize(12),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: getSize(21),
//                         padding: getPadding(
//                           left: 8,
//                           top: 1,
//                           right: 8,
//                           bottom: 1,
//                         ),
//                         decoration: BoxDecoration(
//                           color: mypoliciesItemModelObj.isPaid! == 1
//                               ? Colors.green
//                               : Colors.red,
//                           borderRadius: BorderRadius.circular(
//                             getHorizontalSize(20),
//                           ),
//                         ),
//                         child: Text(
//                             "${mypoliciesItemModelObj.isPaid! == 1 ? 'Paid' : 'Unpaid'}",
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: getFontSize(12),
//                               fontWeight: FontWeight.w800,
//                             )),
//                       ),
//                       SizedBox(
//                         height: getVerticalSize(6),
//                       ),
//                       Text(
//                         mypoliciesItemModelObj.title ?? "",
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: getFontSize(20),
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                       SizedBox(
//                         height: getVerticalSize(6),
//                       ),
//                       SizedBox(
//                         height: getSize(21),
//                         child: Row(
//                           children: [
//                             Icon(Icons.info_outline,
//                                 size: 14, color: Colors.blue),
//                             SizedBox(width: 4),
//                             Text("${mypoliciesItemModelObj.note}",
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style: TextStyle(
//                                   color: Colors.grey[600],
//                                   fontSize: getFontSize(16),
//                                 )),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: getVerticalSize(6),
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons.calendar_month,
//                               size: 14, color: Colors.blue),
//                           SizedBox(width: 4),
//                           Text(
//                             mypoliciesItemModelObj.createdAt!
//                                 .format("dd MMM yyyy"),
//                             style: theme.textTheme.bodySmall?.copyWith(
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: getPadding(top: 10),
//                 child: Text(
//                     "${mypoliciesItemModelObj.totalPremium!.toStringAsFixed(2)} $curencySymbol",
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: getFontSize(16),
//                       fontWeight: FontWeight.w800,
//                     )),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import '../controller/policies_controller.dart';
import '../models/mypolicies_item_model.dart';
import 'package:insurance_app/core/app_export.dart';

// ignore: must_be_immutable
class MypoliciesItemWidget extends StatelessWidget {
  MypoliciesItemWidget(
    this.mypoliciesItemModelObj, {
    super.key,
    this.onTapPolicy,
  });

  InsuranceData mypoliciesItemModelObj;
  var controller = Get.put(PoliciesController());

  VoidCallback? onTapPolicy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapPolicy?.call();
      },
      child: Container(
        width: double.infinity,
        margin: getMargin(top: 6, bottom: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: getPadding(all: 20),
          child: Column(
            children: [
              // Header row with icon, status, and price
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Insurance type icon with gradient background
                  Container(
                    height: getSize(64),
                    width: getSize(64),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: _getGradientColors(
                            mypoliciesItemModelObj.insurance!),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _getPrimaryColor(
                                  mypoliciesItemModelObj.insurance!)
                              .withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        _getIconPath(mypoliciesItemModelObj.insurance!),
                        height: getSize(32),
                        width: getSize(32),
                        color: Colors.white,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(width: getHorizontalSize(16)),

                  // Policy details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status badge
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: mypoliciesItemModelObj.isPaid! == 1
                                ? const Color(0xFF10B981).withOpacity(0.1)
                                : const Color(0xFFEF4444).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: mypoliciesItemModelObj.isPaid! == 1
                                  ? const Color(0xFF10B981)
                                  : const Color(0xFFEF4444),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            mypoliciesItemModelObj.isPaid! == 1
                                ? 'Paid'.tr
                                : 'Unpaid'.tr,
                            style: TextStyle(
                              color: mypoliciesItemModelObj.isPaid! == 1
                                  ? const Color(0xFF10B981)
                                  : const Color(0xFFEF4444),
                              fontSize: getFontSize(12),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        SizedBox(height: getVerticalSize(8)),

                        // Policy title
                        Text(
                          getDisplayTitle(mypoliciesItemModelObj.title ?? ""),
                          style: TextStyle(
                            color: const Color(0xFF1F2937),
                            fontSize: getFontSize(18),
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: getHorizontalSize(12)),

                  // Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${mypoliciesItemModelObj.totalPremium!.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: const Color(0xFF3B82F6),
                          fontSize: getFontSize(20),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        curencySymbol,
                        style: TextStyle(
                          color: const Color(0xFF6B7280),
                          fontSize: getFontSize(14),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: getVerticalSize(16)),

              // Divider
              Container(
                height: 1,
                color: const Color(0xFFF3F4F6),
              ),

              SizedBox(height: getVerticalSize(16)),

              // Bottom info row
              Row(
                children: [
                  // Note info
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.info_outline,
                            size: 16,
                            color: Color(0xFF3B82F6),
                          ),
                        ),
                        SizedBox(width: getHorizontalSize(8)),
                        Expanded(
                          child: Text(
                            "${mypoliciesItemModelObj.note}",
                            style: TextStyle(
                              color: const Color(0xFF6B7280),
                              fontSize: getFontSize(14),
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: getHorizontalSize(16)),

                  // Date info
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Color(0xFF10B981),
                        ),
                      ),
                      SizedBox(width: getHorizontalSize(8)),
                      Text(
                        mypoliciesItemModelObj.createdAt!.format("dd MMM yyyy"),
                        style: TextStyle(
                          color: const Color(0xFF6B7280),
                          fontSize: getFontSize(14),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper methods for styling
  String _getIconPath(String insuranceType) {
    switch (insuranceType) {
      case 'home':
        return 'assets/images/home_icon.png';
      case 'car':
        return 'assets/images/car_icon.png';
      case 'medical':
        return 'assets/images/health_icon.png';
      case 'travel':
        return 'assets/images/travel_icon.png';
      default:
        return 'assets/images/default_icon.png';
    }
  }

  List<Color> _getGradientColors(String insuranceType) {
    switch (insuranceType) {
      case 'home':
        return [const Color(0xFF6366F1), const Color(0xFF8B5CF6)];
      case 'car':
        return [const Color(0xFF3B82F6), const Color(0xFF1D4ED8)];
      case 'medical':
        return [const Color(0xFF10B981), const Color(0xFF059669)];
      case 'travel':
        return [const Color(0xFFF59E0B), const Color(0xFFD97706)];
      default:
        return [const Color(0xFF6B7280), const Color(0xFF4B5563)];
    }
  }

  String getDisplayTitle(String? title) {
    if (title == null) return "";

    switch (title) {
      case "Home Insurance":
        return "lbl_home_insurance".tr;
      case "Travel Insurance":
        return "msg_travel_insurance".tr;
      case "Medical Insurance":
        return "Health Insurance".tr;
      case "Car Insurance":
        return 'Motor Insurance'.tr;
      default:
        return title;
    }
  }

  Color _getPrimaryColor(String insuranceType) {
    switch (insuranceType) {
      case 'home':
        return const Color(0xFF6366F1);
      case 'car':
        return const Color(0xFF3B82F6);
      case 'medical':
        return const Color(0xFF10B981);
      case 'travel':
        return const Color(0xFFF59E0B);
      default:
        return const Color(0xFF6B7280);
    }
  }
}
