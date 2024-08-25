import 'package:flutter/material.dart';

class InvestmentStrategiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Money Mentor',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              'assets/pngs/logo.png', // Replace with your logo asset
              height: 40,
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        // Add your drawer menu items here
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            // Add more items here
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Investment Strategies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Curated investment strategies based on your risk appetite',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              // Legend for chart
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildLegend('Index Mutual Funds', Colors.pink),
                  _buildLegend('Fixed Deposit', Colors.green),
                  _buildLegend('Blue Chip Funds', Colors.yellow),
                  _buildLegend('Technology Mutual Funds', Colors.blue),
                  _buildLegend('Mid Cap Stocks', Colors.orange),
                ],
              ),
              SizedBox(height: 16),
              // Placeholder for chart
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.grey[200],
                  child: Center(child: Text('Chart Placeholder')),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Best performing Equity Mutual Funds',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildFundRow('Quant Small Cap Fund', '51.52%'),
              _buildFundRow('Quant Infrastructure Fund', '41.48%'),
              SizedBox(height: 16),
              Text(
                'Best Performing Small Cap Stocks',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildStockRow('PNB Housing Finance', '892.85'),
              _buildStockRow('Century Textile & Industries', '2,306.30'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegend(String text, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: 12, color: color),
        SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildFundRow(String fundName, String percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(child: Text(fundName)),
          Text(percentage, style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }

  Widget _buildStockRow(String stockName, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(child: Text(stockName)),
          Text(price),
        ],
      ),
    );
  }
}
