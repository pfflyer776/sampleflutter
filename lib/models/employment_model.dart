import 'dart:convert';
class Employment {
  String employmentType, employer, jobTitle, grossIncome, payFrequency, employerAddress;
  DateTime nextPayday;
  bool isDirectDeposit;
  int years, months;

  Employment({
    required this.employmentType, required this.employer, required this.jobTitle,
    required this.grossIncome, required this.payFrequency,
    required this.nextPayday, required this.isDirectDeposit,
    required this.employerAddress, required this.years, required this.months,
  });

  factory Employment.fromJson(Map<String, dynamic> j) => Employment(
    employmentType: j['employmentType'],
    employer: j['employer'],
    jobTitle: j['jobTitle'],
    grossIncome: j['grossIncome'],
    payFrequency: j['payFrequency'],
    nextPayday: DateTime.parse(j['nextPayday']),
    isDirectDeposit: j['isDirectDeposit'],
    employerAddress: j['employerAddress'],
    years: j['years'], months: j['months'],
  );

  Map<String, dynamic> toJson() => {
    'employmentType': employmentType,
    'employer': employer,
    'jobTitle': jobTitle,
    'grossIncome': grossIncome,
    'payFrequency': payFrequency,
    'nextPayday': nextPayday.toIso8601String(),
    'isDirectDeposit': isDirectDeposit,
    'employerAddress': employerAddress,
    'years': years, 'months': months,
  };
}
