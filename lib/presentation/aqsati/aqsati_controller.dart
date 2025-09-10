import 'package:get/get.dart';
import 'aqsati_service.dart';
import 'aqsati_model.dart';

class AqsatiController extends GetxController {
  var isLoading = false.obs;
  var customerInfo = Rxn<AqsatiCustomerInfo>();
  var errorMessage = ''.obs;

  Future<void> getCustomerInfo(String identity) async {
    if (identity.trim().isEmpty) {
      errorMessage.value = 'الهوية لا يمكن أن تكون فارغة';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';
    customerInfo.value = null;

    print('🔍 Requesting customer info for: $identity');

    try {
      final result = await AqsatiService.fetchCustomerInfo(identity: identity);

      if (result != null && result.succeeded) {
        customerInfo.value = result;
        print('✅ Customer Info Loaded:');
        print('👤 Name: ${result.fullName}');
        print('👩‍👧 Mother Name: ${result.motherName}');
        print('📞 Phone: ${result.phoneNumber}');
        print('💼 Job Title: ${result.jobTitle}');
        print('🎂 Birth Date: ${result.birthDate}');
        print('💰 Allowable Salary: ${result.allowableSalary}');
        print('🕒 Max Months: ${result.maxCountOfMonth}');
        print('🧾 Session ID: ${result.sessionId}');
        print(
            '📜 Previous Subscriptions: ${result.previousSubscriptions.length}');

        for (var sub in result.previousSubscriptions) {
          print(
              '➡️ Installment #${sub.installmentId} - ${sub.merchantName} - ${sub.amount}');
        }
      } else {
        errorMessage.value = 'فشل في جلب بيانات العميل';
        print('❌ Failed to load customer info or customer not eligible');
      }
    } catch (e) {
      errorMessage.value = 'حدث خطأ غير متوقع';
      print('❌ Exception during fetch: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
