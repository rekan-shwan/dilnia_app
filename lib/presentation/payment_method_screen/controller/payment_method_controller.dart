// import 'dart:typed_data';
// import 'package:insurance_app/core/app_export.dart';
// import 'package:insurance_app/presentation/payment_method_screen/models/payment_method_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../models/payment_data_model.dart';

// /// A controller class for the PaymentMethodScreen.
// ///
// /// This class manages the state of the PaymentMethodScreen, including the
// /// current paymentMethodModelObj
// class PaymentMethodController extends GetxController {
//   var currentPaymentIndex = 0.obs;
//   var currentPaymentMethodId = 0.obs;
//   var areebaUserName = ''.obs;
//   var areebaApiKey = ''.obs;
//   var areebaPass = ''.obs;
//   var areebaUrl = ''.obs;

//   var fibUserName = ''.obs;
//   var fibApiKey = ''.obs;
//   var fibPass = ''.obs;
//   var fibUrl = ''.obs;
//   var paymentUrl = ''.obs;
//   var qrCodeData = ''.obs;
//   var personalAppLink = ''.obs;
//   var businessAppLink = ''.obs;
//   var corporateAppLink = ''.obs;
//   var fibPaymentId = ''.obs;
//   PaymentDataModel paymentDataModel = Get.arguments;
//   RxList<PaymentMethodData> paymentData = <PaymentMethodData>[].obs;
//   var isLoading = false.obs;
//   Rx<WebViewController> webController = WebViewController().obs;
//   void setCurrentPayment(int index) {
//     currentPaymentIndex.value = index;
//     update();
//   }

//   // Local storage
//   final storage = GetStorage();
//   @override
//   void onInit() {
//     super.onInit();
//     paymentMethodList();

//     // Load data when the controller is initialized
//   }

//   @override
//   void dispose() {
//     webController.value.clearCache();
//     super.dispose();
//   }

//   Uint8List base64ToUint8List() {
//     // Check if the Base64 string has a prefix and remove it
//     String returnData = '';
//     if (qrCodeData.value.startsWith("data:image")) {
//       returnData = qrCodeData.value.split(",").last;
//     }
//     return base64Decode(returnData);
//   }

//   Future<void> openOtherApp(int value) async {
//     String url = '';
//     String prefix = "https://personal.dev.first-iraqi-bank.co/?link=";
//     String prefix1 = "https://business.stage.first-iraqi-bank.co/?link=";
//     String prefix2 = "https://corporate.stage.first-iraqi-bank.co/?link=";
//     if (value == 0) {
//       url = personalAppLink.value.replaceFirst(prefix, "");
//     } else if (value == 1) {
//       url = businessAppLink.value.replaceFirst(prefix1, "");
//     } else if (value == 2) {
//       url = corporateAppLink.value.replaceFirst(prefix2, "");
//     }
//     debugPrint("FIB url ==$url");
//     if (url.isNotEmpty) {
//       String cleanedUrl = url;
//       debugPrint("FIB cleanedUrl ==$cleanedUrl");
//       final Uri appUri = Uri.parse(cleanedUrl);

//       if (await canLaunchUrl(appUri)) {
//         await launchUrl(appUri);
//       } else {
//         throw "Could not launch $appUri";
//       }
//     }
//   }

//   setController(url) {
//     webController.value = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageFinished: (url) {
//             debugPrint("@@@@ onPageFinished  @@@@@  ${url}");
//             if (url.contains(successUrlV)) {
//               debugPrint("");
//               updatePayment();
//             }
//             if (url.contains(errorUrlV)) {
//               Get.toNamed(AppRoutes.paymentConfirmOneScreen,
//                   arguments: [errorUrlV, paymentDataModel.invoiceId]);
//             }
//             if (url.contains(cancelUrlV)) {
//               Get.toNamed(AppRoutes.paymentConfirmOneScreen,
//                   arguments: [cancelUrlV, paymentDataModel.invoiceId]);
//             }
//             if (url.contains(callbackUrlV)) {
//               Get.toNamed(AppRoutes.paymentConfirmOneScreen,
//                   arguments: [callbackUrlV, paymentDataModel.invoiceId]);
//             }
//           },
//           onWebResourceError: (WebResourceError error) {
//             debugPrint("@@@@ onWebResourceError  @@@@@  ${error.url}");
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             debugPrint("@@@@ onNavigationRequest  @@@@@  ${request.url}");
//             debugPrint(
//                 "@@@@ onNavigationRequest2  @@@@@  ${request.isMainFrame}");
//             // if (request.url.contains("bkash.com")) {
//             //   //sendbox starts with sandbox.payment.bkash.com and live starts with payment.bkash.com
//             //   return NavigationDecision.navigate;
//             // }

