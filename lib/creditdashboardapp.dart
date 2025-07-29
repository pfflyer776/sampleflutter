import 'package:avatest/providers/credit_providers.dart';
import 'package:avatest/views/credit/accountdetails/accountdetails.dart';
import 'package:avatest/views/credit/creditchartcard/creditchartcard.dart';
import 'package:avatest/views/credit/creditfactors/creditfactors.dart';
import 'package:avatest/views/credit/creditscorecard/creditscorecard.dart';
import 'package:avatest/views/credit/totalbalance/totalbalance.dart';
import 'package:avatest/views/credit/opencreditcard/opencreditcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:avatest/app_router.dart';

class CreditDashboardApp extends StatelessWidget {
  const CreditDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().config(),
    );
  }
}

@RoutePage()
class CreditDashboardPage extends ConsumerWidget {
  final Color primaryColor = Color(0xFF4B0082); // Deep purple
  final Color backgroundColor = Color(0xFFFAF8F6);

  double getScore(int currentScore) {
    double percent = (currentScore/850);
    return percent;
  }

  double getCreditPercent(double currentAmount, double limit) {
    double percent = (currentAmount/limit);
    return percent;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(creditProfileProvider);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Home", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              // Handle gear icon press
              context.router.push(EmploymentFormRoute());
            },
          ),
      ),
      body: profileAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (profile) => RefreshIndicator(
          onRefresh: () async => ref.refresh(creditProfileProvider.notifier).refresh(),
          child: Column(
            children: [
              Expanded(
                 child:
                 SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CreditScoreCard(currentScore: profile.currentScore, currentScoreLabel: profile.currentScoreLabel, currentScoreChange: profile.currentScoreChange, lastUpdated: profile.lastUpdated, creditService: profile.creditService, percent: getScore(profile.currentScore) ),
                      CreditChartCard(currentScoreChange: profile.currentScoreChange, lastUpdated: profile.lastUpdated, creditService: profile.creditService, scoreHistory: profile.scoreHistory),
                      SizedBox(height: 20),
                      CreditFactors(creditFactors: profile.creditFactors),
                      SizedBox(height: 20),
                      Accountdetails(details: profile.details, percent: getCreditPercent(profile.totalBalance, profile.totalLimit)),
                      SizedBox(height: 20),
                      TotalBalance(totalBalance: profile.totalBalance, totalLimit: profile.totalLimit, utilizationPercent: profile.utilizationPercent, utilizationLabel: profile.utilizationLabel, percent: getCreditPercent(profile.totalBalance, profile.totalLimit)),
                      SizedBox(height: 20),
                      OpenCreditCard(openCreditCards: profile.openCreditCards),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
