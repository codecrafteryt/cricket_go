  /*
          ---------------------------------------
          Project: stumped Game Mobile Application
          Date: April 11, 2024
          Author: Ameer from Pakistan
          ---------------------------------------
          Description: menu screen
        */
  import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/style.dart';
import 'package:cricket_go/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';

  class Menu extends StatelessWidget {
    Menu({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                172.sbh,
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Cricket Go!",
                    style: kSize11DarkW500Text.copyWith(
                      fontSize: 59,
                      color: Colors.white,
                    ),
                  ),
                ),
                200.sbh,
                //VolumeButton(),
                CustomButton(
                  text: "Events",
                  onPressed: () {
                    // Get.off(() => Fact1Screen());
                  },
                ),
                30.sbh,
                CustomButton(
                  text: "Players",
                  onPressed: () {
                   // Get.off(() => Player1Screen());
                  },
                ),
                30.sbh,
                CustomButton(
                  text: "Quiz",
                  onPressed: () {
                    // Get.off(() => QuizScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
