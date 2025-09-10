import 'package:insurance_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import '../../../core/utils/validation_functions.dart';
import '../models/home_insurance_form_details_model.dart';

class HomeInsuranceDetailsController extends GetxController {
  TextEditingController emailController = TextEditingController();

  Rx<HomeInsuranceFromDetailsModel> detailsObj =
      HomeInsuranceFromDetailsModel().obs;
  dynamic theDataFromPreviousPage = Get.arguments;

  var isLoading = false.obs;
  // Local storage
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    homeInsuranceDetails();
  }

  Future<void> homeInsuranceDetails() async {
    debugPrint("*************** homeInsurance  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request(
          'GET',
          Uri.parse(
              '$baseUrl/home-insurance-form/${theDataFromPreviousPage.id}'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        debugPrint("Ticket str = $str");
        HomeInsuranceFromDetailsModel listModel =
            HomeInsuranceFromDetailsModel.fromJson(str);
        detailsObj.value = listModel;
        update();
        isLoading.value = false;
        debugPrint("Details Data == ${listModel.toString()}");
        Get.snackbar(
          'Success',
          'Get Home Insurance Details Successful',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to get Home Insurance Details. Please try again later.',
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

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }

  // Function to generate and download PDF
  Future<void> generateAndDownloadPdf(BuildContext context) async {
    final pdf = pw.Document();
    final dateFormat = DateFormat('yyyy-MM-dd');

    // Fetch the logo image from the network
    final http.Response response = await http
        .get(Uri.parse('https://api.dilnia.com/upload/logo/logo_large.png'));
    final pw.MemoryImage logoImage = pw.MemoryImage(response.bodyBytes);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => [
          // Logo at the top
          pw.Center(
            child: pw.Image(
              logoImage,
              width: 150,
              height: 50,
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Header(
              level: 0,
              child: pw.Text('Home Insurance Details',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold))),
          pw.SizedBox(height: 20),
          // Personal Information
          pw.Text('Personal Information',
              style:
                  pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Bullet(text: 'Name: ${detailsObj.value.data?.name ?? 'N/A'}'),
          pw.Bullet(text: 'Email: ${detailsObj.value.data?.email ?? 'N/A'}'),
          pw.Bullet(text: 'Phone: ${detailsObj.value.data?.phone ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Date of Birth: ${detailsObj.value.data?.dob != null ? dateFormat.format(detailsObj.value.data!.dob!) : 'N/A'}'),
          pw.Bullet(text: 'Gender: ${detailsObj.value.data?.gender ?? 'N/A'}'),
          pw.SizedBox(height: 20),
          // Property Information
          pw.Text('Property Information',
              style:
                  pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Bullet(
              text:
                  'Province: ${detailsObj.value.data?.province?.toString() ?? 'N/A'}'),
          pw.Bullet(
              text: 'Home Type: ${detailsObj.value.data?.homeType ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Property Type: ${detailsObj.value.data?.propertyType ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'House Number: ${detailsObj.value.data?.propertyHouse ?? 'N/A'}'),
          pw.Bullet(
              text: 'Block: ${detailsObj.value.data?.propertyBlock ?? 'N/A'}'),
          pw.Bullet(
              text: 'Alley: ${detailsObj.value.data?.propertyAlley ?? 'N/A'}'),
          pw.Bullet(
              text: 'Area: ${detailsObj.value.data?.propertyArea ?? 'N/A'}'),
          pw.Bullet(
              text: 'Floor: ${detailsObj.value.data?.propertyFloor ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Apartment: ${detailsObj.value.data?.propertyApartment?.toString() ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Project: ${detailsObj.value.data?.propertyProject?.toString() ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Street: ${detailsObj.value.data?.propertyStreet ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Address: ${detailsObj.value.data?.propertyAddress ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Construction Value: ${formatCurrency(detailsObj.value.data?.constructionValue)}'),
          pw.Bullet(
              text:
                  'Content Value: ${formatCurrency(detailsObj.value.data?.contentValue)}'),
          pw.SizedBox(height: 20),
          // Insurance Details
          pw.Text('Insurance Details',
              style:
                  pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Bullet(
              text:
                  'Liability Coverage: ${detailsObj.value.data?.liabilityCoverage == 1 ? 'Yes' : 'No'}'),
          pw.Bullet(
              text:
                  'Content Coverage: ${detailsObj.value.data?.contentCoverage == 1 ? 'Yes' : 'No'}'),
          pw.Bullet(
              text:
                  'Personal Liability Coverage: ${detailsObj.value.data?.personalLiabilityCoverage == 1 ? 'Yes' : 'No'}'),
          pw.Bullet(
              text:
                  'Fire/Theft Liability Coverage: ${detailsObj.value.data?.fireTheftLiabilityCoverage == 1 ? 'Yes' : 'No'}'),
          pw.Bullet(
              text:
                  'Start Date: ${detailsObj.value.data?.start != null ? dateFormat.format(detailsObj.value.data!.start!) : 'N/A'}'),
          pw.Bullet(
              text:
                  'End Date: ${detailsObj.value.data?.end != null ? dateFormat.format(detailsObj.value.data!.end!) : 'N/A'}'),
          pw.Bullet(
              text:
                  'Rate: ${detailsObj.value.data?.rate?.toStringAsFixed(2) ?? 'N/A'}%'),
          pw.Bullet(
              text:
                  'Minimum Premium: ${formatCurrency(detailsObj.value.data?.minimumPremium)}'),
          pw.Bullet(
              text:
                  'Total Premium: ${formatCurrency(detailsObj.value.data?.totalPremium)}'),
          pw.Bullet(
              text:
                  'Description: ${detailsObj.value.data?.description ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Discount Code: ${detailsObj.value.data?.discountCode ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Discount Amount: ${formatCurrency(detailsObj.value.data?.discountAmount)}'),
          pw.Bullet(
              text:
                  'Installment: ${detailsObj.value.data?.isInstallment == 1 ? 'Yes' : 'No'}'),
          pw.Bullet(
              text:
                  'Installment Months: ${detailsObj.value.data?.installmentMonth?.toString() ?? 'N/A'}'),
          pw.Bullet(text: 'Note: ${detailsObj.value.data?.note ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Comment: ${detailsObj.value.data?.comment?.toString() ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Created At: ${detailsObj.value.data?.createdAt != null ? dateFormat.format(detailsObj.value.data!.createdAt!) : 'N/A'}'),

          pw.SizedBox(height: 20),
          // User Payments Table
          pw.Text('User Payments',
              style:
                  pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Table(
            border: pw.TableBorder.all(),
            children: [
              // Header row
              pw.TableRow(
                children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Invoice',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Amount',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Paid',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Payment Date',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Expire Date',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                ],
              ),
              // Data rows
              ...(detailsObj.value.data?.userPayment ?? [])
                  .map((payment) => pw.TableRow(
                        children: [
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Text(payment.invoice ?? 'N/A')),
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Text(formatCurrency(payment.amount))),
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(8),
                              child:
                                  pw.Text(payment.isPaid == 1 ? 'Yes' : 'No')),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text(
                              payment.paymentDate is DateTime
                                  ? dateFormat
                                      .format(payment.paymentDate as DateTime)
                                  : 'N/A',
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text(payment.expireDate != null
                                ? dateFormat.format(payment.expireDate!)
                                : 'N/A'),
                          ),
                        ],
                      )),
            ],
          ),
        ],
      ),
    );

    // Save the PDF to a temporary directory
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/home_insurance_details.pdf');
    await file.writeAsBytes(await pdf.save());

    // Open the file (triggers download or view depending on the platform)
    await OpenFile.open(file.path);

    // Show a snackbar to confirm
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF generated and saved to ${file.path}')),
    );
  }
}
