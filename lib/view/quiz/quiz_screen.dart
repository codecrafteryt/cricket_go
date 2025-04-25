 import 'package:cricket_go/controller/quiz_controller.dart';
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/utils/values/style.dart';
import 'package:cricket_go/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get_core/src/get_main.dart' show Get;
  import 'package:get/get_instance/get_instance.dart';
  import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

  class QuizScreen extends StatelessWidget {
    final QuizController quizController = Get.find();
    QuizScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                CustomAppBar(
                  title: "Cricket\nGo!",
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        20.sbh,
                        Padding(
                          padding: EdgeInsets.all(16.0.w),
                          child: Obx(() => Container(
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
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              child: Text(
                                quizController.questions[quizController.currentQuestionIndex.value].question,
                                textAlign: TextAlign.center,
                                style: kSize14DarkW400Text.copyWith(
                                  fontSize: 20.sp,
                                  color: MyColors.white,
                                ),
                              ),
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Obx(() => GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                              childAspectRatio: 3.0, // Adjust this value based on your content needs
                            ),
                            itemCount: quizController.questions[quizController.currentQuestionIndex.value].options.length,
                            itemBuilder: (context, index) => _buildAnswerOption(index, quizController),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),

                // Next button at the bottom
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Obx(() => _buildNextButton(quizController)),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget _buildAnswerOption(int index, QuizController controller) {
      return Obx(() {
        bool isSelected = controller.selectedAnswerIndex.value == index;
        bool isCorrect = controller.questions[controller.currentQuestionIndex.value].correctAnswerIndex == index;

        // Apply background color based on selection and correctness
        Color backgroundColor;
        if (controller.isAnswered.value) {
          if (isSelected) {
            // Selected answer - green if correct, red if incorrect
            backgroundColor = isCorrect
                ? const Color.fromRGBO(68, 150, 94, 0.53) // Green for correct
                : const Color.fromRGBO(255, 99, 71, 0.52);  // Red for incorrect
          } else if (isCorrect) {
            // Show correct answer in green when question is answered
            backgroundColor = const Color.fromRGBO(93, 185, 102, 0.53); // Green for correct
          } else {
            // Default for unselected options
            backgroundColor = const Color.fromRGBO(255, 255, 255, 0.53);
          }
        } else {
          // Default before answering
          backgroundColor = const Color.fromRGBO(255, 255, 255, 0.52);
        }

        // // Apply color logic to border
        // Color borderColor = isSelected
        //     ? (isCorrect ? Colors.green : Color.fromRGBO(242, 126, 58, 1))
        //     : (controller.isAnswered.value && isCorrect ? Colors.green : const Color.fromRGBO(65, 85, 75, 1));

        return GestureDetector(
          onTap: () {
            if (!controller.isAnswered.value) {
              controller.selectAnswer(index); // Modified to just select answer, not automatically move to next question
            }
          },
          child: Container(
            height: 83.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: const Color.fromRGBO(190, 255, 252, 1),
                width: 2.w,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.questions[controller.currentQuestionIndex.value].options[index],
                  textAlign: TextAlign.center,
                  style: kSize14DarkW400Text.copyWith(
                    fontSize: 12.sp,
                    color: MyColors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      });
    }


    Widget _buildNextButton(QuizController controller) {
      return GestureDetector(
        onTap: controller.isAnswered.value
            ? () => controller.goToNextQuestion()
            : null,
        child: Container(
          width: 210.w,
          height: 61.h,
          decoration: BoxDecoration(
            color: controller.isAnswered.value
                ? Color.fromRGBO(13, 71, 161, 1)
              : Color.fromRGBO(13, 71, 161, 0.82),
            borderRadius: BorderRadius.circular(60.r),
            border: Border.all(
              color: Color.fromRGBO(255, 255, 255, 0.31),
              width: 2.w, // Custom border width
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "NEXT",
                textAlign: TextAlign.center,
                style: kSize14DarkW400Text.copyWith(
                  fontSize: 24.sp,
                  color: controller.isAnswered.value
                      ? MyColors.white
                      : MyColors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }

  }