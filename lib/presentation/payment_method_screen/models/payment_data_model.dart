import '../../../core/app_export.dart';

class PaymentDataModel {
  final int? userpaymentId;
  final String? invoiceId;
  final String? amount;
  final String? firstName;
  final String? lastName;
  final String? company;
  final String? currency;
  final String? successUrl;
  final String? errorUrl;
  final String? cancelUrl;
  final String? callbackUrl;
  PaymentDataModel({
    this.userpaymentId,
    this.invoiceId,
    this.amount,
    this.firstName,
    this.lastName,
    this.currency = curencyName,
    this.company,
    this.successUrl = successUrlV,
    this.errorUrl = errorUrlV,
    this.cancelUrl = cancelUrlV,
    this.callbackUrl = callbackUrlV,
  });
}