//             return NavigationDecision.navigate;
//           },
//           onUrlChange: (change) {
//             debugPrint("@@@@ onUrlChange  @@@@@  ${change.url}");
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(url));
//   }

//   Future<void> aqsatiPayment() async {
//     final acceptToken = storage.read('token');
//     isLoading.value = true;
//     try {
//       final payload = {
//         'amount': paymentDataModel.amount,
//         'name': '${paymentDataModel.firstName} ${paymentDataModel.lastName}',
//         'phone': '',
//         'invoice_id': paymentDataModel.invoiceId,
//         'callback_url': paymentDataModel.callbackUrl,
//         'cancel_url': paymentDataModel.cancelUrl,
//         'error_url': paymentDataModel.errorUrl,
//         'success_url': paymentDataModel.successUrl,
//       };

//       debugPrint("🔄 Aqsati Payload: $payload");

//       final response = await http.post(
//         Uri.parse('https://api.dilnia.com/api/v1/aqsati/pay'),
//         headers: {
//           'Authorization': 'Bearer $acceptToken',
//           'Content-Type': 'application/json',
//           'accept': 'application/json',
//         },
//         body: jsonEncode(payload),
//       );

//       debugPrint("🔄 Aqsati Response: ${response.statusCode}");
//       debugPrint("🔄 Aqsati Response Body: ${response.body}");

//       if (response.statusCode == 200) {
//         final result = jsonDecode(response.body);
//         if (result['payment_url'] != null) {
//           paymentUrl.value = result['payment_url'];
//           setController(paymentUrl.value);

