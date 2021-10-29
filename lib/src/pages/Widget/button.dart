import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Button extends StatelessWidget {
  final String description;
  const Button({Key? key, required this.description,}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
    padding: EdgeInsets.symmetric(
      vertical: 10.sp,
      horizontal: 10.sp
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.yellow
    ),
    child: Center(
      child: Text(
        description,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ),
    ),
  );
}