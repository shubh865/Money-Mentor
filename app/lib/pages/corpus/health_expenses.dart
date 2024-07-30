import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:bob_hacks/core/theme/palette.dart';
import 'package:flutter/material.dart';

import '../../utils/ui_utils/text/text_style.dart';

class HealthExpenses extends StatefulWidget {
  final String title;
  final List<String> subItems;
  final Map<String, Map<String, String>> subItemData;

  HealthExpenses({
    required this.title,
    required this.subItems,
    required this.subItemData,
  });

  @override
  _HealthExpensesState createState() => _HealthExpensesState();
}

class _HealthExpensesState extends State<HealthExpenses> {
  bool _isExpanded = false;
  String? _selectedSubItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.title.toUpperCase(),
            style: smallDescp2(color: Palette.primaryBlue),
          ),
          trailing: Icon(
            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Palette.black,
          ),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
              _selectedSubItem =
                  null; // Reset selected sub-item when collapsing main tile
            });
          },
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: widget.subItems.map((subItem) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        subItem.toUpperCase(),
                        style: smallDescp9(),
                      ),
                      trailing: Icon(
                        _selectedSubItem == subItem
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Palette.black,
                      ),
                      onTap: () {
                        setState(() {
                          _selectedSubItem =
                              _selectedSubItem == subItem ? null : subItem;
                        });
                      },
                    ),
                    if (_selectedSubItem == subItem)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(
                          left: SizeConfig.getPercentSize(2),
                          right: SizeConfig.getPercentSize(2),
                        ),
                        decoration: BoxDecoration(
                          color: Palette.lightGrey,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildInfoRow(
                              icon: Icons.local_hospital,
                              label: 'Surgery Name:',
                              value: widget.subItemData[subItem]
                                  ?['surgery_name'],
                            ),
                            SizedBox(height: 8),
                            buildInfoRow(
                              icon: Icons.attach_money,
                              label: 'Cost:',
                              value: widget.subItemData[subItem]?['cost'],
                            ),
                            SizedBox(height: 8),
                            buildInfoRow(
                              icon: Icons.trending_up,
                              label: 'Inflation Rate:',
                              value: widget.subItemData[subItem]
                                  ?['inflation_rate'],
                            ),
                            SizedBox(height: 8),
                            buildInfoRow(
                              icon: Icons.trending_up,
                              label: 'Inflation:',
                              value: widget.subItemData[subItem]
                                  ?['inflation_considered_cost'],
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget buildInfoRow(
      {required IconData icon, required String label, required String? value}) {
    return Row(
      children: [
        Icon(icon, color: Palette.black),
        SizedBox(width: 8),
        Text(
          label,
          style: smallDescp2(color: Palette.black),
        ),
        Spacer(),
        Text(
          value ?? '',
          style: smallDescp2(color: Palette.black),
        ),
      ],
    );
  }
}
