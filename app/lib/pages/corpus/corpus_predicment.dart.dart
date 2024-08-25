import 'package:bob_hacks/core/theme/palette.dart';
import 'package:bob_hacks/pages/corpus/health_expenses.dart';
import 'package:bob_hacks/pages/corpus/recurring_expense.dart';
import 'package:bob_hacks/utils/ui_utils/text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:bob_hacks/models/predict_corpus_response.dart';

class Drop extends StatelessWidget {
  final ResponseData responseData;

  Drop({required this.responseData});

  @override
  Widget build(BuildContext context) {
    final recurringExpensesData = {
      for (var expense in responseData.data.futureExpenses)
        expense.name: {
          'current_expense': '\$${expense.currentExpense}',
          'current_inflation': '${expense.inflationRate}%',
          'at_age_61': '\$${expense.futureExpenseStart}',
          'at_age_91': '\$${expense.futureExpenseEnd}',
          'total': '\$${expense.categoryTotal}',
        },
    };

    final healthExpensesData = {
      for (var disease in responseData.data.futureDiseases)
        disease.diseaseName: {
          'surgery_name': disease.surgeryName,
          'cost': '\$${disease.cost}',
          'inflation_rate': '${disease.healthInflationRate}%',
          'inflation_considered_cost': '\$${disease.inflationConsideredCost}',
        },
    };

   return Scaffold(
  appBar: AppBar(
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon:Icon(Icons.arrow_back),
      color: Palette.black,
    ),
    title: Text(
      'Expense Tracker',
      style: title(color: Palette.black),
    ),
    backgroundColor: Palette.white,
  ),
  body: Column(
    children: [
      Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Palette.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.account_balance_wallet,
              color: Palette.black,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Total Corpus Required: \$${responseData.data.finalCorpus}',
                style: title1(color: Palette.black),
              ),
            ),
          ],
        ),
      ),
      Expanded( // Wrap the ListView with Expanded
        child: ListView(
          children: [
            RecurringExpenses(
              title: 'Recurring Expenses',
              subItems: responseData.data.futureExpenses
                  .map((e) => e.name)
                  .toList(),
              subItemData: recurringExpensesData,
            ),
            HealthExpenses(
              title: 'Health Expenses',
              subItems: responseData.data.futureDiseases
                  .map((d) => d.diseaseName)
                  .toList(),
              subItemData: healthExpensesData,
            ),
          ],
        ),
      ),
    ],
  ),
);

  }
}
