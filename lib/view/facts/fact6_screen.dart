
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/view/facts/fact7_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/values/style.dart' show kSize14DarkW400Text;
import '../widgets/custom_appbar.dart';

class Fact6Screen extends StatelessWidget {
  Fact6Screen({super.key});

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
                                'assets/images/fact6.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          // Right Arrow
                          GestureDetector(
                            onTap: () {
                              Get.to(() => Fact7Screen());
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
                        "Some of the world’s top cricketers will be up for bidding in Dubai on Tuesday for the upcoming Indian Premier League (IPL) auction. Players will start with base prices up to 240,000, but the best will be sold for much higher amounts. This year, the 10 IPL franchises have a combined total of 31.5 million to spend. The IPL, which is the richest cricket tournament, is set to begin in March. Players receive the majority of the bidding fee, and here are five stars who could potentially land lucrative contracts: Pat Cummins (Australia) - Pat Cummins skipped this year’s IPL due to a packed schedule but is set to return after leading Australia to World Cup glory in India. The fast bowler impressed with his leadership and crucial wickets, including the dismissal of Indian star Virat Kohli in the World Cup final. Cummins, 30, had a record-breaking 2.17 million auction fee in 2019 with Kolkata Knight Riders. This year, he enters with a base price of 240,000. Other Australian World Cup stars, including Josh Hazlewood, Travis Head, and Steve Smith, will also be in demand. Rachin Ravindra (New Zealand) - Rachin Ravindra is a rising star from New Zealand, known for his impressive World Cup performance, where he made three centuries and scored 578 runs at a strike rate of 106. The 24-year-old all-rounder, with a left-handed batting style and a knack for spin bowling, is of Indian origin. His name, inspired by cricket legends Rahul Dravid and Sachin Tendulkar, gained a lot of attention during the World Cup. He has a base price of 60,000, and with his growing popularity, franchises will likely show strong interest. Harry Brook (England) - Harry Brook, an exciting England batsman, has been successful across all formats, particularly T20, with a strike rate of 141.54. Brook was bought for 1.6 million by Sunrisers Hyderabad in the previous auction but struggled to make a significant impact. Despite a modest World Cup performance, he recently played a match-winning knock in an ODI against the West Indies. Brook will enter the auction with a base price of 240,000. Gerald Coetzee (South Africa) - Gerald Coetzee was one of the standout performers in the World Cup, finishing among the top five wicket-takers with 20 wickets. The 23-year-old South African fast bowler made his Test debut earlier this year and has quickly become an integral part of South Africa’s pace attack. With his impressive World Cup performance, Coetzee is set to attract plenty of attention at a base price of 240,000. Wanindu Hasaranga (Sri Lanka) - Wanindu Hasaranga is a top-tier leg-spinner who has made a name for himself with his knack for taking key wickets. He was a vital part of Sri Lanka’s white-ball team and was purchased for 1.43 million by Royal Challengers Bangalore in 2022 but was released ahead of this year’s auction. Hasaranga has 158 wickets in limited-overs formats and is also a strong middle-order batsman with a T20 strike rate of over 124. Although he missed the World Cup due to injury, Hasaranga is still expected to command a solid contract, with a base price of 180,000.",
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
