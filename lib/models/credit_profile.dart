class CreditProfile {
  final int currentScore;
  final List<MonthlyCreditScore> scoreHistory;
  final List<CreditFactor> creditFactors;
  final CreditDetails details;
  final double totalBalance;
  final List<CreditCardAccount> openCreditCards;

  CreditProfile({
    required this.currentScore,
    required this.scoreHistory,
    required this.creditFactors,
    required this.details,
    required this.totalBalance,
    required this.openCreditCards,
  });

  factory CreditProfile.fromJson(Map<String, dynamic> json) {
    return CreditProfile(
      currentScore: json['currentScore'],
      scoreHistory: (json['scoreHistory'] as List)
          .map((e) => MonthlyCreditScore.fromJson(e))
          .toList(),
      creditFactors: (json['creditFactors'] as List)
          .map((e) => CreditFactor.fromJson(e))
          .toList(),
      details: CreditDetails.fromJson(json['details']),
      totalBalance: json['totalBalance'].toDouble(),
      openCreditCards: (json['openCreditCards'] as List)
          .map((e) => CreditCardAccount.fromJson(e))
          .toList(),
    );
  }
}

class MonthlyCreditScore {
  final int score;
  final String month;

  MonthlyCreditScore({required this.score, required this.month});

  factory MonthlyCreditScore.fromJson(Map<String, dynamic> json) {
    return MonthlyCreditScore(
      score: json['score'],
      month: json['month'],
    );
  }
}

class CreditFactor {
  final String title;
  final String status;

  CreditFactor({required this.title, required this.status});

  factory CreditFactor.fromJson(Map<String, dynamic> json) {
    return CreditFactor(
      title: json['title'],
      status: json['status'],
    );
  }
}

class CreditDetails {
  final String reportDate;
  final int openAccounts;

  CreditDetails({required this.reportDate, required this.openAccounts});

  factory CreditDetails.fromJson(Map<String, dynamic> json) {
    return CreditDetails(
      reportDate: json['reportDate'],
      openAccounts: json['openAccounts'],
    );
  }
}

class CreditCardAccount {
  final String name;
  final double balance;
  final double limit;

  CreditCardAccount({
    required this.name,
    required this.balance,
    required this.limit,
  });

  factory CreditCardAccount.fromJson(Map<String, dynamic> json) {
    return CreditCardAccount(
      name: json['name'],
      balance: json['balance'].toDouble(),
      limit: json['limit'].toDouble(),
    );
  }
}
