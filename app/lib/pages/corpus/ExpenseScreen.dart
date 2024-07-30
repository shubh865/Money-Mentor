import 'package:bob_hacks/Models/Indicator.dart';
import 'package:bob_hacks/Models/PiechartData.dart';
import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:bob_hacks/core/theme/palette.dart';
import 'package:bob_hacks/pages/corpus/health_detail.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../models/recurring_expense.dart';
import '../../utils/ui_utils/text/text_style.dart';

class ExpenseTracker extends StatefulWidget {
  @override
  _ExpenseTrackerState createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final TextEditingController groceryController = TextEditingController();
  final TextEditingController electricityController = TextEditingController();
  final TextEditingController gasController = TextEditingController();
  final TextEditingController maintenanceController = TextEditingController();

  PiechartData data = PiechartData(
    grocery: 0,
    electricity: 0,
    gas: 0,
    maintenance: 0,
  );

  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    groceryController.text = data.grocery.toString();
    electricityController.text = data.electricity.toString();
    gasController.text = data.gas.toString();
    maintenanceController.text = data.maintenance.toString();
  }

  void _updateValues() {
    setState(() {
      data = PiechartData(
        grocery: double.tryParse(groceryController.text) ?? data.grocery,
        electricity:
            double.tryParse(electricityController.text) ?? data.electricity,
        gas: double.tryParse(gasController.text) ?? data.gas,
        maintenance:
            double.tryParse(maintenanceController.text) ?? data.maintenance,
      );
    });
  }

  void _handleNext() {
    _updateValues();
    double total =
        data.grocery + data.electricity + data.gas + data.maintenance;
    User user = User(
      currentExpenses: [
        CurrentExpense(
            name: 'Grocery',
            expense: data.grocery.toInt(),
            category: 'Grocery'),
        CurrentExpense(
            name: 'Electricity',
            expense: data.electricity.toInt(),
            category: 'Electricity'),
        CurrentExpense(name: 'Gas', expense: data.gas.toInt(), category: 'Gas'),
        CurrentExpense(
            name: 'Maintenance',
            expense: data.maintenance.toInt(),
            category: 'Maintenance'),
      ],
      currentMonthlyExpense: total.toInt(),
    );
    // Handle user data as needed, e.g., navigate to the next screen or save the data
    print(user.toMap()); // Example: Print user data to console
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HealthDetailsScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalExpense = data.total;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Palette.black),
        title: Text('Expense Tracker', style: title()),
        backgroundColor: Palette.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.getPercentSize(3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Every Monthly Spending in each Category',
                  style: TextStyle(fontSize: 13)),
              SizedBox(height: 10),
              _buildExpenseInput(
                  'Grocery', groceryController, Colors.blue, data.grocery),
              _buildExpenseInput('Electricity bill', electricityController,
                  Colors.red, data.electricity),
              _buildExpenseInput(
                  'Gas bill', gasController, Colors.orange, data.gas),
              _buildExpenseInput('House maintenance', maintenanceController,
                  Colors.purple, data.maintenance),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _updateValues,
                      child:
                          Text('UPDATE', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _handleNext,
                      child:
                          Text('NEXT', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                    ),
                  ],
                ),
              ),
              Text('Expense Distribution',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Container(
                height: SizeConfig.getPercentSize(50),
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    sections: data.getSections(touchedIndex),
                    centerSpaceRadius: 40,
                    sectionsSpace: 2,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Indicator(
                      color: Colors.blue, text: 'Grocery', isSquare: true),
                  SizedBox(width: 4),
                  Indicator(
                      color: Colors.red, text: 'Electricity', isSquare: true),
                  SizedBox(width: 4),
                  Indicator(color: Colors.orange, text: 'Gas', isSquare: true),
                  SizedBox(width: 4),
                  Indicator(
                      color: Colors.purple,
                      text: 'Maintenance',
                      isSquare: true),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total monthly expenses',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: SizeConfig.getPercentSize(3)),
                  Container(
                    width: SizeConfig.getPercentSize(29),
                    height: SizeConfig.getPercentSize(10),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      controller: TextEditingController(
                        text: '₹$totalExpense',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpenseInput(String label, TextEditingController controller,
      Color color, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(width: SizeConfig.getPercentSize(4)),
          Expanded(
            child: LinearProgressIndicator(
              value: value / 10000,
              backgroundColor: Colors.grey[200],
              color: color,
              minHeight: 10,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
