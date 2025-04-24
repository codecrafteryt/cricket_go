
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/view/players/player4_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/values/style.dart' show kSize14DarkW400Text;
import '../widgets/custom_appbar.dart';

class Player3Screen extends StatelessWidget {
  Player3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CustomAppBar(
                  title: 'Cricket\nGo!',
                ),
                20.sbh,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 378.w,
                    height: 363.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.53),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color.fromRGBO(103, 118, 86, 1),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Center Image
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Image.asset(
                                'assets/images/player3.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          // Arrows + Text Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left Arrow
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(3.1416),
                                  child: Image.asset(
                                    'assets/images/rarrow.png',
                                    width: 40.w,
                                    height: 40.h,
                                  ),
                                ),
                              ),

                              // Center Text
                              Text(
                                "Babar Azam",
                                style: kSize14DarkW400Text.copyWith(
                                  fontSize: 20.sp,
                                  color: MyColors.white,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(2.w, 2.h),
                                      blurRadius: 2.r,
                                      color: const Color.fromRGBO(121, 105, 159, 1),
                                    ),
                                  ],
                                ),
                              ),

                              // Right Arrow
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => Player4Screen());
                                },
                                child: Image.asset(
                                  'assets/images/rarrow.png',
                                  width: 40.w,
                                  height: 40.h,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                10.sbh,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 378.w,
                    height: 363.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.53),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color.fromRGBO(103, 118, 86, 1),
                        width: 2,
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Babar Azam of Pakistan had a fantastic year in 2021, and he will begin the new year as the world’s best One Day International batsman. Babar is also a top 10 performer in both T20 and Test cricket. In the previous calendar year, he was a standout in all three formats, scoring 939 runs. These runs were hit with a strike rate of 127.58 percent and an average of 37.56 percent Given that strike rates in test cricket tend to be lower, those are excellent numbers. At the start of 2022, Babar Azam had appeared in 203 games across the three formats. He has nearly 9,000 runs to his credit, including 20 international centuries.",
                        style: kSize14DarkW400Text.copyWith(
                          fontSize: 12,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
