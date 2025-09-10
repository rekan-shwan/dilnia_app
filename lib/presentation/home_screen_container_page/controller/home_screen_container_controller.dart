import 'package:get_storage/get_storage.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/home_screen_container_page/models/home_screen_container_model.dart';

import '../../blog_screen/models/blog_item_model.dart';
import '../../blog_screen/models/blog_model.dart';
import '../../family_insurence_screen/models/family_insurence_model.dart';
import '../../family_insurence_screen/models/family_item_model.dart';
import '../../how_insurance_work_screen/models/how_insurance_item_model.dart';
import '../../how_insurance_work_screen/models/how_insurance_work_model.dart';
import '../models/slidervector_item_model.dart';
import 'package:http/http.dart' as http;

import '../models/banner_list_model.dart';

/// A controller class for the HomeScreenContainerPage.
///
/// This class manages the state of the HomeScreenContainerPage, including the
/// current homeScreenContainerModelObj
class HomeScreenContainerController extends GetxController {
  Rx<int> silderIndex = 0.obs;

  List<SlidervectorItemModel> sliderData =
      HomeScreenContainerModel.getSliderData();
  List<FamilyItemModel> familyInsurenceModelObj =
      FamilyInsurenceModel.getInsuranceService();
  List<HowInsuranceItemModel> howInsuranceWork =
      HowInsuranceWorkModel.howInsuranceItemList();
  List<BlogItemModel> blogData = BlogModel.blogItemList();

  var token = ''.obs; // Observable variable to hold the token
  var userName = ''.obs;

  RxList<BannerData> bannerData = <BannerData>[].obs;
  var isLoading = false.obs;
  // Local storage
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    loadUserData();
    bannerList();
    // Load data when the controller is initialized
  }

  void loadUserData() {
    // Read data from GetStorage
    token.value =
        storage.read('token') ?? ''; // Get token or default to an empty string
    userName.value = storage.read('user') ?? 'Guest';
// Get userName or default to 'Guest'
  }

  bool isLoggedIn() {
    // Check if a token exists to verify login status
    return token.value.isNotEmpty;
  }

  Future<void> bannerList() async {
    debugPrint("*************** bannerList  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    debugPrint("*************** token == $acceptToken  ***********");
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request('GET', Uri.parse('$baseUrl/banner'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        debugPrint("Banner str = $str");
        BannerListModel bannerListModel = BannerListModel.fromJson(str);
        bannerData.assignAll(bannerListModel.data ?? []);
        // Get.snackbar(
        //   'Success',
        //   'Get Banner Successful',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      } else {
        Get.snackbar(
          'Error',
          'Failed to get Banner. Please try again later.',
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
}
