import 'dart:convert';
import 'package:http/http.dart' as http;
import 'aqsati_model.dart';

class AqsatiService {
  static const String _baseUrl = 'https://api-uat.aqsati.iq';
  static const String _apiPath =
      '/Aqsati/ThirdParty/api/Integration/GetCustomerInformation';

  static const String _merchantKey =
      'Merchant 13YKUStsRiSJqEZ9/Xh1/t8ewQ8R2EUJYiY4vQ/eCKLgCBmFkR4EnCusUwGKRKYZ';

  static Future<AqsatiCustomerInfo?> fetchCustomerInfo({
    required String identity,
    int typeOfCustomer = 1,
  }) async {
    final url = Uri.parse('$_baseUrl$_apiPath');

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': _merchantKey,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'Identity': "6330153657143355",
          'TypeOfCustomer': 1,
        }),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return AqsatiCustomerInfo.fromJson(json);
      } else {
        print('API error: ${response.statusCode} => ${response.body}');
      }
    } catch (e) {
      print('Exception during API call: $e');
    }

    return null;
  }
}
