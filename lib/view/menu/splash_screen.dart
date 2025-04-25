  import 'dart:async';
  import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/style.dart';
import 'package:cricket_go/view/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
  class SplashScreen extends StatefulWidget {
    const SplashScreen({super.key});

    @override
    _SplashScreenState createState() => _SplashScreenState();
  }

  class _SplashScreenState extends State<SplashScreen> {
    double progress = 0.0;

    @override
    void initState() {
      super.initState();
      _startProgress();
    }

    void _startProgress() {
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (progress < 1.0) {
          setState(() {
            progress += 0.05;
          });
        } else {
          timer.cancel();
          Future.delayed(const Duration(milliseconds: 200), () {
            if (mounted) {
              Get.offAll(() => Menu());
            }
          });
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                172.sbh,
               Padding(
                 padding: EdgeInsets.all(10),
                 child: Text(
                   textAlign: TextAlign.center,
                   "Cricket Go!",
                 style: kSize11DarkW500Text.copyWith(
                   fontSize: 59,
                     color: const Color.fromRGBO(115, 119, 131, 1),
                 ),
                 ),
               ),
                315.sbh,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Color.fromRGBO(160, 160, 160, 1),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      const Color.fromRGBO(77, 175, 180, 1),
                    ),
                    minHeight: 26.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }