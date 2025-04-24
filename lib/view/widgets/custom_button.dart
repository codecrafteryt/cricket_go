  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: custom button
          */
  import 'package:cricket_go/utils/values/my_color.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/values/style.dart';

  class CustomButton extends StatelessWidget {
    final String text;
    final VoidCallback onPressed;
    final Color borderColor;
    final double borderRadius;
    final double borderOpacity;
    final double height;
    final double width;

    const CustomButton({
      Key? key,
      required this.text,
      required this.onPressed,
      this.borderColor = const Color.fromRGBO(255, 255, 255, 0.31),
      this.borderRadius = 60.0,
      this.borderOpacity = 0.52,
      this.height = 61.0,
      this.width = 210.0,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,  // Custom width
          height: height,  // Custom height
          decoration: BoxDecoration(
            color: Color.fromRGBO(13, 71, 161, 0.82),
            borderRadius: BorderRadius.circular(borderRadius), // Custom border radius
            border: Border.all(
              color: borderColor.withOpacity(borderOpacity),
              width: 2.w, // Border width
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                textAlign: TextAlign.center,
                text,
                style: kSize14DarkW400Text.copyWith(
                  fontSize: 24.sp,
                  color: MyColors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(2.w, 2.h),
                      blurRadius: 2.r,
                      color: const Color.fromRGBO(121, 105, 159, 1),
                    ),
                  ],
                )

              ),
          ),
        ),
      );
    }
  }
