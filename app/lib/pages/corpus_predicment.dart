import 'package:flutter/material.dart';

class ListTileWithDropdown extends StatefulWidget {
  final String title;
  final List<String> subItems;

  ListTileWithDropdown({required this.title, required this.subItems});

  @override
  _ListTileWithDropdownState createState() => _ListTileWithDropdownState();
}

class _ListTileWithDropdownState extends State<ListTileWithDropdown> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.title),
          trailing: Icon(
            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          ),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: widget.subItems.map((subItem) {
                return ListTile(
                  title: Text(subItem),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  onTap: () {
                    // You can add more functionality here if needed
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
