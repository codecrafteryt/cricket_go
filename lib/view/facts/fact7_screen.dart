
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/view/facts/fact8_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/values/style.dart' show kSize14DarkW400Text;
import '../widgets/custom_appbar.dart';

class Fact7Screen extends StatelessWidget {
  Fact7Screen({super.key});

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
                                'assets/images/fact7.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          // Right Arrow
                          GestureDetector(
                            onTap: () {
                              Get.to(() => Fact8Screen());
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
                        "The Regional Inter-District Senior tournament 2023-2024 will begin on Sunday, 16 July, featuring 104 teams from 101 districts/zones. Top performers will improve their chances of selection for regional squads in PCB’s major domestic events starting in September. A total of 259 matches will be played nationwide, beginning 16 July in Abbottabad, AJK, Bahawalpur, Dera Murad Jamali, FATA, Hyderabad, Karachi, Larkana, Quetta, and Sialkot Regions. Matches in Multan start on 19 July, while Faisalabad, Islamabad, Lahore, Peshawar, and Rawalpindi begin on 24 July. Each match will last three days with a 75-over limit for the first innings. Nine points are awarded for an outright win with a first innings lead, six for a win without a first innings lead, and three for a first innings lead in a drawn match. Teams may make two changes to their line-ups after every two matches, ensuring fair player opportunities. In Quetta and FATA Regions, which each have 10 districts, teams are split into two groups with a final from 7-9 August. The remaining 14 regions follow a single-league format, with the top team declared the winner. The 16 regions are Abbottabad (seven districts), AJK (five districts), Bahawalpur (seven districts), Dera Murad Jamali (five districts), Faisalabad (six districts), FATA (10 districts), Hyderabad (seven districts), Islamabad (four zones and one district), Karachi (seven zones), Lahore (three zones; six teams), Larkana (six districts), Multan (seven districts), Peshawar (five districts), Quetta (10 districts), Rawalpindi (four districts), and Sialkot (seven districts). The 104 squads were selected using a set criteria approved by district representatives. District selection committees, including coaches and representatives, prepared the initial squads which were reviewed and finalized by the PCB Review Panel featuring former first-class players Javed Hayat, Kamran Khan, Sanaullah Baloch, and Waqar Orakzai. Selection criteria in order: players over-aged from Pakistan U19 in the last two years, over-aged players from last year’s U19 events, top three batters and top two bowlers from last year’s district/CCA events, standout performers from the previous divisional competition, talented players who underperformed in last year’s Second XI event, and other trial standouts not meeting the above conditions.",
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
