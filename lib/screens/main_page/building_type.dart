import 'package:flutter/material.dart';

class SymptomCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final Color activeColor;
  final Color nonActiveColor;
  final Color iconColors;
  final Color? backColor;
  final bool isActive;
  final double? width;

  const SymptomCard({
    required this.icon,
    required this.title,
    this.isActive = false,
    required this.activeColor,
    required this.nonActiveColor,
    required this.iconColors,
    this.width,
    this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backColor ?? Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  color: activeColor,
                )
              : BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 5,
                  color: nonActiveColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          icon,
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: iconColors, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
