import 'package:flutter/material.dart';
import 'analytics.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: AnalyticScreen(),
    );
  }
}
