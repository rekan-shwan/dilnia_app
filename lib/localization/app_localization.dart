import 'package:get/get.dart';
import 'languages/ar_ae_translations.dart';
import 'languages/en_us_translations.dart';
import 'languages/ku_iq_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': enUs, 'ar_AE': arAE, 'ur_PK': kuIQ};
}
