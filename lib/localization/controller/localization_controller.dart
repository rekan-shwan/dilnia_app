import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationController extends GetxController {
  final box = GetStorage();
  var selectedLanguage = 'English'.obs;
  var currentLocale =
      const Locale('en', 'US').obs; // أضفنا متغير Locale قابل للملاحظة

  final languages = {
    'English': const Locale('en', 'US'),
    'عربي': const Locale('ar', 'AE'),
    'کوردی': const Locale('ur'), // صححت الكود من 'ur' إلى 'ku' للكردية
  };

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final savedLang = box.read('language') ?? 'English';
    selectedLanguage.value = savedLang;
    currentLocale.value = languages[savedLang]!;

    // تأخير تحديث اللغة لضمان تحميل الخطوط
    Future.microtask(() {
      Get.updateLocale(currentLocale.value);
      _forceRebuildApp(); // إضافة هذه الوظيفة
    });
  }

  void changeLanguage(String languageKey) {
    selectedLanguage.value = languageKey;
    currentLocale.value = languages[languageKey]!;
    box.write('language', languageKey);

    Get.updateLocale(currentLocale.value);
    _forceRebuildApp(); // إعادة بناء التطبيق بالكامل
  }

  void _forceRebuildApp() {
    // هذه الطريقة تضفر إعادة بناء جذر التطبيق
    Get.forceAppUpdate();

    // أو يمكنك استخدام:
    // Get.key.currentState?.setState(() {});
  }
}
