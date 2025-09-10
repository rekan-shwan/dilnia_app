import 'package:insurance_app/presentation/car_insurance_details_screen/car_insurance_details_screen.dart';
import 'package:insurance_app/presentation/home_insurance_details/home_insurence_details_screen.dart';
import 'package:insurance_app/presentation/splash_screen/splash_screen.dart';
import 'package:insurance_app/presentation/splash_screen/binding/splash_binding.dart';
import 'package:insurance_app/presentation/splash_screen_one_screen/splash_screen_one_screen.dart';
import 'package:insurance_app/presentation/splash_screen_one_screen/binding/splash_screen_one_binding.dart';
import 'package:insurance_app/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:insurance_app/presentation/onboarding_one_screen/binding/onboarding_one_binding.dart';
import 'package:insurance_app/presentation/login_screen/login_screen.dart';
import 'package:insurance_app/presentation/login_screen/binding/login_binding.dart';
import 'package:insurance_app/presentation/login_error_screen/login_error_screen.dart';
import 'package:insurance_app/presentation/login_error_screen/binding/login_error_binding.dart';
import 'package:insurance_app/presentation/login_active_screen/login_active_screen.dart';
import 'package:insurance_app/presentation/login_active_screen/binding/login_active_binding.dart';
import 'package:insurance_app/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:insurance_app/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:insurance_app/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:insurance_app/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:insurance_app/presentation/otp_verification_screen/otp_verification_screen.dart';
import 'package:insurance_app/presentation/otp_verification_screen/binding/otp_verification_binding.dart';
import 'package:insurance_app/presentation/reset_password_screen/reset_password_screen.dart';
import 'package:insurance_app/presentation/reset_password_screen/binding/reset_password_binding.dart';
import 'package:insurance_app/presentation/changed_password_screen/changed_password_screen.dart';
import 'package:insurance_app/presentation/changed_password_screen/binding/changed_password_binding.dart';
import 'package:insurance_app/presentation/home_screen_container1_screen/home_screen_container1_screen.dart';
import 'package:insurance_app/presentation/home_screen_container1_screen/binding/home_screen_container1_binding.dart';
import 'package:insurance_app/presentation/family_insurence_screen/family_insurence_screen.dart';
import 'package:insurance_app/presentation/family_insurence_screen/binding/family_insurence_binding.dart';
import 'package:insurance_app/presentation/how_insurance_work_screen/how_insurance_work_screen.dart';
import 'package:insurance_app/presentation/how_insurance_work_screen/binding/how_insurance_work_binding.dart';
import 'package:insurance_app/presentation/blog_screen/blog_screen.dart';
import 'package:insurance_app/presentation/blog_screen/binding/blog_binding.dart';
import 'package:insurance_app/presentation/bike_insurence_screen/bike_insurence_screen.dart';
import 'package:insurance_app/presentation/bike_insurence_screen/binding/bike_insurence_binding.dart';
import 'package:insurance_app/presentation/bike_insurence_one_screen/bike_insurence_one_screen.dart';
import 'package:insurance_app/presentation/bike_insurence_one_screen/binding/bike_insurence_one_binding.dart';
import 'package:insurance_app/presentation/details_tab_container_screen/details_tab_container_screen.dart';
import 'package:insurance_app/presentation/details_tab_container_screen/binding/details_tab_container_binding.dart';
import 'package:insurance_app/presentation/comprehensive_plan_screen/comprehensive_plan_screen.dart';
import 'package:insurance_app/presentation/comprehensive_plan_screen/binding/comprehensive_plan_binding.dart';
import 'package:insurance_app/presentation/ticket_list_screen/ticket_list_screen.dart';
import 'package:insurance_app/presentation/verify_bike_details_screen/verify_bike_details_screen.dart';
import 'package:insurance_app/presentation/verify_bike_details_screen/binding/verify_bike_details_binding.dart';
import 'package:insurance_app/presentation/choose_bike_model_screen/choose_bike_model_screen.dart';
import 'package:insurance_app/presentation/choose_bike_model_screen/binding/choose_bike_model_binding.dart';
import 'package:insurance_app/presentation/select_year_popup_screen/select_year_popup_screen.dart';
import 'package:insurance_app/presentation/select_year_popup_screen/binding/select_year_popup_binding.dart';
import 'package:insurance_app/presentation/current_policy_status_screen/current_policy_status_screen.dart';
import 'package:insurance_app/presentation/current_policy_status_screen/binding/current_policy_status_binding.dart';
import 'package:insurance_app/presentation/customize_insured_value_screen/customize_insured_value_screen.dart';
import 'package:insurance_app/presentation/customize_insured_value_screen/binding/customize_insured_value_binding.dart';
import 'package:insurance_app/presentation/select_add_ons_screen/select_add_ons_screen.dart';
import 'package:insurance_app/presentation/select_add_ons_screen/binding/select_add_ons_binding.dart';
import 'package:insurance_app/presentation/few_more_details_screen/few_more_details_screen.dart';
import 'package:insurance_app/presentation/few_more_details_screen/binding/few_more_details_binding.dart';
import 'package:insurance_app/presentation/choose_a_date_screen/choose_a_date_screen.dart';
import 'package:insurance_app/presentation/choose_a_date_screen/binding/choose_a_date_binding.dart';
import 'package:insurance_app/presentation/review_details_screen/review_details_screen.dart';
import 'package:insurance_app/presentation/review_details_screen/binding/review_details_binding.dart';
import 'package:insurance_app/presentation/payment_method_screen/payment_method_screen.dart';
import 'package:insurance_app/presentation/payment_method_screen/binding/payment_method_binding.dart';
import 'package:insurance_app/presentation/payment_confirm_one_screen/payment_confirm_one_screen.dart';
import 'package:insurance_app/presentation/payment_confirm_one_screen/binding/payment_confirm_one_binding.dart';
import 'package:insurance_app/presentation/payment_confirm_screen/payment_confirm_screen.dart';
import 'package:insurance_app/presentation/payment_confirm_screen/binding/payment_confirm_binding.dart';
import 'package:insurance_app/presentation/notification_screen/notification_screen.dart';
import 'package:insurance_app/presentation/notification_screen/binding/notification_binding.dart';
import 'package:insurance_app/presentation/home_insurance_details/home_insurence_details_screen.dart';
import 'package:insurance_app/presentation/home_insurance_details/binding/policies_one_binding.dart';
import 'package:insurance_app/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:insurance_app/presentation/my_profile_screen/binding/my_profile_binding.dart';
import 'package:insurance_app/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:insurance_app/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:insurance_app/presentation/about_us_screen/about_us_screen.dart';
import 'package:insurance_app/presentation/about_us_screen/binding/about_us_binding.dart';
import 'package:insurance_app/presentation/help_screen/help_screen.dart';
import 'package:insurance_app/presentation/help_screen/binding/help_binding.dart';
import 'package:insurance_app/presentation/help_detail_screen/help_detail_screen.dart';
import 'package:insurance_app/presentation/help_detail_screen/binding/help_detail_binding.dart';
import 'package:insurance_app/presentation/rate_us_screen/rate_us_screen.dart';
import 'package:insurance_app/presentation/rate_us_screen/binding/rate_us_binding.dart';
import 'package:insurance_app/presentation/feedback_screen/feedback_screen.dart';
import 'package:insurance_app/presentation/feedback_screen/binding/feedback_binding.dart';
import 'package:insurance_app/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:insurance_app/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

