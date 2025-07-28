import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/employment_model.dart';

class EmploymentService {
  Future<EmploymentData> loadFromJson() async {
    final json = jsonDecode(await rootBundle.loadString('assets/employment.json'));
    return EmploymentData(
      employmentType: json['employmentType'],
      employer: json['employer'],
      jobTitle: json['jobTitle'],
      income: json['income'],
      payFrequency: json['payFrequency'],
      nextPayday: DateTime.parse(json['nextPayday']),
      isDirectDeposit: json['isDirectDeposit'],
      employerAddress: json['employerAddress'],
      yearsWithEmployer: json['yearsWithEmployer'],
      monthsWithEmployer: json['monthsWithEmployer'],
    );
  }
}
