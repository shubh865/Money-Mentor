import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PiechartData {
  final double grocery;
  final double electricity;
  final double gas;
  final double maintenance;

  PiechartData({
    required this.grocery,
    required this.electricity,
    required this.gas,
    required this.maintenance,
  });

  double get total => grocery + electricity + gas + maintenance;

  List<PieChartSectionData> getSections(int touchedIndex) {
    return [
      PieChartSectionData(
        color: Colors.blue,
        value: grocery,
        title: '${(grocery / total * 100).toStringAsFixed(1)}%',
        radius: touchedIndex == 0 ? 60 : 50,
        titleStyle: TextStyle(
          fontSize: touchedIndex == 0 ? 25 : 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: electricity,
        title: '${(electricity / total * 100).toStringAsFixed(1)}%',
        radius: touchedIndex == 1 ? 60 : 50,
        titleStyle: TextStyle(
          fontSize: touchedIndex == 1 ? 25 : 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: gas,
        title: '${(gas / total * 100).toStringAsFixed(1)}%',
        radius: touchedIndex == 2 ? 60 : 50,
        titleStyle: TextStyle(
          fontSize: touchedIndex == 2 ? 25 : 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
      PieChartSectionData(
        color: Colors.purple,
        value: maintenance,
        title: '${(maintenance / total * 100).toStringAsFixed(1)}%',
        radius: touchedIndex == 3 ? 60 : 50,
        titleStyle: TextStyle(
          fontSize: touchedIndex == 3 ? 25 : 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
    ];
  }
}
