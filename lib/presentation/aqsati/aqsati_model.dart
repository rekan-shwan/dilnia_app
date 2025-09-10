class AqsatiCustomerInfo {
  final bool succeeded;
  final String? fullName;
  final String? motherName;
  final String? jobTitle;
  final String? phoneNumber;
  final String? birthDate;
  final double? allowableSalary;
  final int? maxCountOfMonth;
  final String? sessionId;
  final List<AqsatiPreviousSubscription> previousSubscriptions;

  AqsatiCustomerInfo({
    required this.succeeded,
    this.fullName,
    this.motherName,
    this.jobTitle,
    this.phoneNumber,
    this.birthDate,
    this.allowableSalary,
    this.maxCountOfMonth,
    this.sessionId,
    this.previousSubscriptions = const [],
  });

  factory AqsatiCustomerInfo.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    final customer = data['customerInformation'] ?? {};
    final payment = data['paymentInformation'] ?? {};
    final salary = payment['salaryInformation'] ?? {};
    final session = data['session'] ?? {};
    final subs =
        List<Map<String, dynamic>>.from(data['previousSubscriptions'] ?? []);

    return AqsatiCustomerInfo(
      succeeded: json['succeeded'] ?? false,
      fullName: customer['fullName'],
      motherName: customer['motherFullName'],
      jobTitle: customer['jobTitle'],
      phoneNumber: customer['phoneNumber'],
      birthDate: customer['birthDate'],
      allowableSalary: (salary['allowableSalary'] ?? 0).toDouble(),
      maxCountOfMonth: salary['maxCountOfMonth'] ?? 0,
      sessionId: session['sessionId'],
      previousSubscriptions:
          subs.map((e) => AqsatiPreviousSubscription.fromJson(e)).toList(),
    );
  }
}

class AqsatiPreviousSubscription {
  final int installmentId;
  final String merchantName;
  final double amount;
  final double paidAmount;
  final double unPaidAmount;
  final int countOfMonth;
  final int paidCountOfMonth;

  AqsatiPreviousSubscription({
    required this.installmentId,
    required this.merchantName,
    required this.amount,
    required this.paidAmount,
    required this.unPaidAmount,
    required this.countOfMonth,
    required this.paidCountOfMonth,
  });

  factory AqsatiPreviousSubscription.fromJson(Map<String, dynamic> json) {
    return AqsatiPreviousSubscription(
      installmentId: json['installmentId'] ?? 0,
      merchantName: json['merchantName'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      paidAmount: (json['paidAmount'] ?? 0).toDouble(),
      unPaidAmount: (json['unPaidAmount'] ?? 0).toDouble(),
      countOfMonth: json['countOfMonth'] ?? 0,
      paidCountOfMonth: json['paidCountOfMonth'] ?? 0,
    );
  }
}
