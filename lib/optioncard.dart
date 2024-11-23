import 'package:flutter/material.dart';
class Optioncard extends StatelessWidget {
  const Optioncard({Key?key,required this.option,required this.color}):super(key: key);
  final String option;
 
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        child: Card(
          color: color,
          child: ListTile(
            title: Text(
              option,
              textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
            ),
            ),
          ),
        ),
      ),
    );
  }
}