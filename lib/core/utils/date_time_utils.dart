import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../app_export.dart';

const String dateTimeFormatPattern = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format([
    String pattern = dateTimeFormatPattern,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

String calculateDifference(String startDate, String endDate) {
  if (startDate.isNotEmpty && endDate.isNotEmpty) {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);
    int years = end.year - start.year;
    int months = end.month - start.month;
    int days = end.day - start.day;

    // Adjust for negative values in months or days
    if (days < 0) {
      months -= 1;
      days += DateTime(end.year, end.month, 0).day;
    }

    if (months < 0) {
      years -= 1;
      months += 12;
    }

    return '$years Years, $months Months, $days Days';
  } else {
    return "Select Date First";
  }
}

int calculateAge(String dobString) {
  if (dobString.isNotEmpty) {
    // DateTime dob = DateTime.parse(dobString);
    // DateTime today = DateTime.now();
    // // Calculate the difference in years
    // int age = today.year - dob.year;

    // // Check if the user hasn't had their birthday yet this year
    // if (today.month < dob.month ||
    //     (today.month == dob.month && today.day < dob.day)) {
    //   debugPrint("0##### $age ######");
    //   age--;
    // }

    // // If there's any remaining months or days after the last full birthday, increment age by 1
    // if (dob.month != today.month || dob.day > today.day) {
    //   debugPrint("1##### $age ######");
    //   age++;
    // }
    // debugPrint("2##### $age ######");
    DateTime start = DateTime.parse(dobString);
    DateTime end = DateTime.now();
    int years = end.year - start.year;
    int months = end.month - start.month;
    int days = end.day - start.day;

    // Adjust for negative values in months or days
    if (days < 0) {
      months -= 1;
      days += DateTime(end.year, end.month, 0).day;
    }

    if (months < 0) {
      years -= 1;
      months += 12;
    }
    return years;
  } else {
    return 0;
  }
}

int daysBetween(String startDate, String endDate) {
  if (startDate.isNotEmpty && endDate.isNotEmpty) {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);
    return end.difference(start).inDays;
  } else {
    return 0;
  }
}

double reverseFormatAmount(String formattedAmount) {
  debugPrint(" ## reverseFormatAmount 1 = $formattedAmount");
  String numericString = formattedAmount.replaceAll(RegExp(r'[^0-9.]'), '');
  debugPrint(" ## reverseFormatAmount 2 = $numericString");
  return double.tryParse(numericString) ?? 0.0;
}
