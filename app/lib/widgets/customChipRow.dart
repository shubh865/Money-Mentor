import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:flutter/material.dart';

class CustomChipRow extends StatelessWidget {
  const CustomChipRow({
    super.key,
    required this.selectedIndex,
    required this.testList,
    required this.onSelected,
  });

  final int selectedIndex;
  final List<String> testList;
  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < testList.length; i++)
            // Check for Platform
            (Theme.of(context).platform == TargetPlatform.iOS)
                ? CustomIosChip(
                    isSelected: selectedIndex == i,
                    text: testList[i],
                    onTap: () => onSelected(i),
                  )
                : CustomAndroidChip(
                    isSelected: selectedIndex == i,
                    text: testList[i],
                    onTap: () => onSelected(i),
                  ),
        ],
      ),
    );
  }
}

class CustomIosChip extends StatelessWidget {
  const CustomIosChip({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  final bool isSelected;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getPercentSize(5),
          vertical: SizeConfig.getPercentSize(1),
        ),
        margin: EdgeInsets.only(right: SizeConfig.getPercentSize(2)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.purple : Colors.transparent,
          border: isSelected ? null : Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.blue,
          ),
        ),
      ),
    );
  }
}

class CustomAndroidChip extends StatelessWidget {
  const CustomAndroidChip({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  final bool isSelected;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              text,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 1,
            width: text.length * 7 + 9,
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