//           // انتقال مع التأكيد على نوع البيانات
//           Get.toNamed(AppRoutes.paymentConfirmOneScreen,
//               arguments: ["aqsati", paymentDataModel.invoiceId]);
//         } else {
//           debugPrint("❌ payment_url is null or missing in response");
//           Get.snackbar('Error', 'Redirect URL not found',
//               snackPosition: SnackPosition.BOTTOM);
//         }
//       } else {
//         final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
//         debugPrint("❌ Error from server: $error");
//         Get.snackbar('Error', error, snackPosition: SnackPosition.BOTTOM);
//       }
//     } catch (e, stack) {
//       debugPrint("❌ Exception: $e");
//       debugPrint("❌ Stacktrace: $stack");
//       Get.snackbar('Error', 'Something went wrong: $e',
//           snackPosition: SnackPosition.BOTTOM);
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> updatePayment() async {
//     final acceptToken = storage.read('token');
//     try {
//       var headers = {
//         accept: acceptValue,
//         'Authorization': 'Bearer $acceptToken'
//       };

//       var request =
//           http.MultipartRequest('POST', Uri.parse('$baseUrl/insurance/pay'));
//       request.fields.addAll({
//         'payment_history_id': paymentDataModel.userpaymentId.toString(),
//         'payment_method_id': currentPaymentMethodId.value.toString(),
//       });
//       request.headers.addAll(headers);
//       http.StreamedResponse response = await request.send();

//       var str = await response.stream.bytesToString();
//       debugPrint("Update Payment str = $str");
//       if (response.statusCode == 200) {
//         Get.toNamed(AppRoutes.paymentConfirmOneScreen,
//             arguments: [successUrlV, paymentDataModel.invoiceId]);
//         Get.snackbar(
//           'Success',
//           'Payment Added Successfully',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       } else {
//         Get.toNamed(AppRoutes.paymentConfirmOneScreen,
//             arguments: [errorUrlV, paymentDataModel.invoiceId]);
//         Get.snackbar(
//           'Error',
//           'Failed to paid. Please try again later.',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Something went wrong: $e',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> paymentMethodList() async {
//     debugPrint("*************** paymentMethodList  ***********");
//     isLoading.value = true;
//     final acceptToken = storage.read('token');
//     try {
//       var headers = {
//         accept: acceptValue,
//         'Authorization': 'Bearer $acceptToken'
//       };

//       var request = http.Request('GET', Uri.parse('$baseUrl/payment'));

//       request.headers.addAll(headers);
//       http.StreamedResponse response = await request.send();

//       var str = await response.stream.bytesToString();

//       if (response.statusCode == 200) {
//         debugPrint("Payment str = $str");
//         print(" url----------->$baseUrl /payment");
//         PaymentMethodModel bannerListModel = PaymentMethodModel.fromJson(str);
//         for (var method in paymentData) {
//           debugPrint("------------- Payment Method Data -------------");
//           debugPrint(jsonEncode(method.toMap()));
//         }
//         paymentData.assignAll(bannerListModel.data?.data ?? []);

//         for (var method in paymentData) {
//           debugPrint("Payment Method => "
//               "Name: ${method.name}, "
//               "API: ${method.api}, "
//               "Slug: ${method.slug}, "
//               "Description: ${method.slug}, "
//               "User Name: ${method.userName}, "
//               "Password: ${method.password}, "
//               "Username: ${method.userName}, "
//               "Password: ${method.password}, "
//               "Key: ${method.key}");
//         }
//         paymentData.refresh();
//         update();
//         areebaUrl.value = paymentData[0].api ?? '';
//         areebaUserName.value = paymentData[0].userName ?? '';
//         areebaPass.value = paymentData[0].password ?? '';
//         areebaApiKey.value = paymentData[0].key ?? '';
//         fibUserName.value = paymentData[3].userName ?? '';
//         fibUrl.value = paymentData[3].api ?? '';
//         fibPass.value = paymentData[3].password ?? '';
//         fibApiKey.value = paymentData[3].key ?? '';

//         isLoading.value = false;
//         debugPrint("paymentData == ${paymentData.toString()}");
//         // Get.snackbar(
//         //   'Success',
//         //   'Get Payment Method Successful',
//         //   snackPosition: SnackPosition.BOTTOM,
//         // );
//       } else {
//         Get.snackbar(
//           'Error',
//           'Failed to get Banner. Please try again later.',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Something went wrong: $e',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   //make invoice id more unique
//   String generateUniqueInvoiceId(String invoiceId) {
//     final now = DateTime.now();
//     final formattedDateTime = '${now.year}'
//         '${now.month.toString().padLeft(2, '0')}'
//         '${now.day.toString().padLeft(2, '0')}'
//         '${now.hour.toString().padLeft(2, '0')}'
//         '${now.minute.toString().padLeft(2, '0')}'
//         '${now.second.toString().padLeft(2, '0')}';

//     return '$invoiceId-$formattedDateTime';
//   }
//   // Use the correct base URL

//   Future<String?> areebaPayment() async {
//     String apiUrl =
//         "${areebaUrl.value}/api/v3/transaction/${areebaApiKey.value}/debit"; //https://gateway.areebapayment.com

// // Basic Authentication (Base64 Encoding)
//     String authString = "${areebaUserName.value}:${areebaPass.value}";
//     String encodedAuth = base64Encode(utf8.encode(authString));

//     Map<String, dynamic> payload = {
//       "merchantTransactionId":
//           generateUniqueInvoiceId(paymentDataModel.invoiceId!),
//       "amount": paymentDataModel.amount,
//       "currency": paymentDataModel.currency,
//       "successUrl": paymentDataModel.successUrl,
//       "errorUrl": paymentDataModel.errorUrl,
//       "cancelUrl": paymentDataModel.cancelUrl,
//       "callbackUrl": paymentDataModel.callbackUrl,
//       "customer": {
//         "firstName": paymentDataModel.firstName,
//         "lastName": paymentDataModel.lastName,
//         "company": paymentDataModel.company ?? 'N/A',
//         "ipAddress": '',
//       },
//       "language": "en",
//     };

//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": 'Basic $encodedAuth',
//       },
//       body: jsonEncode(payload),
//     );
//     debugPrint("encodedAuth == $encodedAuth");
//     debugPrint("authString == $authString");
//     debugPrint("apiUrl == $apiUrl");
//     debugPrint("payload == $payload");
//     debugPrint("response == ${response.body}");
//     if (response.statusCode == 200) {
//       final responseBody = jsonDecode(response.body);
//       debugPrint("responseBody $responseBody");
//       if (responseBody['success'] && responseBody['returnType'] == 'REDIRECT') {
//         paymentUrl.value = responseBody['redirectUrl'];
//         setController(paymentUrl.value);
//         return responseBody['redirectUrl'];
//       } else {
//         Get.snackbar(
//           'Error',
//           '${responseBody['errorMessage']}',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//         throw Exception(
//             "Payment Error: ${responseBody['errorMessage'] ?? 'Unknown error'}");
//       }
//     } else {
//       debugPrint("HTTP Error");
//       Get.snackbar(
//         'Error',
//         jsonDecode(response.body)['errorMessage'],
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       throw Exception("HTTP Error: ${response.statusCode}");
//     }
//   }

//   Future<String?> _getFibAccessToken() async {
//     final url = Uri.parse(
//         "${fibUrl.value}/auth/realms/fib-online-shop/protocol/openid-connect/token");
//     debugPrint("FIB USER == ${fibUserName.value}  ${fibPass.value}");
//     //  'client_id': 'dilnia-insurance', //fibUserName.value,
//     // 'client_secret': '0bae9cce-8f2e-411a-baba-bf661e85798f' //fibPass.value
//     final response = await http.post(
//       url,
//       body: {
//         'grant_type': 'client_credentials',
//         'client_id': fibUserName.value,
//         'client_secret': fibPass.value
//       },
//     );
//     debugPrint("Access == ${response.body.toString()}");
//     if (response.statusCode == 200) {
//       final body = json.decode(response.body);
//       return body['access_token'];
//     } else {
//       Get.snackbar(
//         'Error',
//         '${json.decode(response.body)["error"]}',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return null;
//     }
//   }

//   Future<Map<String, dynamic>?> fibPayment() async {
//     final accessToken = await _getFibAccessToken();
//     if (accessToken == null) return null;

//     final url = Uri.parse("${fibUrl.value}/protected/v1/payments");
//     final response = await http.post(
//       url,
//       headers: {
//         'Authorization': 'Bearer $accessToken',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         'monetaryValue': {
//           'amount': paymentDataModel.amount,
//           'currency': paymentDataModel.currency,
//         },
//         'callbackUrl': paymentDataModel.callbackUrl,
//         'description': paymentDataModel.firstName,
//       }),
//     );
//     debugPrint("FIB == ${response.body.toString()}");
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final responseBody = jsonDecode(response.body);
//       debugPrint("FIB responseBody == $responseBody");
//       qrCodeData.value = responseBody['qrCode'];
//       personalAppLink.value = responseBody['personalAppLink'];
//       businessAppLink.value = responseBody['businessAppLink'];
//       corporateAppLink.value = responseBody['corporateAppLink'];
//       fibPaymentId.value = responseBody['paymentId'];
//       debugPrint("FIB qrCode == ${qrCodeData.value}");
//       debugPrint("FIB personalAppLink == ${personalAppLink.value}");
//       debugPrint("FIB businessAppLink == ${businessAppLink.value}");
//       debugPrint("FIB corporateAppLink == ${corporateAppLink.value}");
//       // setController(paymentUrl.value);
//       return json.decode(response.body);
//     } else {
//       Get.snackbar(
//         'Error',
//         '${json.decode(response.body)["error"]}',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return null;
//     }
//   }

//   Future<void> zainCashPayment() async {
//     print("----->1");
//     final acceptToken = storage.read('token');
//     isLoading.value = true;
//     try {
//       print("----->2");
//       final response = await http.post(
//         Uri.parse('https://api.dilnia.com/api/v1/zaincash/pay'),
//         headers: {
//           'Authorization': 'Bearer $acceptToken',
//           'Content-Type': 'application/json',
//           'accept': 'application/json',
//         },
//         body: jsonEncode({
//           'amount': paymentDataModel.amount,
//           'invoice_id': paymentDataModel.invoiceId,
//           'callback_url': paymentDataModel.callbackUrl,
//           'cancel_url': paymentDataModel.cancelUrl,
//           'error_url': paymentDataModel.errorUrl,
//           'success_url': paymentDataModel.successUrl,
//           'full_name':
//               '${paymentDataModel.firstName} ${paymentDataModel.lastName}',
//         }),
//       );

//       if (response.statusCode == 200) {
//         print("----->3");
//         final result = jsonDecode(response.body);
//         print("ZainCash Full Response: $result"); // هذه الإضافة مهمة
//         if (result['payment_url'] != null) {
//           print("Redirecting to: ${result['payment_url']}");
//           paymentUrl.value = result['payment_url'];
//           setController(paymentUrl.value);
//         } else {
//           print("❗ payment_url not found in response.");
//           Get.snackbar('Error', 'Redirect URL not found',
//               snackPosition: SnackPosition.BOTTOM);
//         }
//       } else {
//         print("----->4");
//         final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
//         Get.snackbar('Error', error, snackPosition: SnackPosition.BOTTOM);
//       }
//     } catch (e) {
//       print("----->5");
//       Get.snackbar('Error', 'Something went wrong: $e',
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }

