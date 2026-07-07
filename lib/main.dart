import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:insurance_app/localization/controller/localization_controller.dart';
import 'core/app_export.dart';
import 'notification/notification_service.dart';

GlobalKey<ScaffoldMessengerState> globalKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Firebase.initializeApp();
  await NotificationService.instance.initialize();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: PrefUtils().getThemeData() == "primary"
          ? Brightness.dark
          : Brightness.light,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ButtonThemeData buttonTheme =
      ButtonThemeData(splashColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    final LocalizationController localeController =
        Get.put(LocalizationController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        buttonTheme: buttonTheme,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        useMaterial3: true,
        fontFamily: _getFontFamily(localeController.currentLocale.value),
        visualDensity: VisualDensity.standard,
        bottomSheetTheme: BottomSheetThemeData(
          surfaceTintColor: appTheme.whiteA700,
          backgroundColor: appTheme.whiteA700,
        ),
        dialogTheme: DialogThemeData(
            backgroundColor: appTheme.whiteA700,
            surfaceTintColor: appTheme.whiteA700),
      ),
      translations: AppLocalization(),
      locale: localeController.currentLocale.value,
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'AE'),
        //  Locale('ur'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Dilnia Insurance App',
      initialBinding: InitialBindings(),
      // initialRoute: AppRoutes.carInsuranceRoute,
      initialRoute: AppRoutes.initialRoute,
      //initialRoute: AppRoutes.homeInsuranceRoute,
      //initialRoute: AppRoutes.homeScreenContainer1Screen,

      getPages: AppRoutes.pages,
    );
  }

  String _getFontFamily(Locale locale) {
    switch (locale.languageCode) {
      case 'ur':
        return 'SF UI Text';
      case 'ar':
        return 'SF Pro Display'; // أو أي خط عربي مخصص
      default:
        return 'SF Pro Display';
    }
  }
}

// class LocalizationController extends GetxController {
//   final box = GetStorage();
//   var selectedLanguage = 'English'.obs;
//   var currentLocale = const Locale('en', 'US').obs;

//   final languages = {
//     'English': const Locale('en', 'US'),
//     'عربي': const Locale('ar', 'AE'),
//     // 'کوردی': const Locale('ur'),
//   };

//   @override
//   void onInit() {
//     super.onInit();
//     _loadSavedLanguage();
//   }

//   Future<void> _loadSavedLanguage() async {
//     final savedLang = box.read('language') ?? 'English';
//     selectedLanguage.value = savedLang;
//     currentLocale.value = languages[savedLang]!;

//     Future.microtask(() {
//       Get.updateLocale(currentLocale.value);
//     });
//   }

//   void changeLanguage(String languageKey) {
//     selectedLanguage.value = languageKey;
//     currentLocale.value = languages[languageKey]!;
//     box.write('language', languageKey);

//     Get.updateLocale(currentLocale.value);
//     Get.forceAppUpdate();
//   }
// }
