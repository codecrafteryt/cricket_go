import 'package:cricket_go/controller/setting_controller.dart';
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/utils/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  final SettingController controller = Get.find();
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),

            // Foreground content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  13.sbh,
                  Text(
                    textAlign: TextAlign.center,
                    "Cricket\nGo!",
                    style: kSize11DarkW500Text.copyWith(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  80.sbh,
                  Text(
                    textAlign: TextAlign.center,
                    "Settings",
                    style: kSize14DarkW400Text.copyWith(
                      color: MyColors.white,
                      fontSize: 40.sp,
                    ),
                  ),
                  20.sbh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Music Volume Column
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Music",
                            style: kSize11DarkW500Text.copyWith(
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                          10.sbh,
                          Obx(() => Text(
                            "${(controller.musicVolume.value * 100).toInt()}",
                            style: kSize11DarkW500Text.copyWith(
                              fontSize: 32.sp,
                              color: Colors.white,
                            ),
                          )),
                          10.sbh,
                          SizedBox(
                            height: 200.h,
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: _VolumeBar(
                                onVolumeChanged: (value) {
                                  controller.setMusicVolume(value);
                                },
                                volumeValue: controller.musicVolume,
                                onActivate: () {
                                  if (!controller.isMusicOn.value) {
                                    controller.toggleMusic();
                                  }
                                },
                              ),
                            ),
                          ),
                          10.sbh,
                          Text(
                            "0",
                            style: kSize11DarkW500Text.copyWith(
                              fontSize: 32.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // Sound Volume Column (duplicate logic for sound)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Sound",
                            style: kSize11DarkW500Text.copyWith(
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                          10.sbh,
                          Text(
                           // "${(controller.soundVolume.value * 100).toInt()}",
                            "",
                            style: kSize11DarkW500Text.copyWith(
                              fontSize: 32.sp,
                              color: Colors.white,
                            ),
                          ),
                          10.sbh,
                          SizedBox(
                            height: 200.h,
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: _VolumeBar(
                                // onVolumeChanged: (value) {
                                // //  controller.setSoundVolume(value);
                                // },
                               // volumeValue: controller.soundVolume,
                                onActivate: () {
                                  // if (!controller.isSoundOn.value) {
                                  //   controller.toggleSound();
                                  // }
                                },
                                onVolumeChanged: (value){

                                },
                                volumeValue: controller.musicVolume,
                              ),
                            ),
                          ),
                          10.sbh,
                          Text(
                            "0",
                            style: kSize11DarkW500Text.copyWith(
                              fontSize: 32.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _VolumeBar extends StatelessWidget {
  final Function(double) onVolumeChanged;
  final RxDouble volumeValue;
  final VoidCallback onActivate;

  const _VolumeBar({
    required this.onVolumeChanged,
    required this.volumeValue,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final barWidth = constraints.maxWidth;

        void _handleInteraction(Offset localPosition) {
          // Clamp to ensure we stay within bar boundaries
          final dx = localPosition.dx.clamp(0.0, barWidth);
          final newVolume = dx / barWidth;
          onVolumeChanged(newVolume);
          onActivate();
        }

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            _handleInteraction(details.localPosition);
          },
          onTapDown: (details) {
            _handleInteraction(details.localPosition);
          },
          child: Container(
            width: barWidth,
            height: 60,
            child: Obx(() {
              // Calculate proper thumb position
              final thumbWidth = 40.0;
              final thumbPosition = (volumeValue.value * (barWidth - thumbWidth));

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  // Base bar background
                  Container(
                    width: barWidth,
                    height: 20,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  // Filled part of the bar (green)
                  Positioned(
                    top: 20,
                    left: 0,
                    child: Container(
                      width: thumbPosition + (thumbWidth / 2),
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  // Circular thumb
                  Positioned(
                    left: thumbPosition,
                    top: 10,
                    child: Container(
                      width: thumbWidth,
                      height: thumbWidth,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9E9B64),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black87, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 2.0,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
