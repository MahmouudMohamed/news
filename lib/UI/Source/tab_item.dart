import 'package:flutter/material.dart';
import 'package:news_project/utils/app_color.dart';
import '../../model/SourcesResponse.dart';
class TabItem extends StatelessWidget {
  TabItem({required this.isSelected, required this.source, super.key});

  bool isSelected;
  Source source;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.redColor : Colors.transparent,
        borderRadius: BorderRadius.circular(23),
        border: Border.all(color: AppColors.redColor.withOpacity(0.5), width: 3),
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(color: isSelected ? Colors.white : AppColors.redColor),
      ),
    );
  }
}
