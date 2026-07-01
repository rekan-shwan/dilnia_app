// import 'package:flutter/material.dart';
// import 'package:insurance_app/core/app_export.dart';
// import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
// import 'package:insurance_app/widgets/custom_elevated_button.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import '../../widgets/app_bar/appbar_title.dart';
// import '../../widgets/custom_elevated_button_loading.dart';
// import 'controller/payment_method_controller.dart';
// import 'models/payment_method_model.dart';

// class PaymentMethodScreen extends StatelessWidget {
//   PaymentMethodScreen({super.key});
//   final PaymentMethodController controller = Get.put(PaymentMethodController());
//   String base64Image =
//       "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";

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return WillPopScope(
//       onWillPop: () async {
//         Get.back();
//         return true;
//       },
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: appTheme.whiteA700,
//           appBar: CustomAppBar(
//             height: getVerticalSize(79),
//             leadingWidth: getSize(42),
//             leading: IconButton(
//               onPressed: () => Get.back(),
//               icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
//             ),
//             centerTitle: false,
//             title: AppbarTitle(text: "lbl_payment_method".tr),
//           ),
//           bottomNavigationBar: Obx(() {
//             return controller.paymentUrl.value.isNotEmpty
//                 ? const SizedBox()
//                 : controller.qrCodeData.value.isNotEmpty
//                     ? const SizedBox()
//                     : controller.isLoading.value
//                         ? CustomElevatedButtonLoading(
//                             text: "lbl_confirm".tr,
//                             margin: getMargin(left: 20, right: 20, bottom: 32),
//                             buttonStyle:
//                                 CustomButtonStyles.fillPrimary.copyWith(
//                               fixedSize: WidgetStateProperty.all<Size>(
//                                 Size(double.maxFinite, getVerticalSize(54)),
//                               ),
//                             ),
//                             buttonTextStyle:
//                                 CustomTextStyles.titleMediumWhiteA700,
//                           )
//                         : CustomElevatedButton(
//                             text: "lbl_confirm".tr,
//                             margin: getMargin(left: 20, right: 20, bottom: 32),
//                             buttonStyle:
//                                 CustomButtonStyles.fillPrimary.copyWith(
//                               fixedSize: WidgetStateProperty.all<Size>(
//                                 Size(double.maxFinite, getVerticalSize(54)),
//                               ),
//                             ),
//                             buttonTextStyle:
//                                 CustomTextStyles.titleMediumWhiteA700,
//                             onTap: () {
//                               final selected = controller.paymentData[
//                                   controller.currentPaymentIndex.value];
//                               final slug = selected.slug?.toLowerCase() ?? '';

//                               debugPrint("🚀 Selected Payment Slug: $slug");

//                               if (slug == "areeba-pay") {
//                                 controller.areebaPayment();
//                               } else if (slug == "fib-pay") {
//                                 controller.fibPayment();
//                               } else if (slug == "zain-cash-pay") {
//                                 controller.zainCashPayment();
//                               } else if (slug == "aqsati") {
//                                 controller.aqsatiPayment();
//                               } else {
//                                 onTapConfirm();
//                               }
//                             },
//                           );
//           }),
//           body: Obx(() {
//             return controller.paymentUrl.value.isNotEmpty
//                 ? WebViewWidget(controller: controller.webController.value)
//                 : controller.qrCodeData.value.isNotEmpty
//                     ? Center(
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 200,
//                               width: 200,
//                               alignment: Alignment.center,
//                               color: Colors.amber,
//                               child: Image.memory(
//                                 controller.base64ToUint8List(),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             CustomElevatedButton(
//                                 text: "lbl_open_personal_fib".tr,
//                                 margin:
//                                     getMargin(left: 20, right: 20, bottom: 32),
//                                 buttonStyle: CustomButtonStyles.fillPrimary
//                                     .copyWith(
//                                         fixedSize:
//                                             WidgetStateProperty.all<Size>(Size(
//                                                 double.maxFinite,
//                                                 getVerticalSize(54)))),
//                                 buttonTextStyle:
//                                     CustomTextStyles.titleMediumWhiteA700,
//                                 onTap: () {
//                                   controller.openOtherApp(0);
//                                 }),
//                             CustomElevatedButton(
//                                 text: "lbl_open_business_fib".tr,
//                                 margin:
//                                     getMargin(left: 20, right: 20, bottom: 32),
//                                 buttonStyle: CustomButtonStyles.fillPrimary
//                                     .copyWith(
//                                         fixedSize:
//                                             WidgetStateProperty.all<Size>(Size(
//                                                 double.maxFinite,
//                                                 getVerticalSize(54)))),
//                                 buttonTextStyle:
//                                     CustomTextStyles.titleMediumWhiteA700,
//                                 onTap: () {
//                                   controller.openOtherApp(1);
//                                 }),
//                             CustomElevatedButton(
//                                 text: "lbl_open_corporate_fib".tr,
//                                 margin:
//                                     getMargin(left: 20, right: 20, bottom: 32),
//                                 buttonStyle: CustomButtonStyles.fillPrimary
//                                     .copyWith(
//                                         fixedSize:
//                                             WidgetStateProperty.all<Size>(Size(
//                                                 double.maxFinite,
//                                                 getVerticalSize(54)))),
//                                 buttonTextStyle:
//                                     CustomTextStyles.titleMediumWhiteA700,
//                                 onTap: () {
//                                   controller.openOtherApp(2);
//                                 }),
//                             controller.fibPaymentId.isNotEmpty
//                                 ? CustomElevatedButton(
//                                     text: "lbl_refresh_fib".tr,
//                                     margin: getMargin(
//                                         left: 20, right: 20, bottom: 32),
//                                     buttonStyle: CustomButtonStyles.fillPrimary
//                                         .copyWith(
//                                             fixedSize:
//                                                 WidgetStateProperty.all<Size>(
//                                                     Size(double.maxFinite,
//                                                         getVerticalSize(54)))),
//                                     buttonTextStyle:
//                                         CustomTextStyles.titleMediumWhiteA700,
//                                     onTap: () {
//                                       //refresh
//                                       controller.getFibPaymentStatus();
//                                     })
//                                 : const SizedBox()
//                           ],
//                         ),
//                       )
//                     : controller.isLoading.value
//                         ? const Center(child: CircularProgressIndicator())
//                         : Container(
//                             width: double.maxFinite,
//                             padding: getPadding(
//                                 left: 20, top: 16, right: 20, bottom: 16),
//                             child: ListView.builder(
//                               itemCount: controller.paymentData.length,
//                               itemBuilder: (context, index) {
//                                 PaymentMethodData data =
//                                     controller.paymentData[index];
//                                 if (data.status == 1) {
//                                   return GestureDetector(
//                                     onTap: () {
//                                       controller.currentPaymentMethodId.value =
//                                           controller.paymentData[index].id!;
//                                       // controller.setCurrentPayment(index);
//                                       controller.currentPaymentIndex.value =
//                                           index;
//                                     },
//                                     child: Padding(
//                                       padding: getPadding(top: 8, bottom: 8),
//                                       child: Container(
//                                         height: getSize(56),
//                                         decoration: AppDecoration.fill10
//                                             .copyWith(
//                                                 borderRadius: BorderRadiusStyle
//                                                     .roundedBorder16),
//                                         child: Padding(
//                                           padding:
//                                               getPadding(left: 16, right: 16),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Obx(() {
//                                                     return CustomImageView(
//                                                       svgPath: controller
//                                                                   .currentPaymentIndex
//                                                                   .value ==
//                                                               index
//                                                           ? ImageConstant
//                                                               .imgRadioselected
//                                                           : ImageConstant
//                                                               .imgRadioUnselected,
//                                                     );
//                                                   }),
//                                                   SizedBox(
//                                                     width:
//                                                         getHorizontalSize(16),
//                                                   ),
//                                                   Text(
//                                                       data.name!.contains(
//                                                               "Areeba")
//                                                           ? "Master/Visa Card"
//                                                           : data.name!,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: theme
//                                                           .textTheme.bodyLarge),
//                                                 ],
//                                               ),
//                                               CustomImageView(
//                                                 height: 40,
//                                                 width: 50,
//                                                 url: data.imagePath,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 } else {
//                                   return const SizedBox();
//                                 }
//                               },
//                             ));
//           }),
//         ),
//       ),
//     );
//   }

//   onTapConfirm() {
//     Get.toNamed(AppRoutes.paymentConfirmOneScreen);
//   }
// }
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/custom_elevated_button_loading.dart';
import 'controller/payment_method_controller.dart';
import 'models/payment_method_model.dart';

class PaymentMethodScreen extends StatefulWidget {
  final String? paymentType;

  PaymentMethodScreen({super.key, this.paymentType});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final PaymentMethodController controller = Get.put(PaymentMethodController());

  String base64Image =
      "iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAIAAAAiOjnJAAAWo0lEQVR4Xu2bWZBd1XWGz0MGT9hmMPNgZjNDsLENBlvYmMHG2EkqVa5UOZUXx/ZLUhkqlVRleEiKSpUZNXWru89Rd0utVmtuTUAZ4UKAEVggISyhCRPZwkKAADFJqKXOjU+v5vL/Z6+tvdj33Nu656vvgcL/+vfep1YJqQ3Jn61MJ4SjgXCDLs4LnNTzjYZv0pomf7oynRDiB/bBDbo4L3BSzzcavklrWi2Wp5+Ter7R8E1a0+R7K9IJIX5gH9ygi/MCJ/V8o+GbtKbVYnn6OannGw3fpDWtFsvTz0k932j4Jq1p8t0V6YQQP7APbtDFeYGTer7R8E1a02qxPP2c1PONhm/Smia3rUgLxQeVBd9Evw8n9bwLbrD1uOBmWz832HpiwTfJTW5bnhaKBWXBN9Hvw0k974IbbD0uuNnWzw22nljwTXKrxRqDG2w9LrjZ1s8Ntp5Y8E1yk+8sTwvFgrLgm+j34aSed8ENth4X3Gzr5wZbTyz4JrnVYo3BDbYeF9xs6+cGW08s+Ca5ya3L00KxoCz4Jvp9OKnnXXCDrccFN9v6ucHWEwu+SW61WGNwg63HBTfb+rnB1hMLvklutVhjcIOtxwU32/q5wdYTC75JbvLtZWmhWCBw0ib2CpyMmw+Fm+P2h8I30e/DSZvYK3Ayt1osD9wctz8Uvol+H07axF6Bk7nJt5alhWKBwEmb2CtwMm4+FG6O2x8K30S/DydtYq/AydxqsTxwc9z+UPgm+n04aRN7BU7mVovlgZvj9ofCN9Hvw0mb2CtwMje5ZVlaKBYInLSJvQIn4+ZD4ea4/aHwTfT7cNIm9gqczE1uWZoWigUCJ21ir8DJuPlQuDlufyh8E/0+nLSJvQInc6vF8sDNcftD4Zvo9+GkTewVOJmb3Lw0LRQLBE7axF6Bk7a8S5y3ws22fm7Qezhpy4eKvQInc6vFMsLNtn5u0Hs4acuHir0CJ3OTm5amhWKBwEmb2Ctw0pZ3ifNWuNnWzw16Dydt+VCxV+BkbrVYRrjZ1s8Neg8nbflQsVfgZG61WEa42dbPDXoPJ235ULFX4GRucuNwWigWCJy0ib0CJ215lzhvhZtt/dyg93DSlg8VewVO5laLZYSbbf3coPdw0pYPFXsFTuYm3xxOC8UCgZM2sVfgpC3vEuetcLOtnxv0Hk7a8qFir8DJ3GqxxuBkc8X7CZy05UPFXoGTudVijcHJ5or3Ezhpy4eKvQInc5MbhtNCsUDgpE3sFThpy7vEeYGTzRXvJ3DSlg8VewVO5iY3LEkLxQKBkzaxV+CkLe8S5wVONle8n8BJWz5U7BU4mZt8Y0laKBYInLSJvQInbXmXOC9wsrni/QRO2vKhYq/AydxqscbgZHPF+wmctOVDxV6Bk7nVYo3ByeaK9xM4acuHir0CJ3OTry9JC8UCgZM2sVfgpC3vEucFTjZXvJ/ASVs+VOwVOJkbvFiNhm+i34eTNrHXBzfo4rwVbo7bHwrfJDe5fnFaKBaUBd9Evw8nbWKvD27QxXkr3By3PxS+SW61WGNirw9u0MV5K9wctz8UvklutVhjYq8PbtDFeSvcHLc/FL5JbjJpcVooFpQF30S/DydtYq8PbtDFeSvcHLc/FL5JbrVYY2KvD27QxXkr3By3PxS+SW7ytcVpoVhQFnwT/T6ctIm9PrhBF+etcHPc/lD4JrnVYo2JvT64QRfnrXBz3P5Q+Ca5ydcWpRNCfJDAyfbMt5rJVxelE0L8wAIn2zPfalaLdYTkW83kukXphBA/sMDJ9sy3mtViHSH5VrNarCMk32om1y5MJ4T4gQVOtme+1awW6wjJt5oJXvxI4SsL00Ix54MbbD3tRrVYHrjB1tNuVIvlgRtsPe3GEbtY1yxMC8WcD26w9bQb1WJ54AZbT7tx5C7WgrRQzPngBltPu3HELtbVC9JCMeeDG2w97Ua1WB64wdbTbgQv1pcXpIVizgc3xBXPEzipi/NWuNkm9gqcLEe8h1Atlkect8LNNrFX4GQ54j2EarE84rwVbraJvQInyxHvIQQv1pfmp4Vizgc3xBXPEzipi/NWuNkm9gqcLEe8h1Atlkect8LNNrFX4GQ54j2E4MX64vy0UMz54Ia44nkCJ3Vx3go328RegZPliPcQqsXyiPNWuNkm9gqcLEe8h1Atlkect8LNNrFX4GQ54j2E5Kr5aRSxWOCkLs774AZbT7vBXyyu1WK1KfzF4pp8YV4aRby4wEldnPfBDbaedoO/WFyrxWpT+IvFtVqsNoW/WFyTz89Lo4gXFzipi/M+uMHW027wF4trey3WXz84fPPSgUjO+fOV8/929f09G5/e/saeQ4cO4WGtDX+xuCZXzkujiBcXOKmL8z64Qen59rLBy+d2RfeKuV0/fGj5+ld24XktDH+xuAb/gPTKoTSK2CtwMmL+W41ZrNzaev306V+8d3AETy0F/gK6OG+Fm3Pba7FuWTp46WBXQ/3xz1e+e+AAHtx4+Avo4rwVbs4NXqw/GUqjiL0CJyPma78xumTOjEb7d6sfOFj6b7n4C+jivBVuzm2zxRouY7Fqzty0Hs9uMPwFdHHeCjfnBi/WFUNpFLFX4GTE/E3Dcy4emHE4XjUvu37xLMVJi2ZdMdjNg7lfGEp3v/MWHt9I+Avo4rwVbs5tr8V6avfvbl02dNFAp9eHd+7AYeKdAwce2PH8dxyFdzz9OA40Ev4CujhvhZtz22uxauwbGZm8/snL53RdOLtTsbYua3f/DoeLqK3XD1ct54brFvQdOHgQ0w2Dv4Auzlvh5tzgxbp8bhpF7BU4GTefs/W1V79//+ILZncqXjS78z/WPPz6/n04TOzdv++rC/u54ZlXXsJow+AvoIvzVrg517lYHNUvxEldnC+dkUMH+5/bcOVg+rlZHYrXLuhb+cI27w/WO599imcHt/wKcx8a/pLlfE8+Ude5WJfNTQvFnMBJXZxvEjvf2vs3q1acP6tD90cPrfjfva/jcB3rXt7FU3etW4O5Dw1/yXK+J5+o2+6LVaP2q9GyX2+9el7vef0dipcNdM949mnXb5uef+M1HvmftY9h7kPDX7Kc78kn6laLNcaefe/+86Orzuuffq7qd5fN2/DKbhweHX3kxR0crv0pAXMfGv6S5XxPPlHXuViXzk0LxZzASV2cbwFqv3St3rlj0sJZ5/RNVzy/v+P2Xz729nvv1c/2b9rAycXbN9dnosBfspzvySfquhdrMC0UcwIndXG+ZahtzH89+ch5fR1n905XnLRwdm0Lx39TX/uLB3Y8f828vvFAbbFeUH9bZoO/ZDnfk0/UdS7WJYNpoZgTOKmL8y3GU7t33bxk8KzeaYpn9077+9U/e+Xdd8an9u7f/++PP3xu7/Ta/3rL8FzvnyUN8Jcs53vyibrVYjnZ//sfpV7Q33nWzGmKnx9MF23fXP9L1y9fevHGxXNmP/fsB/viwF+ynO/JJ+oGL5ZLnBc4GVc8LzbbXt/zFysWnTlzmu5fPbB0x943xqf2jYy8N3JY/2IWv8j2Lm7Qezipi/MCJ3Odi3XxYBokzgucjCuep7Jk+5baLyTg0JaNQ1s2gRtffXl86uChQwObf3Xp7O7PZlMVa7+2dW1w/jzCBb/I8K7R8B5O6uK8wMnc9lqsa+f1n5FNPRzPnjn99icfe+fA+3/02/X2Wz9atZKT4K3DQ88U/TzCBb/I8K7R8B5O6uK8wMlcZbGyIHFe4GRc8TyVr8zrPz2devheN3/WIzt/Mz5e+/3Tyhe2XzU4k5P1npVNu3fdk4f57/rxiwzvGg3v4aQuzguczHUu1kVzsiBxXuBkXPE8lWvm9Z2WTgn1H1c/uOfdd8dL3ti/718efeiMdCon6/2Hh382chj/WOQXGd41Gt7DSV2cFziZ216LdfVQ36k9UwxePtCzaNv7f/SrsWbXzkkLZnOy3n999OfenzjwiwzvGg3v4aQuzguczHUu1oVzsiBxXuBkXPE8lS8P9Z3SM8XsD+5f+ps394637Rs58NO1a87MpnFy3IHnPP+CA7/I8K7R8B5O6uK8wMncNlusub0nd0/+MJ7X29H97Lr6f8Zt3vPqbcPzOTmer99Fhl9keNdoeA8ndXFe4GRuwxcrFnyi4dxJCwZO6ppcb+0fWH0bN/RtCnP9yx/4N/hGDh2cufGZ83s7oTz3x6vuqw8D/CLDu0bdPS5xXuCkTediXTAnCxLnY8MnGs69adHcE7sm13t6z9TD/OObl51vvfn9FUugv+Yp3VO2vrYH0wK/yPCuUXePS5wXOGnTvVgDWZA4Hxs+0XDujYsGT5hxb72n9UyJtVg1Dhw8+Jf3DcMRNf/z8dUYFfhFhneNuntc4rzASZvOxfrcQBYkzseGTzSc+82FuFindsdcrBq/fXPvad1T4ZQvDva6/njILzK8a9Td4xLnBU7abK/FumHh4PGd99R7Slfkxarxg/uWwinHd9770tvF/5khv8jwrlF3j0ucFzhps70W6xsL5hzXeU+9J3dNjr5Yd6xdA6fUfGLXi5j7Pfwiw7tG3T0ucV7gpE3nYp0/kAWJ87HhEw3n/v9iddxT70kz4i/WtPVr4ZSaq3/7/v81VA+/yPCuUXePS5wXOGmzvRbr6wvmHNtxT70nNmCx/mn1KjilJvyEYhx+keFdo+4elzgvcNJmct7sLEi8iMBJW94lzpu4fv7AMdPvrrf2O+u4i7Vv5MBFfd1wynEdd7++r/g/fOWX2sTeZtN2i3X09Lvrrf22Ou5i/feax+CImtfM7Xf9qZBfahN7m017LdakeQOfnnZ3vZ/piLZYIwcP3rH2iaM/2J97+xO/wLTAL7WJvc0mOXd2FiQWCJy05V3ivImrB/s/Ne2ueo+dfvfg5o1zfQ5t2TR/y3MLtj63aNvmxdu2DG/fuvT5rcuf37bi19vve2F77S/uXPvEl+b0QXnuCZ337nzzTbyKwC+1ib3Npr0W69L+9JNT7yrZf3vsYbxHHfxSm9jbbJJzZmdBYoHASVveJc6buLS/56gpd5bpVQO98J+2AvxSm9jbbNprsS7p6/nElDtL85y0Y9trr+ElPgi/1Cb2NpvknFlZkFggcNKWd4nzJi7u7fn45DvL8bL+dMueV/EGBL/UJvY2G+cPSGNx9qysUMyVwkW9PR+bfEejPWrKXT958AHXD64A/jK6OO+DG/QeTtry7bVYF87s/ui9dzTOkzun/OTB+ze8vNv1UyuGv4wuzvvgBr2Hk7Z8wxfrrFlZoZgrhf6Nz05d91R0O9Y/PbR507rdL4X+16qj7u/jEud9cIPew0lbvr0WqwXhL6OL8z64Qe/hpC1fLVaT4S+ji/M+uEHv4aQt3/DFOrM/KxRz7Qp/GV2c98ENeg8nbflqsZoMfxldnPfBDXoPJ235hi/WZ/uzQjHXrvCX0cV5H9yg93DSlk/4b9nEAwVO2vIucV7gpJ6PBZ+on8vJ1hTv7aNarMjwifq5nGxN8d4+kjP6syhiscBJW94lzguc1POx4BP1cznZmuK9fVSLFRk+UT+Xk60p3ttHcnpfFkUsFjhpy7vEeYGTej4WfKJ+LidbU7y3j2qxIsMn6udysjXFe/uoFisyfKJ+LidbU7y3j+S0viyKWCxw0pZ3ifMCJ/V8LPhE/VxOtqZ4bx8J/o2JBn8C/UNwMq54nsBJXZy3ws1x+11M+MU6tS8rFHMCJ+OK5wmc1MV5K9wct9/FxF+s3qxQzAmcjCueJ3BSF+etcHPcfhfVYkUWzxM4qYvzVrg5br+LCb9Yp/RmhWJO4GRc8TyBk7o4b4Wb4/a7qBYrsniewEldnLfCzXH7XVSLFVk8T+CkLs5b4ea4/S4m/GKd3JsVijmBk3HF8wRO6uK8FW6O2+8i4SNbU7y4wElb3iXO++AGm9grcDJuPhRuzk1OmplNCPFBAidteZc474MbbGKvwMm4+VC4ObdaLI8474MbbGKvwMm4+VC4ObdaLI8474MbbGKvwMm4+VC4OTc5cWY2IcQHCZy05V3ivA9usIm9Aifj5kPh5txqsTzivA9usIm9Aifj5kPh5tzkhJnZhBAfJHDSlneJ8z64wSb2CpyMmw+Fm3OTE7JsQogPEjhpy7vEeR/cYBN7BU7GzYfCzbnOxcKCsuCb6PfhpC7Ox4ZP1M/lpJ4PhZv1fk7a8snxWVYoFpQF30S/Dyd1cT42fKJ+Lif1fCjcrPdz0pavFisyfKJ+Lif1fCjcrPdz0pZPPpNlhWJBWfBN9PtwUhfnY8Mn6udyUs+Hws16Pydt+WqxIsMn6udyUs+Hws16Pydt+WqxIsMn6udyUs+Hws16Pydt+eS4NCsUC8qCb6Lfh5O6OB8bPlE/l5N6PhRu1vs5actXixUZPlE/l5N6PhRu1vs5acsnx6ZZoVggcNIm9gqc1POhcLOtnxv0Hk42V7yfFW7OrRbL2M8Neg8nmyvezwo351aLZeznBr2Hk80V72eFm3OTY9KsUCwQOGkTewVO6vlQuNnWzw16DyebK97PCjfnJsf0ZIVigcBJm9grcFLPh8LNtn5u0Hs42Vzxfla4OTc5uicrFAsETtrEXoGTej4Ubrb1c4Pew8nmivezws251WIZ+7lB7+Fkc8X7WeHm3GqxjP3coPdwsrni/axwc27y6Z6sUCwQOGkTewVO6nkX3KD3cFIX5wVO6uK8FW7W+zmp50OpFmsMTurivMBJXZy3ws16Pyf1fCjJp7qzQjEocNIm9gqc1PMuuEHv4aQuzguc1MV5K9ys93NSz4dSLdYYnNTFeYGTujhvhZv1fk7q+VCqxRqDk7o4L3BSF+etcLPez0k9H0ryye6sUAwKnLSJvQIn9bwLbtB7OKmL8wIndXHeCjfr/ZzU86FUizUGJ3VxXuCkLs5b4Wa9n5N6PpTkqO6sUAwKnLSJvQIn9bwLbtB7OKmL8wIndXHeCjfr/ZzU86FM+MXipC0fSzxP4KQuzguctOVd4rzASd3kqK6sUCwWOGkTewVOlpOPJZ4ncFIX5wVO2vIucV7gpG7yia6sUCwWOGkTewVOlpOPJZ4ncFIX5wVO2vIucV7gpG61WJHF8wRO6uK8wElb3iXOC5zUrRYrsniewEldnBc4acu7xHmBk7rJx7uyQrFY4KRN7BU4WU4+lniewEldnBc4acu7xHmBk7rVYkUWzxM4qYvzAidteZc4L3BSN/nYjKxQLBY4aRN7BU6Wk48lnidwUhfnBU7a8i5xXuCkbvBiNRq+ie0+3BC3J1Ts9cENujgvcFLPh8LNudVieeAGm9jrgxt0cV7gpJ4PhZtzk4/OyArFgrLgm9juww1xe0LFXh/coIvzAif1fCjcnFstlgdusIm9PrhBF+cFTur5ULg5N/nIjKxQLCgLvontPtwQtydU7PXBDbo4L3BSz4fCzbnVYnngBpvY64MbdHFe4KSeD4Wbc5OPdGaFYkFZ8E1s9+GGuD2hYq8PbtDFeYGTej4Ubs5N/rgzKxQLyoJvYrsPN8TtCRV7fXCDLs4LnNTzoXBzrnOxWk18kBVutvVzgy7O++AGW08s+Ca6yR91ZhNCfKgVbrb1c4MuzvvgBltPLPgmutViGfu5QRfnfXCDrScWfBPdarGM/dygi/M+uMHWEwu+iW7yhx3ZhBAfaoWbbf3coIvzPrjB1hMLvolutVjGfm7QxXkf3GDriQXfRDf5g45sQogPtcLNtn5u0MV5H9xg64kF30S3WixjPzfo4rwPbrD1xIJvovt/4gjbI1dzo9UAAAAASUVORK5CYII";

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    // Show selection dialog immediately if no payment type provided
    if (widget.paymentType == null && !controller.hasShownDialog.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showPaymentTypeDialog(context);
      });
    } else if (widget.paymentType != null) {
      // Set payment type if provided via constructor
      controller.setPaymentType(widget.paymentType!);
    }

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.whiteA700,
          appBar: CustomAppBar(
            height: getVerticalSize(79),
            leadingWidth: getSize(42),
            leading: IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.homeScreenContainer1Screen);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
            ),
            centerTitle: false,
            title: AppbarTitle(text: "lbl_payment_method".tr),
          ),
          bottomNavigationBar: Obx(() {
            return controller.paymentUrl.value.isNotEmpty
                ? const SizedBox()
                : controller.qrCodeData.value.isNotEmpty
                    ? const SizedBox()
                    : controller.isLoading.value
                        ? CustomElevatedButtonLoading(
                            text: "lbl_confirm".tr,
                            margin: getMargin(left: 20, right: 20, bottom: 32),
                            buttonStyle:
                                CustomButtonStyles.fillPrimary.copyWith(
                              fixedSize: WidgetStateProperty.all<Size>(
                                Size(double.maxFinite, getVerticalSize(54)),
                              ),
                            ),
                            buttonTextStyle:
                                CustomTextStyles.titleMediumWhiteA700,
                          )
                        : CustomElevatedButton(
                            text: "lbl_confirm".tr,
                            margin: getMargin(left: 20, right: 20, bottom: 32),
                            buttonStyle:
                                CustomButtonStyles.fillPrimary.copyWith(
                              fixedSize: WidgetStateProperty.all<Size>(
                                Size(double.maxFinite, getVerticalSize(54)),
                              ),
                            ),
                            buttonTextStyle:
                                CustomTextStyles.titleMediumWhiteA700,
                            onTap: () {
                              final selected = controller.filteredPaymentData[
                                  controller.currentPaymentIndex.value];
                              final slug = selected.slug?.toLowerCase() ?? '';

                              debugPrint("🚀 Selected Payment Slug: $slug");

                              if (slug == "areeba-pay") {
                                controller.areebaPayment();
                              } else if (slug == "fib-pay") {
                                controller.fibPayment();
                              } else if (slug == "zain-cash-pay") {
                                controller.zainCashPayment();
                              } else if (slug == "aqsati") {
                                controller.aqsatiPayment();
                              } else {
                                onTapConfirm();
                              }
                            },
                          );
          }),
          body: Obx(() {
            return controller.paymentUrl.value.isNotEmpty
                ? WebViewWidget(controller: controller.webController.value)
                : controller.qrCodeData.value.isNotEmpty
                    ? Center(
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              alignment: Alignment.center,
                              color: Colors.amber,
                              child: Image.memory(
                                controller.base64ToUint8List(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomElevatedButton(
                                text: "lbl_open_personal_fib".tr,
                                margin:
                                    getMargin(left: 20, right: 20, bottom: 32),
                                buttonStyle: CustomButtonStyles.fillPrimary
                                    .copyWith(
                                        fixedSize:
                                            WidgetStateProperty.all<Size>(Size(
                                                double.maxFinite,
                                                getVerticalSize(54)))),
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumWhiteA700,
                                onTap: () {
                                  controller.openOtherApp(0);
                                }),
                            CustomElevatedButton(
                                text: "lbl_open_business_fib".tr,
                                margin:
                                    getMargin(left: 20, right: 20, bottom: 32),
                                buttonStyle: CustomButtonStyles.fillPrimary
                                    .copyWith(
                                        fixedSize:
                                            WidgetStateProperty.all<Size>(Size(
                                                double.maxFinite,
                                                getVerticalSize(54)))),
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumWhiteA700,
                                onTap: () {
                                  controller.openOtherApp(1);
                                }),
                            CustomElevatedButton(
                                text: "lbl_open_corporate_fib".tr,
                                margin:
                                    getMargin(left: 20, right: 20, bottom: 32),
                                buttonStyle: CustomButtonStyles.fillPrimary
                                    .copyWith(
                                        fixedSize:
                                            WidgetStateProperty.all<Size>(Size(
                                                double.maxFinite,
                                                getVerticalSize(54)))),
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumWhiteA700,
                                onTap: () {
                                  controller.openOtherApp(2);
                                }),
                            controller.fibPaymentId.isNotEmpty
                                ? CustomElevatedButton(
                                    text: "lbl_refresh_fib".tr,
                                    margin: getMargin(
                                        left: 20, right: 20, bottom: 32),
                                    buttonStyle: CustomButtonStyles.fillPrimary
                                        .copyWith(
                                            fixedSize:
                                                WidgetStateProperty.all<Size>(
                                                    Size(double.maxFinite,
                                                        getVerticalSize(54)))),
                                    buttonTextStyle:
                                        CustomTextStyles.titleMediumWhiteA700,
                                    onTap: () {
                                      controller.getFibPaymentStatus();
                                    })
                                : const SizedBox()
                          ],
                        ),
                      )
                    : controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : Container(
                            width: double.maxFinite,
                            padding: getPadding(
                                left: 20, top: 16, right: 20, bottom: 16),
                            child: controller.filteredPaymentData.isEmpty &&
                                    controller.paymentType.value ==
                                        'installment'
                                ? // Show "Coming Soon" for installment when Aqsati is disabled
                                Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.schedule,
                                          size: 80,
                                          color: Colors.grey[400],
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          'Coming Soon'.tr,
                                          style: theme.textTheme.headlineSmall
                                              ?.copyWith(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Installment payment option will be available soon'
                                              .tr,
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: Colors.grey[500],
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 30),
                                        ElevatedButton(
                                          onPressed: () {
                                            _showPaymentTypeDialog(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                appTheme.buttonColor,
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32, vertical: 12),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                              'Choose Different Payment'.tr),
                                        ),
                                      ],
                                    ),
                                  )
                                : // Show payment methods list
                                ListView.builder(
                                    itemCount:
                                        controller.filteredPaymentData.length,
                                    itemBuilder: (context, index) {
                                      PaymentMethodData data =
                                          controller.filteredPaymentData[index];
                                      if (data.status == 1) {
                                        return GestureDetector(
                                          onTap: () {
                                            controller.currentPaymentMethodId
                                                    .value =
                                                controller
                                                    .filteredPaymentData[index]
                                                    .id!;
                                            controller.currentPaymentIndex
                                                .value = index;
                                          },
                                          child: Padding(
                                            padding:
                                                getPadding(top: 8, bottom: 8),
                                            child: Container(
                                              height: getSize(56),
                                              decoration: AppDecoration.fill10
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder16),
                                              child: Padding(
                                                padding: getPadding(
                                                    left: 16, right: 16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Obx(() {
                                                          return CustomImageView(
                                                            svgPath: controller
                                                                        .currentPaymentIndex
                                                                        .value ==
                                                                    index
                                                                ? ImageConstant
                                                                    .imgRadioselected
                                                                : ImageConstant
                                                                    .imgRadioUnselected,
                                                          );
                                                        }),
                                                        SizedBox(
                                                          width:
                                                              getHorizontalSize(
                                                                  16),
                                                        ),
                                                        Text(
                                                            data.name!.contains(
                                                                    "Areeba")
                                                                ? "Master/Visa Card"
                                                                : data.name!
                                                                        .contains(
                                                                            "FIB")
                                                                    ? "First Iraqi Bank"
                                                                    : data
                                                                        .name!,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: theme
                                                                .textTheme
                                                                .bodyLarge),
                                                      ],
                                                    ),
                                                    data.name!
                                                            .contains("Areeba")
                                                        ? CustomImageView(
                                                            fit: BoxFit.contain,
                                                            height: 40,
                                                            width: 50,
                                                            imagePath:
                                                                "assets/images/master-visa.png",
                                                          )
                                                        : CustomImageView(
                                                            height: 40,
                                                            width: 50,
                                                            url: data.imagePath,
                                                          ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                          );
          }),
        ),
      ),
    );
  }

  void _showPaymentTypeDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10)),
          title: Text(
            'Select Payment Type'.tr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose your preferred payment method:'.tr,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: appTheme.buttonColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10))),
                      onPressed: () {
                        controller.setPaymentType('installment');
                        Navigator.of(context).pop();
                      },
                      child: Text("Installment".tr),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: appTheme.buttonColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10))),
                      onPressed: () {
                        controller.setPaymentType('normal');
                        Navigator.of(context).pop();
                      },
                      child: Text("Normal".tr),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  onTapConfirm() {
    Get.toNamed(AppRoutes.paymentConfirmOneScreen);
  }
}
