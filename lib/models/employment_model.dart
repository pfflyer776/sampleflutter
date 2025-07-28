class EmploymentData {
  final String employmentType;
  final String employer;
  final String jobTitle;
  final String income;
  final String payFrequency;
  final DateTime nextPayday;
  final bool isDirectDeposit;
  final String employerAddress;
  final int yearsWithEmployer;
  final int monthsWithEmployer;

  EmploymentData({
    required this.employmentType,
    required this.employer,
    required this.jobTitle,
    required this.income,
    required this.payFrequency,
    required this.nextPayday,
    required this.isDirectDeposit,
    required this.employerAddress,
    required this.yearsWithEmployer,
    required this.monthsWithEmployer,
  });

}
