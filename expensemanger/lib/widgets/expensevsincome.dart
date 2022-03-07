import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IncomeVsExpense extends StatelessWidget {
  final double expenseTotal;
  final double incomeTotal;
  const IncomeVsExpense(
      {Key? key, required this.expenseTotal, required this.incomeTotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(sectionsSpace: 0, sections: [
      PieChartSectionData(
          showTitle: false, value: expenseTotal, color: Colors.red),
      PieChartSectionData(
          showTitle: false, value: incomeTotal, color: Colors.green),
    ]));
  }
}
