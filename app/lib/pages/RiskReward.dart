import 'package:bob_hacks/core/theme/palette.dart';
import 'package:bob_hacks/pages/InvestmentStrategyPage.dart';
import 'package:bob_hacks/utils/ui_utils/text/typography.dart';
import 'package:flutter/material.dart';
import 'package:bob_hacks/constants/sizeconfig.dart';

class RiskRewardPage extends StatefulWidget {
  const RiskRewardPage({super.key});

  @override
  _RiskRewardPageState createState() => _RiskRewardPageState();
}

class _RiskRewardPageState extends State<RiskRewardPage> {
  double _currentSliderValue = 0.5; // Start at the middle point

  // Base values for investment
  final double baseInvestment = 100000; // Example investment amount
  final int investmentYears = 10; // Example investment period in years

  // Calculating gain and risk based on slider value
  double get annualReturnPercentage => (_currentSliderValue * 30) - 15; // Range -15% to +15%
  double get potentialGain => (baseInvestment * (_currentSliderValue * 0.3)) * investmentYears; // Adjust gain calculation
  double get potentialRisk => -(baseInvestment * ((1 - _currentSliderValue) * 0.3)) * investmentYears; // Adjust risk calculation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.getPercentSize(5)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Risk and reward go hand-in-hand.',
                style: TextStyle(
                  fontSize: SizeConfig.getPercentSize(5),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.getPercentSize(2)),
              Text(
                'Think about the next 6 months and adjust the slider below to fit',
                style: TextStyle(
                  fontSize: SizeConfig.getPercentSize(3),
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.getPercentSize(3)),
              
              // Custom Slider
              Container(
                width: double.infinity,
                height: SizeConfig.getPercentSize(15),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Gradient background for risk/reward
                    Positioned.fill(
                      child: CustomPaint(
                        painter: RiskRewardGradientPainter(),
                      ),
                    ),
                    // Triangle to indicate risk/reward zone
                    // Positioned(
                    //   left: SizeConfig.getPercentSize(5) + (_currentSliderValue * (MediaQuery.of(context).size.width - SizeConfig.getPercentSize(10))),
                    //   child: CustomPaint(
                    //     painter: TrianglePainter(),
                    //     child: Container(
                    //       width: 30,
                    //       height: 60,
                    //     ),
                    //   ),
                    // ),
                    // Draggable slider thumb
                    Positioned(
                      left: SizeConfig.getPercentSize(5) + (_currentSliderValue * (MediaQuery.of(context).size.width - SizeConfig.getPercentSize(10))) - 15,
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          setState(() {
                            _currentSliderValue += details.delta.dx / (MediaQuery.of(context).size.width - SizeConfig.getPercentSize(10));
                            if (_currentSliderValue < 0) _currentSliderValue = 0;
                            if (_currentSliderValue > 1) _currentSliderValue = 1;
                          });
                        },
                        child: CircleAvatar(
                          radius: SizeConfig.getPercentSize(4),
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.drag_handle, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: SizeConfig.getPercentSize(4)),
              Container(
                padding: EdgeInsets.symmetric(vertical: SizeConfig.getPercentSize(1), horizontal: SizeConfig.getPercentSize(5)),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(SizeConfig.getPercentSize(2)),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'A typical portfolio like this would target an annual return of ',
                        style: TextStyle(
                          fontSize: SizeConfig.getPercentSize(3.4),
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '${annualReturnPercentage.toStringAsFixed(2)}%',
                        style: TextStyle(
                          fontSize: SizeConfig.getPercentSize(3.4),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.getPercentSize(3)),
              Text(
                'For the chance at gaining',
                style: TextStyle(
                  fontSize: SizeConfig.getPercentSize(3),
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: SizeConfig.getPercentSize(1)),
              Text(
                '+₹${potentialGain.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: SizeConfig.getPercentSize(2.9),
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.getPercentSize(2)),
              Text(
                "I'm comfortable risking",
                style: TextStyle(
                  fontSize: SizeConfig.getPercentSize(3),
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: SizeConfig.getPercentSize(1)),
              Text(
                '-₹${potentialRisk.abs().toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: SizeConfig.getPercentSize(2.9),
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.getPercentSize(4)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle back button press
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.getPercentSize(7),
                        vertical: SizeConfig.getPercentSize(1.5),
                      ),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeConfig.getPercentSize(1)),
                      ),
                    ),
                    child: Text(
                      'Back',
                      style: Typo.bodyMedium.copyWith(color: Palette.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle next button press
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>InvestmentStrategiesPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.getPercentSize(7),
                        vertical: SizeConfig.getPercentSize(1.5),
                      ),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeConfig.getPercentSize(1)),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: Typo.bodyMedium.copyWith(color: Palette.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.getPercentSize(2)),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle help button press
                  },
                  child: Text(
                    'Need help?',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.getPercentSize(3),
                    ),
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

// Custom painter for gradient background
class RiskRewardGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.red.shade300, Colors.green.shade300],
        stops: [0.5, 0.5],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, size.height / 2 - 10, size.width, 20), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter for triangle
// class TrianglePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;

//     final Path path = Path();
//     path.moveTo(0, size.height);
//     path.lineTo(size.width / 2, 0);
//     path.lineTo(size.width, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
