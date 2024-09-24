import 'package:flutter/material.dart';
import '../../model/SourcesResponse.dart';
class TabItem extends StatelessWidget {
  TabItem({required this.isSelected, required this.source, super.key});

  bool isSelected;
  Source source;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(23),
        border: Border.all(color: Colors.green, width: 3),
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}
