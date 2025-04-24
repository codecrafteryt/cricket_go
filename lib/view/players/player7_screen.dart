
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/view/players/player8_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/values/style.dart' show kSize14DarkW400Text;
import '../widgets/custom_appbar.dart';

class Player7Screen extends StatelessWidget {
  Player7Screen({super.key});

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
                                'assets/images/player7.jpg',
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
                                "Joe Root",
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
                                  Get.to(() => Player8Screen());
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
                        "In an ODI match, Rohit Sharma has made it a custom to stay on the 22-yard wicket for the entire 50 overs. He is the first and only player in 50-over cricket history to score three double-hundreds, two vs Sri Lanka one was vs Australia. With 5 hundred runs in the 2019 ODI World Cup, he holds the world record for most hundred scorers in one ODI World Cup. In the ODI ICC Rankings, this great ball-hitter is now ranked third as a batsman.",
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
