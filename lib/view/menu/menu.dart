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
import 'package:cricket_go/view/facts/fact1_screen.dart';
import 'package:cricket_go/view/players/player1_screen.dart';
import 'package:cricket_go/view/quiz/quiz_screen.dart';
import 'package:cricket_go/view/setting_screen.dart';
import 'package:cricket_go/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

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
                150.sbh,
                //VolumeButton(),
                CustomButton(
                  text: "Events",
                  onPressed: () {
                     Get.to(() => Fact1Screen());
                  },
                ),
                30.sbh,
                CustomButton(
                  text: "Players",
                  onPressed: () {
                   Get.to(() => Player1Screen());
                  },
                ),
                30.sbh,
                CustomButton(
                  text: "Quiz",
                  onPressed: () {
                    Get.off(() => QuizScreen());
                  },
                ),
                30.sbh,
                CustomButton(
                  text: "Setting",
                  onPressed: () {
                    Get.off(() => SettingsScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
