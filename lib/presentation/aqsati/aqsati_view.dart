import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/added/snack_bar_widget.dart';
import 'aqsati_controller.dart';

class AqsatiView extends StatelessWidget {
  AqsatiView({super.key});

  final controller = Get.put(AqsatiController());
  final TextEditingController identityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('التحقق من التقسيط عبر أقساطي')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: identityController,
              decoration: const InputDecoration(
                labelText: 'رقم QiCard / MasterCard',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Obx(() {
              return controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                      onPressed: () {
                        final identity = identityController.text.trim();
                        if (identity.isNotEmpty) {
                          controller.getCustomerInfo(identity);
                        } else {
                          //Get.snackbar('خطأ', 'من فضلك أدخل الرقم');
                          SnackBarWidget()
                              .showSnackBar(Get.context!, 'من فضلك أدخل الرقم');
                        }
                      },
                      icon: const Icon(Icons.search),
                      label: const Text('تحقق'),
                    );
            }),
            const SizedBox(height: 24),
            Obx(() {
              if (controller.customerInfo.value != null) {
                final info = controller.customerInfo.value!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('الاسم: ${info.fullName}',
                        style: const TextStyle(fontSize: 18)),
                    Text('الحد المتاح: ${info.allowableSalary} د.ع',
                        style: const TextStyle(fontSize: 18)),
                  ],
                );
              } else if (controller.errorMessage.isNotEmpty) {
                return Text(
                  controller.errorMessage.value,
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
