
  import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';
  import '../../utils/values/style.dart' show kSize14DarkW400Text;
import '../widgets/custom_appbar.dart';
  import 'fact2_screen.dart';

  class Fact1Screen extends StatelessWidget {
    Fact1Screen({super.key});

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
                                  'assets/images/fact1.jpg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),

                            // Right Arrow
                            GestureDetector(
                              onTap: () {
                                Get.to(() => Fact2Screen());
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
                          "The International Cricket Council (ICC) today announced the eight-team ICC Champions Trophy 2025 schedule to be hosted by Pakistan from 19 February to 10 March. The matches will be played at the three venues of Pakistan – Rawalpindi, Karachi and Lahore, while atleast four matches will be hosted by Dubai International Cricket Stadium in Dubai. Karachi’s National Bank Stadium and Rawalpindi Cricket Stadium will host three group matches each, while Lahore’s Gaddafi Stadium will host a minimum of four matches. All matches will begin at 2pm local time. The tournament will kick-off with a Group A fixture involving Defending champions Pakistan and New Zealand at the National Bank Stadium on Wednesday, 19 February. The second group match of Pakistan will be against India at the Dubai International Cricket Stadium (DICS) on Sunday, 23 February. The hosts will play their third and final group match at the Rawalpindi Cricket Stadium in Rawalpindi against Bangladesh on Thursday, 27 February. Afghanistan, Australia, England and South Africa are placed in Group B. The top two sides from each group will play the semi-finals, with the first semi-final scheduled at the DICS on Tuesday, 4 March. The second semi-final will be staged at the Gaddafi Stadium in Lahore on 5 March. Both the semi-finals have been allotted reserve days as well. The final of the marquee event is scheduled on Sunday, 9 March, with the venue, Lahore’s Gaddafi Stadium or Dubai’s Dubai International Cricket Stadium, to be confirmed closer to the match. 10 March will be the reserve day for the final. PCB Chairman Mohsin Naqvi: “We are pleased that an agreement has been reached based on the principles of equality and respect, showcasing the spirit of cooperation and collaboration that defines our sport. Our heartfelt gratitude goes out to the ICC members who played a constructive role in helping us achieve a mutually beneficial solution. Their efforts have been invaluable in promoting the interests of international cricket. Hosting the Champions Trophy is a significant milestone for Pakistan, highlighting our commitment to promoting cricket at the highest level and showcasing our capabilities as a premier event organizer. We are dedicated to ensuring that this tournament will be a memorable experience for players, officials, and fans alike. Pakistan is elated to welcome the world to the Champions Trophy, and we look forward to extending our renowned hospitality to all.” Mohammad Rizwan, Pakistan’s white-ball captain: “As a cricket loving country, we are all very excited to host the ICC Champions Trophy 2025. Having done well with the help of Almighty in the ODIs recently adds to the excitement and build-up towards the mega-event, and we eagerly look forward to playing in front of our home crowd and excelling in the eight-team tournament. Hosting the ICC Champions Trophy is a great occasion as Pakistan welcomes first ICC event to its shores in 28 years and especially as we are the defending champions. We will try to meet the expectations of our fans. Our country is known for its great hospitality and I am sure the fans will not only support our team, but also appreciate the performances of other teams.” ICC Men’s Champions Trophy 2025 schedule (All matches to begin at 2pm PKT): 19 Feb – Pakistan v New Zealand, National Bank Stadium, Karachi; 20 Feb – Bangladesh v India, Dubai International Cricket Stadium, Dubai; 21 Feb – Afghanistan v South Africa, National Bank Stadium, Karachi; 22 Feb – Australia v England, Gaddafi Stadium, Lahore; 23 Feb – Pakistan v India, Dubai International Cricket Stadium, Dubai; 24 Feb - Bangladesh v New Zealand, Rawalpindi Cricket Stadium, Rawalpindi; 25 Feb – Australia v South Africa, Rawalpindi Cricket Stadium, Rawalpindi; 26 Feb – Afghanistan v England, Gaddafi Stadium, Lahore; 27 Feb – Pakistan v Bangladesh, Rawalpindi Cricket Stadium, Rawalpindi; 28 Feb – Afghanistan v Australia, Gaddafi Stadium, Lahore; 1 Mar – South Africa v England, National Bank Stadium, Karachi; 2 Mar – New Zealand v India, Dubai International Cricket Stadium, Dubai; 4 Mar – Semi-final 1, Dubai International Cricket Stadium, Dubai*; 5 Mar – Semi-final 2, Gaddafi Stadium, Lahore**; 9 Mar – Final - Gaddafi Stadium, Lahore***; * Semi-final 1 will involve India if they qualify; **Semi-final 2 will involve Pakistan if they qualify; *** If India qualify for the final it will be played at the Dubai International Cricket Stadium, Dubai."
                          ,
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