//   Future<String?> getFibPaymentStatus() async {
//     debugPrint("FIB fibPaymentId ==${fibPaymentId.value}");
//     // https: //fib.dev.fib.iq/protected/v1/payments/{PAYMENTID}/status
//     try {
//       final url = Uri.parse(
//           "${fibUrl.value}/protected/v1/payments/${fibPaymentId.value}/status");
//       debugPrint("FIB url ==$url");
//       var request = http.Request('GET', url);

//       http.StreamedResponse response = await request.send();
//       var str = await response.stream.bytesToString();
//       debugPrint("FIB STR ==$str");
//       if (response.statusCode == 200) {
//         String paymentStatus = json.decode(str)["status"];
//         debugPrint("FIB STR status ==${json.decode(str)["status"]}");
//         if (paymentStatus.toLowerCase() == 'paid') {
//           updatePayment();
//         } else {
//           Get.snackbar(
//             'Error',
//             'Payment Status $paymentStatus',
//             snackPosition: SnackPosition.BOTTOM,
//           );
//         }
//         return str;
//       } else {
//         Get.snackbar(
//           'Error',
//           '${json.decode(str)["error"]}',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//         return null;
//       }
//     } catch (e) {
//       debugPrint("FIB e ==$e");
//       Get.snackbar(
//         'Error',
//         'Something went wrong: $e',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       // isLoading.value = false;
//     }
//   }
// }
import 'dart:typed_data';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/payment_method_screen/models/payment_method_model.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/payment_data_model.dart';

