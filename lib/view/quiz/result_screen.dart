  /*
      ---------------------------------------
      Project: Bat and Brain Game Mobile Application
      Date: April 4, 2024
      Author: Ameer from Pakistan
      ---------------------------------------
      Description: result screen
    */

  import 'package:cricket_go/controller/quiz_controller.dart';
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';

  import '../../utils/values/style.dart' show kSize14DarkW400Text;
  import '../widgets/custom_button.dart';
import 'quiz_screen.dart';

  class ResultScreen extends StatelessWidget {
    final QuizController controller = Get.find();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAppBar(
                    title: 'Cricket\nGo!',
                  ),
                  20.sbh,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 378.w,
                      height: 583.h,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.53),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: const Color.fromRGBO(103, 118, 86, 1),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          70.sbh,
                          Text(
                            "Result:",
                            style: kSize14DarkW400Text.copyWith(
                              color: MyColors.white,
                              fontSize: 45.sp,
                              shadows: [
                                Shadow(
                                  offset: Offset(2.w, 2.h),
                                  blurRadius: 2.r,
                                  color: const Color.fromRGBO(51, 57, 20, 1),
                                ),
                              ],
                            ),
                          ),
                          70.sbh,
                          Text(
                            textAlign: TextAlign.center,
                            "\n${ controller.score.value}/${controller.questions.length}",
                            style: kSize14DarkW400Text.copyWith(
                              color: MyColors.white,
                              fontSize: 45.sp,
                              shadows: [
                                Shadow(
                                  offset: Offset(2.w, 2.h),
                                  blurRadius: 2.r,
                                  color: const Color.fromRGBO(51, 57, 20, 1),
                                ),
                              ],
                            ),
                          ),
                          100.sbh,
                          CustomButton(
                            text: "Retry",
                            onPressed: () {
                              Get.offAll(() => QuizScreen());
                              controller.resetQuiz();
                            },
                          ),
                        ],
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

