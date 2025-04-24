
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/view/players/player2_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/values/style.dart' show kSize14DarkW400Text;
import '../widgets/custom_appbar.dart';

class Player1Screen extends StatelessWidget {
  Player1Screen({super.key});

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
                                'assets/images/player1.jpg',
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
                                "Virat Kohli",
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
                                  Get.to(() => Player2Screen());
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
                        "Critics would point out that Virat Kohli has not scored an international century in more than two years. However, India’s test match skipper continues to be a threat in all three forms of cricket, earning him a spot on our list. Kohli is placed second in One Day Internationals and tenth in Test cricket, according to the official ICC rankings. In 2022, he’ll be eager to disprove his doubters, and I’m anticipating a positive reaction from Virat Kohli this year. This right-handed ace hitter has 43 ODI hundreds in 260 matches, putting him on track to break Sachin Tendulkar’s world record of 49 ODI hundreds. Under his helmet, he also has a massive 27 test hundreds. Kohli has the global record for the quickest ODI run totals of 7000, 8000, 9000, 10000, 11000, and 12000 runs. It took him only 242 innings to attain the milestone of 12000 ODI runs, which is the fastest in the world. He has the world record batting average of 51.50 in T20I games, making him the most difficult batsman to dismiss in the sport.",
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
