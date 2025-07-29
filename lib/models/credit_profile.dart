class CreditProfile {
  final int currentScore;
  final String currentScoreLabel;
  final int currentScoreChange;
  final String lastUpdated;
  final String creditService;
  final List<MonthlyCreditScore> scoreHistory;
  final List<CreditFactor> creditFactors;
  final CreditDetails details;
  final double totalBalance;
  final double totalLimit;
  final int utilizationPercent;
  final String utilizationLabel;
  final List<CreditCardAccount> openCreditCards;

  CreditProfile({
    required this.currentScore,
    required this.currentScoreLabel,
    required this.currentScoreChange,
    required this.lastUpdated,
    required this.creditService,
    required this.scoreHistory,
    required this.creditFactors,
    required this.details,
    required this.totalBalance,
    required this.totalLimit,
    required this.utilizationPercent,
    required this.utilizationLabel,
    required this.openCreditCards,
  });

  factory CreditProfile.fromJson(Map<String, dynamic> json) {
    return CreditProfile(
      currentScore: json['currentScore'],
      currentScoreLabel: json['currentScoreLabel'],
      currentScoreChange: json['currentScoreChange'],
      lastUpdated: json['lastUpdated'],
      creditService: json['creditService'],
      scoreHistory: (json['scoreHistory'] as List)
          .map((e) => MonthlyCreditScore.fromJson(e))
          .toList(),
      creditFactors: (json['creditFactors'] as List)
          .map((e) => CreditFactor.fromJson(e))
          .toList(),
      details: CreditDetails.fromJson(json['details']),
      totalBalance: json['totalBalance'].toDouble(),
      totalLimit: json['totalLimit'].toDouble(),
      utilizationPercent: json['utilizationPercent'].toInt(),
      utilizationLabel: json['utilizationLabel'],
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
  final int value;
  final String status;

  CreditFactor({required this.title, required this.value, required this.status});

  factory CreditFactor.fromJson(Map<String, dynamic> json) {
    return CreditFactor(
      title: json['title'],
      value: json['value'],
      status: json['status'],
    );
  }
}

class CreditDetails {
  final double balance;
  final double creditLimit;
  final double remainingAmount;
  final double spendLimit;

  CreditDetails({required this.balance, required this.creditLimit, required this.remainingAmount, required this.spendLimit});

  factory CreditDetails.fromJson(Map<String, dynamic> json) {
    return CreditDetails(
      balance: json['balance'].toDouble(),
      creditLimit: json['creditLimit'].toDouble(),
      remainingAmount: json['remainingAmount'].toDouble(),
      spendLimit: json['spendLimit'].toDouble(),
    );
  }
}

class CreditCardAccount {
  final String name;
  final double balance;
  final double limit;
  final String lastReport;

  CreditCardAccount({
    required this.name,
    required this.balance,
    required this.limit,
    required this.lastReport,
  });

  factory CreditCardAccount.fromJson(Map<String, dynamic> json) {
    return CreditCardAccount(
      name: json['name'],
      balance: json['balance'].toDouble(),
      limit: json['limit'].toDouble(),
      lastReport: json['lastReport'],
    );
  }
}
