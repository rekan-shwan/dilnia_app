import 'package:insurance_app/added/snack_bar_widget.dart';
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
import '../models/medical_insurance_form_details_model.dart';

class MedicalInsuranceDetailsController extends GetxController {
  TextEditingController emailController = TextEditingController();

  Rx<MedicalFormDetailsModel> detailsObj = MedicalFormDetailsModel().obs;
  dynamic theDataFromPreviousPage = Get.arguments;
  List<String> planList = ['My Health', 'My Health +', 'My Health ++'];
  var isLoading = false.obs;
  // Local storage
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    insuranceDetails();
  }

  Future<void> insuranceDetails() async {
    debugPrint("*************** MedicalInsurance  ***********");
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
              '$baseUrl/medical-insurance-form/${theDataFromPreviousPage.id}'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        debugPrint("Ticket str = $str");
        MedicalFormDetailsModel listModel =
            MedicalFormDetailsModel.fromJson(str);
        detailsObj.value = listModel;
        update();
        isLoading.value = false;
        debugPrint("Details Data == ${listModel.toString()}");
        // Get.snackbar(
        //   'Success',
        //   'Get Medical Insurance Details Successfully',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(
            Get.context!, 'Medical Insurance Details Loaded Successfully');
      } else {
        // Get.snackbar(
        //   'Error',
        //   'Failed to get Medical Insurance Details. Please try again later.',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(Get.context!,
            'Failed to get Medical Insurance Details. Please try again later.');
      }
    } catch (e) {
      // Get.snackbar(
      //   'Error',
      //   'Something went wrong: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
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
              child: pw.Text('Medical Insurance Details',
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
          // Insurance Details
          pw.Text('Insurance Details',
              style:
                  pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Bullet(
              text: 'Plan Type: ${detailsObj.value.data?.planType ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Coverage Area: ${detailsObj.value.data?.coverageArea ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Start Date: ${detailsObj.value.data?.start != null ? dateFormat.format(detailsObj.value.data!.start!) : 'N/A'}'),
          pw.Bullet(
              text:
                  'End Date: ${detailsObj.value.data?.end != null ? dateFormat.format(detailsObj.value.data!.end!) : 'N/A'}'),
          pw.Bullet(
              text:
                  'Premium: ${formatCurrency(detailsObj.value.data?.premium)}'),
          pw.Bullet(
              text:
                  'Total Premium: ${formatCurrency(detailsObj.value.data?.totalPremium)}'),
          pw.Bullet(
              text:
                  'Description: ${detailsObj.value.data?.description ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Discount Code: ${detailsObj.value.data?.discountCode ?? 'N/A'}'),
          pw.Bullet(text: 'Note: ${detailsObj.value.data?.note ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Comment: ${detailsObj.value.data?.comment?.toString() ?? 'N/A'}'),
          pw.Bullet(
              text:
                  'Created By: ${detailsObj.value.data?.createdBy?.toString() ?? 'N/A'}'),
          pw.SizedBox(height: 20),
          detailsObj.value.data!.family!.isNotEmpty
              ?

              // Family Members Table
              pw.Text('Family Members',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold))
              : pw.SizedBox(height: 0),
          pw.SizedBox(height: 10),
          pw.Table(
            border: pw.TableBorder.all(),
            children: [
              // Header row
              pw.TableRow(
                children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Name',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Relation',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Date of Birth',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Gender',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Premium',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
                ],
              ),
              // Data rows
              ...(detailsObj.value.data?.family ?? [])
                  .map((family) => pw.TableRow(
                        children: [
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Text(family.name ?? 'N/A')),
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Text(family.relation ?? 'N/A')),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text(family.dob != null
                                ? dateFormat.format(family.dob!)
                                : 'N/A'),
                          ),
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Text(family.gender ?? 'N/A')),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text(formatCurrency(family.premium)),
                          ),
                        ],
                      )),
            ],
          ),
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
                              child: pw.Text(
                                  payment.isPaid == true ? 'Yes' : 'No')),
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
    final file = File('${directory.path}/medical_insurance_details.pdf');
    await file.writeAsBytes(await pdf.save());

    // Open the file (triggers download or view depending on the platform)
    await OpenFile.open(file.path);

    // Show a snackbar to confirm
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF generated and saved to ${file.path}')),
    );
  }
}
