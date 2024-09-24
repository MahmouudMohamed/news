import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  IconData? icon;
  String name;
   RowItem({required this.name,required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(icon,size: 40,),
          SizedBox(
            width: 10,
          ),
          Text(name,style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }
}
