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
                 child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                          child: Container(
                            color: primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                              child: CreditScoreCard(currentScore: profile.currentScore, currentScoreLabel: "Good", currentScoreChange: 2, lastUpdated: "Updated Today | Next May 12", creditService: "Experian"),
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,16,0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8,32,0,0),
                            child: Text(
                              "Chart",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2A1E39),
                                ),
                              ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                          padding: EdgeInsets.fromLTRB(16,0,16,0),
                          child: CreditChartCard(currentScoreChange: 2, lastUpdated: "Updated Today | Next May 12", creditService: "Experian", scoreHistory: profile.scoreHistory)
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,16,0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8,32,0,0),
                          child: Text(
                            "Credit factors",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2A1E39),
                            ),
                          ),
                        ),
                      ),
                      CreditFactors(),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,16,0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8,32,0,0),
                          child: Text(
                            "Account details",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2A1E39),
                            ),
                          ),
                        ),
                      ),
                      Accountdetails(),
                      SizedBox(height: 20),
                      TotalBalance(totalBalance: profile.totalBalance, totalLimit: 200900, utilizationPercent: 4, utilizationLabel: "Excellent"),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,16,0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8,32,0,0),
                          child: Text(
                            "Open credit card accounts",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2A1E39),
                            ),
                          ),
                        ),
                      ),
                      OpenCreditCard(),
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
