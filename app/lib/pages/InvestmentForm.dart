import 'package:bob_hacks/core/theme/palette.dart';
import 'package:bob_hacks/pages/RiskReward.dart';
import 'package:bob_hacks/utils/ui_utils/text/text_widgets.dart';
import 'package:bob_hacks/utils/ui_utils/text/typography.dart';
import 'package:flutter/material.dart';
import 'package:bob_hacks/constants/sizeconfig.dart';

class InvestmentForm extends StatelessWidget {
  const InvestmentForm({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    // SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.getPercentSize(5)),
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.getPercentSize(5)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.getPercentSize(3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: SizeConfig.getPercentSize(3),
                spreadRadius: SizeConfig.getPercentSize(0.5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Txt(
                  'How much do you have to invest?',
                  style: Typo.bodyMedium
                ),
              ),
              SizedBox(height: SizeConfig.getPercentSize(2)),
              Txt(
                'Total investment amount',
                style: Typo.bodyLarge
              ),
              SizedBox(height: SizeConfig.getPercentSize(1)),
              TextField(
                decoration: InputDecoration(
                  hintText: '₹100,000',
                  hintStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: SizeConfig.getPercentSize(4),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: SizeConfig.getPercentSize(2),
                    horizontal: SizeConfig.getPercentSize(3),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: SizeConfig.getPercentSize(2)),
              Txt(
                'Total investment year',
                style: Typo.bodyLarge
              ),
              SizedBox(height: SizeConfig.getPercentSize(1)),
              TextField(
                decoration: InputDecoration(
                  hintText: '10 Yrs',
                  hintStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: SizeConfig.getPercentSize(4),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: SizeConfig.getPercentSize(2),
                    horizontal: SizeConfig.getPercentSize(3),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: SizeConfig.getPercentSize(3)),
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
                      style: Typo.bodyMedium.copyWith(color: Palette.white)                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle next button press
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RiskRewardPage()));
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
                      style: Typo.bodyMedium.copyWith(color: Palette.white)
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
                    style: Typo.bodyMedium
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
