import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DescriptionImage extends StatelessWidget {
  final String name;
  final String business;
  final String image;
  const DescriptionImage({Key? key, required this.name, required this.business, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(vertical: 3.h),
    child: Row(
      children: [
        Expanded(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                business,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
        Container(
          height: 10.h,
          width: 10.h,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(100)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/$image',
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    ),
  );
}