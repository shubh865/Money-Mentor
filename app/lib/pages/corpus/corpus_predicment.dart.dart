import 'package:bob_hacks/core/theme/palette.dart';
import 'package:bob_hacks/pages/corpus/health_expenses.dart';
import 'package:bob_hacks/pages/corpus/recurring_expense.dart';
import 'package:bob_hacks/utils/ui_utils/text/text_style.dart';
import 'package:flutter/material.dart';

class Drop extends StatelessWidget {
  final Map<String, Map<String, String>> recurringExpensesData = {
    'Grocery': {
      'current_expense': '\$500',
      'current_inflation': '2%',
      'at_age_61': '\$2000',
      'at_age_91': '\$4000',
      'total': '\$6500',
    },
    'Electricity Bill': {
      'current_expense': '\$300',
      'current_inflation': '1.5%',
      'at_age_61': '\$1500',
      'at_age_91': '\$3500',
      'total': '\$5300',
    },
    'Gas Bill': {
      'current_expense': '\$400',
      'current_inflation': '1.8%',
      'at_age_61': '\$1800',
      'at_age_91': '\$3800',
      'total': '\$6000',
    },
    'House Maintenance': {
      'current_expense': '\$400',
      'current_inflation': '1.8%',
      'at_age_61': '\$1800',
      'at_age_91': '\$3800',
      'total': '\$6000',
    },
  };

  final Map<String, Map<String, String>> healthExpensesData = {
    'Diabetes': {
      'surgery_name': '\$100',
      'cost': '1%',
      'inflation_rate': '\$500',
      'inflation': '\$1000',
    },
    'Heart Disease': {
      'surgery_name': '\$100',
      'cost': '1%',
      'inflation_rate': '\$500',
      'inflation': '\$1000',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Palette.white,
        ),
        title: Text(
          'Expense Tracker',
          style: title(color: Palette.white),
        ),
        backgroundColor: Palette.black,
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
                    'Total Corpus Required: 1000000',
                    style: title1(color: Palette.black),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListView(
                children: [
                  RecurringExpenses(
                    title: 'Recurring Expenses',
                    subItems: [
                      'Grocery',
                      'Electricity Bill',
                      'Gas Bill',
                      'House Maintenance'
                    ],
                    subItemData: recurringExpensesData,
                  ),
                  HealthExpenses(
                    title: 'Health Expenses',
                    subItems: ['Diabetes', 'Heart Disease'],
                    subItemData: healthExpensesData,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
