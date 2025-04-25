/*
          ---------------------------------------
          Project: Stumped Game Mobile Application
          Date: April 11, 2024
          Author: Ameer from Pakistan
          ---------------------------------------
          Description: app bar
        */
  import 'package:cricket_go/view/menu/menu.dart';
import 'package:cricket_go/view/setting_screen.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';

import '../../utils/values/style.dart' show kSize11DarkW500Text;

  class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
    final String title;

    const CustomAppBar({
      Key? key,
      required this.title,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back button
              GestureDetector(
                onTap: () {
                  debugPrint("1212");
                  Get.to(() => SettingsScreen());
                },
                child: Container(
                  width: 61.w,
                  height: 61.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(13, 71, 161, 0.82),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: const Color.fromRGBO(103, 118, 86, 1),
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      'assets/images/setting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ),
              // Title
              Text(
                textAlign: TextAlign.center,
                title,
                style: kSize11DarkW500Text.copyWith(
                  fontSize: 35.sp,
                  color: const Color.fromRGBO(115, 119, 131, 1),
                )
              ),
              // Sound toggle button
              GestureDetector(
                  onTap: () {
                    if (Get.isOverlaysOpen) {
                      Get.back();
                    } else {
                      Get.offAll(() => Menu());
                    }
                  },
                  child: Container(
                    width: 61.w,
                    height: 61.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(13, 71, 161, 0.82),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color.fromRGBO(103, 118, 86, 1),
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                        'assets/images/exit.png',
                        height: 20,
                        width: 20,
                      ),
                  )
              ),            ],
          ),
        ),
      );
    }

    @override
    Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8.0);
  }