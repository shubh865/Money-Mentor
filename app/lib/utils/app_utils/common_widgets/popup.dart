import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/palette.dart';
import '../../ui_utils/text/typography.dart';

class PopUp {
  void showConfimBox({
    required BuildContext context,
    required String title,
    required VoidCallback onTapYes,
    required VoidCallback onTapNo,
  }) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Palette.white
              : Palette.darkPurple,
          title: Stack(
            children: [
              Positioned(
                top: -10,
                right: -5,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              Text(
                title,
                style: Typo.bodySmall,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: onTapNo,
                title: Text(
                  'No',
                  style: Typo.bodySmall,
                ),
              ),
              ListTile(
                onTap: onTapYes,
                title: Text(
                  'Yes',
                  style: Typo.bodySmall,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