import '../presentation/car_insurance_screen/binding/car_insurance_binding.dart';
import '../presentation/car_insurance_screen/car_insurance_container_page.dart';
import '../presentation/home_insurance_details/home_insurence_details_screen.dart';
import '../presentation/home_insurance_details/home_insurence_details_screen.dart';
import '../presentation/home_insurance_details/home_insurence_details_screen.dart';
import '../presentation/home_insurance_screen/binding/home_insurance_binding.dart';
import '../presentation/home_insurance_screen/home_insurance_container_page.dart';
import '../presentation/medical_insurance_details_screen/medical_insurance_details_screen.dart';
import '../presentation/medical_insurance_screen/binding/medical_insurance_binding.dart';
import '../presentation/medical_insurance_screen/medical_insurance_container_page.dart';
import '../presentation/ticket_details_screen/binding/ticket_details_binding.dart';
import '../presentation/ticket_details_screen/ticket_details_screen.dart';
import '../presentation/ticket_list_screen/binding/ticket_list_binding.dart';
import '../presentation/travel_insurance_details_screen/travel_insurance_details_screen.dart';
import '../presentation/travel_insurance_screen/binding/travel_insurance_binding.dart';
import '../presentation/travel_insurance_screen/travel_insurance_container_page.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String splashScreenOneScreen = '/splash_screen_one_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String loginScreen = '/login_screen';

  static const String loginErrorScreen = '/login_error_screen';

  static const String loginActiveScreen = '/login_active_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String otpVerificationScreen = '/otp_verification_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String changedPasswordScreen = '/changed_password_screen';

  static const String homeScreenContainerPage = '/home_screen_container_page';

  static const String homeScreenContainer1Screen =
      '/home_screen_container1_screen';

  static const String familyInsurenceScreen = '/family_insurence_screen';

  static const String howInsuranceWorkScreen = '/how_insurance_work_screen';

  static const String blogScreen = '/blog_screen';

  static const String bikeInsurenceScreen = '/bike_insurence_screen';

  static const String bikeInsurenceOneScreen = '/bike_insurence_one_screen';

  static const String detailsPage = '/details_page';

  static const String detailsTabContainerScreen =
      '/details_tab_container_screen';

  static const String comprehensivePlanScreen = '/comprehensive_plan_screen';

  static const String verifyBikeDetailsScreen = '/verify_bike_details_screen';

  static const String chooseBikeModelScreen = '/choose_bike_model_screen';

  static const String selectYearPopupScreen = '/select_year_popup_screen';

  static const String currentPolicyStatusScreen =
      '/current_policy_status_screen';

  static const String customizeInsuredValueScreen =
      '/customize_insured_value_screen';

  static const String selectAddOnsScreen = '/select_add_ons_screen';

  static const String fewMoreDetailsScreen = '/few_more_details_screen';

  static const String chooseADateScreen = '/choose_a_date_screen';

  static const String reviewDetailsScreen = '/review_details_screen';

  static const String paymentMethodScreen = '/payment_method_screen';

  static const String paymentConfirmOneScreen = '/payment_confirm_one_screen';

  static const String paymentConfirmScreen = '/payment_confirm_screen';

  static const String searchFillPage = '/search_fill_page';

  static const String searchScreen = '/search_screen';

  static const String policiesPage = '/policies_page';

  static const String policiesOneScreen = '/policies_one_screen';
  static const String carFormDetailsScreen = '/car_form_details_screen';
  static const String medicalDetailsScreen = '/medical_details_screen';
  static const String travelDetailsScreen = '/travel_details_screen';

  static const String profileScreenPage = '/profile_screen_page';

  static const String myProfileScreen = '/my_profile_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String aboutUsScreen = '/about_us_screen';

  static const String helpScreen = '/help_screen';

  static const String helpDetailScreen = '/help_detail_screen';

  static const String rateUsScreen = '/rate_us_screen';

  static const String feedbackScreen = '/feedback_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';
  static const String homeInsuranceRoute = '/home_insurance';
  static const String carInsuranceRoute = '/car_insurance';
  static const String travelInsuranceRoute = '/travel_insurance';
  static const String medicalInsuranceRoute = '/medical_insurance';

  static const String ticketListScreen = '/ticket_list_screen';
  static const String ticketDetailsScreen = '/ticket_details_screen';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: splashScreenOneScreen,
      page: () => const SplashScreenOneScreen(),
      bindings: [
        SplashScreenOneBinding(),
      ],
    ),
    GetPage(
      name: onboardingOneScreen,
      page: () => const OnboardingOneScreen(),
      bindings: [
        OnboardingOneBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: loginErrorScreen,
      page: () => LoginErrorScreen(),
      bindings: [
        LoginErrorBinding(),
      ],
    ),
    GetPage(
      name: loginActiveScreen,
      page: () => LoginActiveScreen(),
      bindings: [
        LoginActiveBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => const SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: otpVerificationScreen,
      page: () => const OtpVerificationScreen(),
      bindings: [
        OtpVerificationBinding(),
      ],
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
      bindings: [
        ResetPasswordBinding(),
      ],
    ),
    GetPage(
      name: changedPasswordScreen,
      page: () => const ChangedPasswordScreen(),
      bindings: [
        ChangedPasswordBinding(),
      ],
    ),
    GetPage(
      name: homeScreenContainer1Screen,
      page: () => const HomeScreenContainer1Screen(),
      bindings: [
        HomeScreenContainer1Binding(),
      ],
    ),
    GetPage(
      name: familyInsurenceScreen,
      page: () => const FamilyInsurenceScreen(),
      bindings: [
        FamilyInsurenceBinding(),
      ],
    ),
    GetPage(
      name: howInsuranceWorkScreen,
      page: () => const HowInsuranceWorkScreen(),
      bindings: [
        HowInsuranceWorkBinding(),
      ],
    ),
    GetPage(
      name: blogScreen,
      page: () => const BlogScreen(),
      bindings: [
        BlogBinding(),
      ],
    ),
    GetPage(
      name: bikeInsurenceScreen,
      page: () => const BikeInsurenceScreen(),
      bindings: [
        BikeInsurenceBinding(),
      ],
    ),
    GetPage(
      name: bikeInsurenceOneScreen,
      page: () => const BikeInsurenceOneScreen(),
      bindings: [
        BikeInsurenceOneBinding(),
      ],
    ),
    GetPage(
      name: detailsTabContainerScreen,
      page: () => const DetailsTabContainerScreen(),
      bindings: [
        DetailsTabContainerBinding(),
      ],
    ),
    GetPage(
      name: comprehensivePlanScreen,
      page: () => const ComprehensivePlanScreen(),
      bindings: [
        ComprehensivePlanBinding(),
      ],
    ),
    GetPage(
      name: verifyBikeDetailsScreen,
      page: () => const VerifyBikeDetailsScreen(),
      bindings: [
        VerifyBikeDetailsBinding(),
      ],
    ),
    GetPage(
      name: chooseBikeModelScreen,
      page: () => const ChooseBikeModelScreen(),
      bindings: [
        ChooseBikeModelBinding(),
      ],
    ),
    GetPage(
      name: selectYearPopupScreen,
      page: () => SelectYearPopupScreen(),
      bindings: [
        SelectYearPopupBinding(),
      ],
    ),
    GetPage(
      name: currentPolicyStatusScreen,
      page: () => const CurrentPolicyStatusScreen(),
      bindings: [
        CurrentPolicyStatusBinding(),
      ],
    ),
    GetPage(
      name: customizeInsuredValueScreen,
      page: () => const CustomizeInsuredValueScreen(),
      bindings: [
        CustomizeInsuredValueBinding(),
      ],
    ),
    GetPage(
      name: selectAddOnsScreen,
      page: () => const SelectAddOnsScreen(),
      bindings: [
        SelectAddOnsBinding(),
      ],
    ),
    GetPage(
      name: fewMoreDetailsScreen,
      page: () => const FewMoreDetailsScreen(),
      bindings: [
        FewMoreDetailsBinding(),
      ],
    ),
    GetPage(
      name: chooseADateScreen,
      page: () => const ChooseADateScreen(),
      bindings: [
        ChooseADateBinding(),
      ],
    ),
    GetPage(
      name: reviewDetailsScreen,
      page: () => const ReviewDetailsScreen(),
      bindings: [
        ReviewDetailsBinding(),
      ],
    ),
    GetPage(
      name: paymentMethodScreen,
      page: () => PaymentMethodScreen(),
      bindings: [
        PaymentMethodBinding(),
      ],
    ),
    GetPage(
      name: paymentConfirmOneScreen,
      page: () => const PaymentConfirmOneScreen(),
      bindings: [
        PaymentConfirmOneBinding(),
      ],
    ),
    GetPage(
      name: paymentConfirmScreen,
      page: () => const PaymentConfirmScreen(),
      bindings: [
        PaymentConfirmBinding(),
      ],
    ),
    GetPage(
      name: searchScreen,
      page: () => const NotificationScreen(),
      bindings: [
        NotificationBinding(),
      ],
    ),
    GetPage(
      name: policiesOneScreen,
      page: () => const HomeInsuranceScreen(),
      bindings: [
        PoliciesOneBinding(),
      ],
    ),
    GetPage(
      name: carFormDetailsScreen,
      page: () => const CarInsuranceDetailsScreen(),
      bindings: [
        CarInsuranceBinding(),
      ],
    ),
    GetPage(
      name: medicalDetailsScreen,
      page: () => const MedicalInsuranceDetailsScreen(),
      bindings: [
        MedicalInsuranceBinding(),
      ],
    ),
    GetPage(
      name: travelDetailsScreen,
      page: () => const TravelInsuranceDetailsScreen(),
      bindings: [
        TravelInsuranceBinding(),
      ],
    ),
    GetPage(
      name: myProfileScreen,
      page: () => const MyProfileScreen(),
      bindings: [
        MyProfileBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => const EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: aboutUsScreen,
      page: () => const AboutUsScreen(),
      bindings: [
        AboutUsBinding(),
      ],
    ),
    GetPage(
      name: helpScreen,
      page: () => const HelpScreen(),
      bindings: [
        HelpBinding(),
      ],
    ),
    GetPage(
      name: helpDetailScreen,
      page: () => const HelpDetailScreen(),
      bindings: [
        HelpDetailBinding(),
      ],
    ),
    GetPage(
      name: rateUsScreen,
      page: () => const RateUsScreen(),
      bindings: [
        RateUsBinding(),
      ],
    ),
    GetPage(
      name: feedbackScreen,
      page: () => const FeedbackScreen(),
      bindings: [
        FeedbackBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => const AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: homeInsuranceRoute,
      page: () => HomeInsuranceContainerPage(),
      bindings: [
        HomeInsuranceBinding(),
      ],
    ),
    GetPage(
      name: carInsuranceRoute,
      page: () => CarInsuranceContainerPage(),
      bindings: [
        CarInsuranceBinding(),
      ],
    ),
    GetPage(
      name: medicalInsuranceRoute,
      page: () => MedicalInsuranceContainerPage(),
      bindings: [
        MedicalInsuranceBinding(),
      ],
    ),
    GetPage(
      name: travelInsuranceRoute,
      page: () => TravelInsuranceContainerPage(),
      bindings: [
        TravelInsuranceBinding(),
      ],
    ),
    GetPage(
      name: ticketListScreen,
      page: () => TicketListScreen(),
      bindings: [
        TicketListBinding(),
      ],
    ),
    GetPage(
      name: ticketDetailsScreen,
      page: () => TicketDetailsScreen(),
      bindings: [
        TicketDetailsBinding(),
      ],
    )
  ];
}
