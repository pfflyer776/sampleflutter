import 'package:banktest/providers/credit_providers.dart';
import 'package:banktest/views/credit/accountdetails/accountdetails.dart';
import 'package:banktest/views/credit/creditchartcard/creditchartcard.dart';
import 'package:banktest/views/credit/creditfactors/creditfactors.dart';
import 'package:banktest/views/credit/creditscorecard/creditscorecard.dart';
import 'package:banktest/views/credit/totalbalance/totalbalance.dart';
import 'package:banktest/views/credit/opencreditcard/opencreditcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:banktest/app_router.dart';

class CreditDashboardApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().config(),
    );
  }
}

// this route is a work around since auto router doesn't let you pass a value for initial widget
@RoutePage()
class MyNavigatorPage extends StatefulWidget {

  @override
  _MyNavigatorWidgetState createState() => _MyNavigatorWidgetState();
}

class _MyNavigatorWidgetState extends State<MyNavigatorPage> {
  @override
  void initState() {
    super.initState();
    // Use WidgetsBinding to navigate after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Push to the CreditDashboardRoute only after the widget is rendered
      context.router.push(CreditDashboardRoute(shouldShowDialog: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

@RoutePage()
class CreditDashboardPage extends ConsumerWidget {
  final Color primaryColor = Color(0xFF4B0082); // Deep purple
  final Color backgroundColor = Color(0xFFFAF8F6);
  final bool shouldShowDialog;

  CreditDashboardPage({required this.shouldShowDialog});

  double getScore(int currentScore) {
    double percent = (currentScore/850);
    return percent;
  }

  double getCreditPercent(double currentAmount, double limit) {
    double percent = (currentAmount/limit);
    return percent;
  }

  void showScreenDialog(BuildContext context) {
    TextEditingController feedbackController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: const Text(
                    'Give us feedback',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: feedbackController,
                  decoration: InputDecoration(
                    hintText: 'Write your feedback here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  maxLines: 4,
                  minLines: 4,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle feedback submission here
                    final feedback = feedbackController.text;
                    //print('Feedback: $feedback');
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: const Size(double.infinity, 45),
                  ),
                  child: const Text(
                    'Send feedback',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (shouldShowDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showScreenDialog(context);
      });
    }
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
