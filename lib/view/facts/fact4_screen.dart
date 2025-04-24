
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/view/facts/fact5_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/values/style.dart' show kSize14DarkW400Text;
import '../widgets/custom_appbar.dart';

class Fact4Screen extends StatelessWidget {
  Fact4Screen({super.key});

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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left Arrow
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: // Left Arrow (flipped right arrow)
                            Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(3.1416),
                              child: Image.asset(
                                'assets/images/rarrow.png',
                                width: 40.w,
                                height: 40.h,
                              ),
                            ),
                          ),

                          // Center Image
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Image.asset(
                                'assets/images/fact4.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          // Right Arrow
                          GestureDetector(
                            onTap: () {
                              Get.to(() => Fact5Screen());
                            },
                            child: Image.asset(
                              'assets/images/rarrow.png',
                              width: 40.w,
                              height: 40.h,
                            ),
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
                        "Cricket enthusiasts will have a lot to look forward to in 2024, especially fans of the Bangladesh cricket team. Several high-profile tournaments are on the calendar, offering a mix of formats and international competition. We have compiled a list of upcoming and current cricket events and tournaments for this year. In the review, you will find a wealth of useful and interesting information. ICC T20 World Cup 2024 Dates: June 2024 Venue: West Indies and United States Tournament Type: International T20 Bangladesh will be one of the 20 teams competing in the 2024 ICC T20 World Cup, a tournament that will be held in two countries, including the United States, for the first time. As a team that has been refining its T20 strategies, Bangladesh aims to move beyond the group stages and achieve significant success in this tournament. Caribbean Premier League (CPL) 2024 Dates: August to September 2024 Venue: Various venues in the Caribbean Tournament Type: T20 league CPL is a dynamic and highly competitive T20 cricket league that features teams from all over the Caribbean. With its festive atmosphere and fast-paced games, CPL has become a popular destination for international cricket stars, as well as a platform for discovering new talent from the region. Indian Premier League (IPL) 2024 Dates: March to May 2024 Venue: India Tournament Type: T20 league The Indian Premier League (IPL) is an annual cricket tournament held in India that has become one of the most popular and profitable niches for sports betting. It is often compared to football in terms of its popularity and number of fans. In fact, cricket is the second most popular sport in the world, with a significant number of dedicated fans and bettors. The championship itself has become a religion for many Indians. The 2023 season of the IPL attracted over 505 million viewers for its live streams. Each of these events creates a real buzz among cricket enthusiasts. Fans in Bangladesh and India, eagerly await these tournaments. On the official website of 1xbet, the world's leading bookmaker, fans can not only place bets but also watch live matches and read reviews and expert predictions. Domestic Cricket in Bangladesh Cricket is a popular sport in Bangladesh, where it is not just a game but also an integral part of the country's heritage. Each year, the country hosts several domestic cricket tournaments that draw the attention of millions of fans. One of the largest and most significant tournaments is the Bangladesh Premier League (BPL), founded in 2012. This tournament has become the center of attention for domestic cricket talents, with teams from different cities participating. The BPL contributes to the growth of cricket at a regional level",
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
