import 'package:cricket_go/controller/setting_controller.dart';
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/utils/values/style.dart';
import 'package:cricket_go/view/widgets/custom_button.dart';
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
                      color: const Color.fromRGBO(115, 119, 131, 1),
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
                                onVolumeChanged: controller.setMusicVolume,
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
                          Obx(() => Text(
                            "${(controller.soundVolume.value * 100).toInt()}",
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
                                onVolumeChanged: controller.setSoundVolume,
                                volumeValue: controller.soundVolume,
                                onActivate: () {
                                  if (!controller.isSoundOn.value) {
                                    controller.toggleSound();
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
                    ],
                  ),
                  50.sbh,
                  CustomButton(
                    height: 40.0,
                    width: 120.0,
                    text: "Back",
                    fontSize: 12,
                    onPressed: () => Get.back(),
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
          // Calculate new volume immediately
          final dx = localPosition.dx.clamp(0.0, barWidth);
          final newVolume = dx / barWidth;

          // Apply volume change first - this gives immediate feedback
          onVolumeChanged(newVolume);

          // Then activate if needed
          onActivate();
        }

        return GestureDetector(
          // Optimize gesture detection for better responsiveness
          behavior: HitTestBehavior.opaque,  // Ensures all taps are captured
          onHorizontalDragStart: (details) {
            _handleInteraction(details.localPosition);
          },
          onHorizontalDragUpdate: (details) {
            _handleInteraction(details.localPosition);
          },
          onTapDown: (details) {
            _handleInteraction(details.localPosition);
          },
          onTapUp: (details) {
            _handleInteraction(details.localPosition);
          },
          onVerticalDragStart: (details) {
            final localPos = Offset(details.localPosition.dx, 0);
            _handleInteraction(localPos);
          },
          onVerticalDragUpdate: (details) {
            final localPos = Offset(details.localPosition.dx, 0);
            _handleInteraction(localPos);
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
                      color: Color.fromRGBO(175, 222, 229, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  // Filled part of the bar
                  Positioned(
                    top: 20,
                    left: 0,
                    child: Container(
                      width: thumbPosition + (thumbWidth / 2),
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(72, 72, 170, 0.3),
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
                        color: Color.fromRGBO(72, 72, 170, 1),
                        shape: BoxShape.circle,
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