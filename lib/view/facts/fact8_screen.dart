
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/values/style.dart' show kSize14DarkW400Text;
import '../widgets/custom_appbar.dart';

class Fact8Screen extends StatelessWidget {
  Fact8Screen({super.key});

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
                                'assets/images/fact8.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          // Right Arrow
                          GestureDetector(
                            onTap: () {
                              //Get.off(() => Fact4Screen());
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
                        "The successful 2023 ICC Women’s T20 World Cup confirmed South Africa as a premier global event host. The two-week tournament ran smoothly, with South Africans uniting to make the eighth edition unforgettable. The world’s best cricketers delivered thrilling performances across Newlands Cricket Ground, Boland Park, and St George’s Park, with record crowds enjoying front-row seats to Africa’s biggest women’s cricket celebration. A record 12,782 spectators attended the Final, contributing to a total of 69,914 – one of the highest attendances for a women’s sporting event in South Africa. The success comes ahead of the 2027 ICC Men’s Cricket World Cup in Southern Africa, with South Africa, Zimbabwe, and Namibia set to host. Tournament Director Russell Adams praised the tireless efforts of the women-led Local Organising Committee (LOC), stating that the event showcased South Africa’s ability to host high-quality global tournaments. The tournament’s success, both locally and globally, empowered individuals, particularly the youth, and demonstrated South Africa’s readiness for future global events. The Legacy Project aimed to boost access and participation across all aspects of the sport – from players to administrators. The Proteas’ performance sparked new interest across age groups in the rapidly growing game. Adams highlighted the positive impact on women’s cricket in Africa, with increased attendance, well-received coaching clinics, and growing enthusiasm for careers in cricket. South Africa’s history-makers reignited passion and reshaped perceptions about women’s cricket, which has long been overshadowed by the men’s game. LOC Chairlady Muditambi Ravele emphasized the Proteas’ role in inspiring young girls to pursue cricket, regardless of background, and noted the growth of new fanbases. She expressed hope for more sponsorships and greater broadcaster interest, fueled by the event’s remarkable viewership.",
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