class PaymentMethodController extends GetxController {
  var currentPaymentIndex = 0.obs;
  var currentPaymentMethodId = 0.obs;
  var areebaUserName = ''.obs;
  var areebaApiKey = ''.obs;
  var areebaPass = ''.obs;
  var areebaUrl = ''.obs;

  var fibUserName = ''.obs;
  var fibApiKey = ''.obs;
  var fibPass = ''.obs;
  var fibUrl = ''.obs;
  var paymentUrl = ''.obs;
  var qrCodeData = ''.obs;
  var personalAppLink = ''.obs;
  var businessAppLink = ''.obs;
  var corporateAppLink = ''.obs;
  var fibPaymentId = ''.obs;

  // Payment type management
  var paymentType = ''.obs; // 'installment' or 'normal'
  var hasShownDialog = false.obs;

  PaymentDataModel paymentDataModel = Get.arguments;
  RxList<PaymentMethodData> paymentData = <PaymentMethodData>[].obs;
  var isLoading = false.obs;
  Rx<WebViewController> webController = WebViewController().obs;

  // Filtered payment data based on selected payment type
  List<PaymentMethodData> get filteredPaymentData {
    if (paymentType.value == 'installment') {
      // Check if Aqsati is available and enabled
      final aqsatiPayment = paymentData.firstWhere(
        (payment) => payment.slug?.toLowerCase() == 'aqsati',
        orElse: () => PaymentMethodData(), // Return empty if not found
      );

      if (aqsatiPayment.id != null && aqsatiPayment.status == 1) {
        // Aqsati is available and enabled - show it normally
        return [aqsatiPayment];
      } else {
        // Aqsati is disabled or not available - return empty list
        // The UI will handle showing "Coming Soon"
        return [];
      }
    } else {
      // Show all payment methods except Aqsati for normal payment
      return paymentData
          .where((payment) =>
              payment.slug?.toLowerCase() != 'aqsati' && payment.status == 1)
          .toList();
    }
  }

  void setCurrentPayment(int index) {
    currentPaymentIndex.value = index;
    update();
  }

  void setPaymentType(String type) {
    paymentType.value = type;
    hasShownDialog.value = true;
    // Reset current payment index when payment type changes
    currentPaymentIndex.value = 0;
    currentPaymentMethodId.value = 0;

    // Set the first available payment method as selected
    if (filteredPaymentData.isNotEmpty) {
      currentPaymentMethodId.value = filteredPaymentData[0].id ?? 0;
    }

    update();
    debugPrint("Payment type set to: $type");
    debugPrint("Filtered payment methods count: ${filteredPaymentData.length}");
  }

