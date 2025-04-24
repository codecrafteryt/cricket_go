
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/view/players/player5_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/values/style.dart' show kSize14DarkW400Text;
import '../widgets/custom_appbar.dart';

class Player4Screen extends StatelessWidget {
  Player4Screen({super.key});

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
                                'assets/images/player4.jpg',
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
                                "Dawid Malan",
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
                                  Get.to(() => Player5Screen());
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
                        "Top 10 Best Cricket Players Around the World In 2022 FeaturedSports By Team Tech Outlook Published on April 21, 2022, 18:58 IST Cricket is the most famous sport on the planet. It is the most prestigious sport of all time and is appreciated all around the world. With a bat or a ball in their hands, some professionals can perform miracles. On the 22-yard wicket, they can alter the course of a cricket match. We aim to compile a list of ten such outstanding cricketers in this article. Here are the top 10 best cricket players around the world in 2022: Virat Kohli Critics would point out that Virat Kohli has not scored an international century in more than two years. However, India’s test match skipper continues to be a threat in all three forms of cricket, earning him a spot on our list. Kohli is placed second in One Day Internationals and tenth in Test cricket, according to the official ICC rankings. In 2022, he’ll be eager to disprove his doubters, and I’m anticipating a positive reaction from Virat Kohli this year. This right-handed ace hitter has 43 ODI hundreds in 260 matches, putting him on track to break Sachin Tendulkar’s world record of 49 ODI hundreds. Under his helmet, he also has a massive 27 test hundreds. Kohli has the global record for the quickest ODI run totals of 7000, 8000, 9000, 10000, 11000, and 12000 runs. It took him only 242 innings to attain the milestone of 12000 ODI runs, which is the fastest in the world. He has the world record batting average of 51.50 in T20I games, making him the most difficult batsman to dismiss in the sport. Marnus Labuschagne Marnus Labuschagne of Australia created cricket history by becoming the first player to be used as a concussion substitution in a test match in 2019. It was a stroke of luck for the player as well as the Australians, who had almost by chance discovered a star batsman. In that game, Labuschagne took the place of Steve Smith, and by the end of the year, he had surpassed his partner as the highest run-scorer in test cricket. In the longest version of the game, he continued to score heavily, and the 27-year-old will begin 2022 as the number one ranked test batter. Labuschagne had 2644 runs with seven hundreds and a best of 215 in 35 international matches (tests and ODIs) up to and including the fourth Ashes Test at Sydney in 2022. Babar Azam Babar Azam of Pakistan had a fantastic year in 2021, and he will begin the new year as the world’s best One Day International batsman. Babar is also a top 10 performer in both T20 and Test cricket. In the previous calendar year, he was a standout in all three formats, scoring 939 runs. These runs were hit with a strike rate of 127.58 percent and an average of 37.56 percent Given that strike rates in test cricket tend to be lower, those are excellent numbers. At the start of 2022, Babar Azam had appeared in 203 games across the three formats. He has nearly 9,000 runs to his credit, including 20 international centuries. Dawid Malan Dawid Malan has found it difficult against Australia in the 2021/22 Ashes series, as have all of England’s test batsmen. He does, however, start the New Year as the top-ranked T20i batter, which is enough to get him on this list. When he struck 103 against New Zealand in 2019, he became only the second English hitter to score a T20i century. He’s also made a 99 in this format for his country since then. Malan has been criticized for not scoring quickly enough in limited-overs cricket, but he should still be a key player for England in 2022.",
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