  // Local storage
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    paymentMethodList();
    // Load data when the controller is initialized
  }

  @override
  void dispose() {
    webController.value.clearCache();
    super.dispose();
  }

  Uint8List base64ToUint8List() {
    // Check if the Base64 string has a prefix and remove it
    String returnData = '';
    if (qrCodeData.value.startsWith("data:image")) {
      returnData = qrCodeData.value.split(",").last;
    }
    return base64Decode(returnData);
  }

  Future<void> openOtherApp(int value) async {
    String url = '';
    String prefix = "https://personal.dev.first-iraqi-bank.co/?link=";
    String prefix1 = "https://business.stage.first-iraqi-bank.co/?link=";
    String prefix2 = "https://corporate.stage.first-iraqi-bank.co/?link=";
    if (value == 0) {
      url = personalAppLink.value.replaceFirst(prefix, "");
    } else if (value == 1) {
      url = businessAppLink.value.replaceFirst(prefix1, "");
    } else if (value == 2) {
      url = corporateAppLink.value.replaceFirst(prefix2, "");
    }
    debugPrint("FIB url ==$url");
    if (url.isNotEmpty) {
      String cleanedUrl = url;
      debugPrint("FIB cleanedUrl ==$cleanedUrl");
      final Uri appUri = Uri.parse(cleanedUrl);

      if (await canLaunchUrl(appUri)) {
        await launchUrl(appUri);
      } else {
        throw "Could not launch $appUri";
      }
    }
  }

  setController(url) {
    webController.value = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            debugPrint("@@@@ onPageFinished  @@@@@  ${url}");
            if (url.contains(successUrlV)) {
              debugPrint("");
              updatePayment();
            }
            if (url.contains(errorUrlV)) {
              Get.toNamed(AppRoutes.paymentConfirmOneScreen,
                  arguments: [errorUrlV, paymentDataModel.invoiceId]);
            }
            if (url.contains(cancelUrlV)) {
              Get.toNamed(AppRoutes.paymentConfirmOneScreen,
                  arguments: [cancelUrlV, paymentDataModel.invoiceId]);
            }
            if (url.contains(callbackUrlV)) {
              Get.toNamed(AppRoutes.paymentConfirmOneScreen,
                  arguments: [callbackUrlV, paymentDataModel.invoiceId]);
            }
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("@@@@ onWebResourceError  @@@@@  ${error.url}");
          },
          onNavigationRequest: (NavigationRequest request) {
            debugPrint("@@@@ onNavigationRequest  @@@@@  ${request.url}");
            debugPrint(
                "@@@@ onNavigationRequest2  @@@@@  ${request.isMainFrame}");
            return NavigationDecision.navigate;
          },
          onUrlChange: (change) {
            debugPrint("@@@@ onUrlChange  @@@@@  ${change.url}");
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  Future<void> aqsatiPayment() async {
    final acceptToken = storage.read('token');
    isLoading.value = true;
    try {
      final payload = {
        'amount': paymentDataModel.amount,
        'name': '${paymentDataModel.firstName} ${paymentDataModel.lastName}',
        'phone': '',
        'invoice_id': paymentDataModel.invoiceId,
        'callback_url': paymentDataModel.callbackUrl,
        'cancel_url': paymentDataModel.cancelUrl,
        'error_url': paymentDataModel.errorUrl,
        'success_url': paymentDataModel.successUrl,
      };

      debugPrint("🔄 Aqsati Payload: $payload");

      final response = await http.post(
        Uri.parse('https://api.dilnia.com/api/v1/aqsati/pay'),
        headers: {
          'Authorization': 'Bearer $acceptToken',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
        body: jsonEncode(payload),
      );

      debugPrint("🔄 Aqsati Response: ${response.statusCode}");
      debugPrint("🔄 Aqsati Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result['payment_url'] != null) {
          paymentUrl.value = result['payment_url'];
          setController(paymentUrl.value);

          // انتقال مع التأكيد على نوع البيانات
          Get.toNamed(AppRoutes.paymentConfirmOneScreen,
              arguments: ["aqsati", paymentDataModel.invoiceId]);
        } else {
          debugPrint("❌ payment_url is null or missing in response");
          Get.snackbar('Error', 'Redirect URL not found',
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
        debugPrint("❌ Error from server: $error");
        Get.snackbar('Error', error, snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e, stack) {
      debugPrint("❌ Exception: $e");
      debugPrint("❌ Stacktrace: $stack");
      Get.snackbar('Error', 'Something went wrong: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updatePayment() async {
    final acceptToken = storage.read('token');
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/insurance/pay'));
      request.fields.addAll({
        'payment_history_id': paymentDataModel.userpaymentId.toString(),
        'payment_method_id': currentPaymentMethodId.value.toString(),
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      debugPrint("Update Payment str = $str");
      if (response.statusCode == 200) {
        Get.toNamed(AppRoutes.paymentConfirmOneScreen,
            arguments: [successUrlV, paymentDataModel.invoiceId]);
        Get.snackbar(
          'Success',
          'Payment Added Successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.toNamed(AppRoutes.paymentConfirmOneScreen,
            arguments: [errorUrlV, paymentDataModel.invoiceId]);
        Get.snackbar(
          'Error',
          'Failed to paid. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> paymentMethodList() async {
    debugPrint("*************** paymentMethodList  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request('GET', Uri.parse('$baseUrl/payment'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        debugPrint("Payment str = $str");
        print(" url----------->$baseUrl /payment");
        PaymentMethodModel bannerListModel = PaymentMethodModel.fromJson(str);
        for (var method in paymentData) {
          debugPrint("------------- Payment Method Data -------------");
          debugPrint(jsonEncode(method.toMap()));
        }
        paymentData.assignAll(bannerListModel.data?.data ?? []);

        for (var method in paymentData) {
          debugPrint("Payment Method => "
              "Name: ${method.name}, "
              "API: ${method.api}, "
              "Slug: ${method.slug}, "
              "Description: ${method.slug}, "
              "User Name: ${method.userName}, "
              "Password: ${method.password}, "
              "Username: ${method.userName}, "
              "Password: ${method.password}, "
              "Key: ${method.key}");
        }
        paymentData.refresh();
        update();

        // Set payment method credentials based on available data
        if (paymentData.isNotEmpty) {
          for (var method in paymentData) {
            if (method.slug?.toLowerCase() == 'areeba-pay') {
              areebaUrl.value = method.api ?? '';
              areebaUserName.value = method.userName ?? '';
              areebaPass.value = method.password ?? '';
              areebaApiKey.value = method.key ?? '';
            } else if (method.slug?.toLowerCase() == 'fib-pay') {
              fibUserName.value = method.userName ?? '';
              fibUrl.value = method.api ?? '';
              fibPass.value = method.password ?? '';
              fibApiKey.value = method.key ?? '';
            }
          }
        }

        isLoading.value = false;
        debugPrint("paymentData == ${paymentData.toString()}");
      } else {
        Get.snackbar(
          'Error',
          'Failed to get Payment Methods. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  //make invoice id more unique
  String generateUniqueInvoiceId(String invoiceId) {
    final now = DateTime.now();
    final formattedDateTime = '${now.year}'
        '${now.month.toString().padLeft(2, '0')}'
        '${now.day.toString().padLeft(2, '0')}'
        '${now.hour.toString().padLeft(2, '0')}'
        '${now.minute.toString().padLeft(2, '0')}'
        '${now.second.toString().padLeft(2, '0')}';

    return '$invoiceId-$formattedDateTime';
  }

  void debugNetworkInfo() async {
    try {
      // Check connectivity
      final connectivityResult = await Connectivity().checkConnectivity();
      print('Connectivity: $connectivityResult');

      // Try a test API call
      final testResponse = await http.get(Uri.parse('https://httpbin.org/get'));
      print('Test API status: ${testResponse.statusCode}');
    } catch (e) {
      print('Network debug error: $e');
    }
  }

  Future<String?> areebaPayment() async {
    String apiUrl =
        "${areebaUrl.value}/api/v3/transaction/${areebaApiKey.value}/debit";

    // Basic Authentication (Base64 Encoding)
    String authString = "${areebaUserName.value}:${areebaPass.value}";
    String encodedAuth = base64Encode(utf8.encode(authString));

    Map<String, dynamic> payload = {
      "merchantTransactionId":
          generateUniqueInvoiceId(paymentDataModel.invoiceId!),
      "amount": paymentDataModel.amount,
      "currency": paymentDataModel.currency,
      "successUrl": paymentDataModel.successUrl,
      "errorUrl": paymentDataModel.errorUrl,
      "cancelUrl": paymentDataModel.cancelUrl,
      "callbackUrl": paymentDataModel.callbackUrl,
      "customer": {
        "firstName": paymentDataModel.firstName,
        "lastName": paymentDataModel.lastName,
        "company": paymentDataModel.company ?? 'N/A',
        "ipAddress": '',
      },
      "language": "en",
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Basic $encodedAuth',
      },
      body: jsonEncode(payload),
    );
    debugPrint("encodedAuth == $encodedAuth");
    debugPrint("authString == $authString");
    debugPrint("apiUrl == $apiUrl");
    debugPrint("payload == $payload");
    debugPrint("response == ${response.body}");

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      debugPrint("responseBody $responseBody");
      if (responseBody['success'] && responseBody['returnType'] == 'REDIRECT') {
        paymentUrl.value = responseBody['redirectUrl'];
        setController(paymentUrl.value);
        return responseBody['redirectUrl'];
      } else {
        Get.snackbar(
          'Error',
          '${responseBody['errorMessage']}',
          snackPosition: SnackPosition.BOTTOM,
        );
        throw Exception(
            "Payment Error: ${responseBody['errorMessage'] ?? 'Unknown error'}");
      }
    } else {
      debugPrint("HTTP Error");
      Get.snackbar(
        'Error',
        jsonDecode(response.body)['errorMessage'],
        snackPosition: SnackPosition.BOTTOM,
      );
      throw Exception("HTTP Error: ${response.statusCode}");
    }
  }

  Future<String?> _getFibAccessToken() async {
    final url = Uri.parse(
        "${fibUrl.value}/auth/realms/fib-online-shop/protocol/openid-connect/token");
    debugPrint("FIB USER == ${fibUserName.value}  ${fibPass.value}");

    final response = await http.post(
      url,
      body: {
        'grant_type': 'client_credentials',
        'client_id': fibUserName.value,
        'client_secret': fibPass.value
      },
    );
    debugPrint("Access == ${response.body.toString()}");
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return body['access_token'];
    } else {
      Get.snackbar(
        'Error',
        '${json.decode(response.body)["error"]}',
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
  }

  Future<Map<String, dynamic>?> fibPayment() async {
    final accessToken = await _getFibAccessToken();
    if (accessToken == null) return null;

    final url = Uri.parse("${fibUrl.value}/protected/v1/payments");
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'monetaryValue': {
          'amount': paymentDataModel.amount,
          'currency': paymentDataModel.currency,
        },
        'callbackUrl': paymentDataModel.callbackUrl,
        'description': paymentDataModel.firstName,
      }),
    );
    debugPrint("FIB == ${response.body.toString()}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = jsonDecode(response.body);
      debugPrint("FIB responseBody == $responseBody");
      qrCodeData.value = responseBody['qrCode'];
      personalAppLink.value = responseBody['personalAppLink'];
      businessAppLink.value = responseBody['businessAppLink'];
      corporateAppLink.value = responseBody['corporateAppLink'];
      fibPaymentId.value = responseBody['paymentId'];
      debugPrint("FIB qrCode == ${qrCodeData.value}");
      debugPrint("FIB personalAppLink == ${personalAppLink.value}");
      debugPrint("FIB businessAppLink == ${businessAppLink.value}");
      debugPrint("FIB corporateAppLink == ${corporateAppLink.value}");
      return json.decode(response.body);
    } else {
      Get.snackbar(
        'Error',
        '${json.decode(response.body)["error"]}',
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
  }

  Future<void> zainCashPayment() async {
    print("----->1");
    final acceptToken = storage.read('token');
    isLoading.value = true;
    try {
      print("----->2");
      final response = await http.post(
        Uri.parse('https://api.dilnia.com/api/v1/zaincash/pay'),
        headers: {
          'Authorization': 'Bearer $acceptToken',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
        body: jsonEncode({
          'amount': paymentDataModel.amount,
          'invoice_id': paymentDataModel.invoiceId,
          'callback_url': paymentDataModel.callbackUrl,
          'cancel_url': paymentDataModel.cancelUrl,
          'error_url': paymentDataModel.errorUrl,
          'success_url': paymentDataModel.successUrl,
          'full_name':
              '${paymentDataModel.firstName} ${paymentDataModel.lastName}',
        }),
      );

      if (response.statusCode == 200) {
        print("----->3");
        final result = jsonDecode(response.body);
        print("ZainCash Full Response: $result");
        if (result['payment_url'] != null) {
          print("Redirecting to: ${result['payment_url']}");
          paymentUrl.value = result['payment_url'];
          setController(paymentUrl.value);
        } else {
          print("❗ payment_url not found in response.");
          Get.snackbar('Error', 'Redirect URL not found',
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        print("----->4");
        final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
        Get.snackbar('Error', error, snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("----->5");
      Get.snackbar('Error', 'Something went wrong: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<String?> getFibPaymentStatus() async {
    debugPrint("FIB fibPaymentId ==${fibPaymentId.value}");
    try {
      final url = Uri.parse(
          "${fibUrl.value}/protected/v1/payments/${fibPaymentId.value}/status");
      debugPrint("FIB url ==$url");
      var request = http.Request('GET', url);

      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();
      debugPrint("FIB STR ==$str");
      if (response.statusCode == 200) {
        String paymentStatus = json.decode(str)["status"];
        debugPrint("FIB STR status ==${json.decode(str)["status"]}");
        if (paymentStatus.toLowerCase() == 'paid') {
          updatePayment();
        } else {
          Get.snackbar(
            'Error',
            'Payment Status $paymentStatus',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
        return str;
      } else {
        Get.snackbar(
          'Error',
          '${json.decode(str)["error"]}',
          snackPosition: SnackPosition.BOTTOM,
        );
        return null;
      }
    } catch (e) {
      debugPrint("FIB e ==$e");
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      // isLoading.value = false;
    }
  }

  bool get isAqsatiAvailable {
    return paymentData.any((payment) =>
        payment.slug?.toLowerCase() == 'aqsati' && payment.status == 1);
  }
}
