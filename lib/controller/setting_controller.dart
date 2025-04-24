/*
      ---------------------------------------
      Project: Stumped Game Mobile Application
          Date: April 11, 2024
      Author: Ameer from Pakistan
      ---------------------------------------
      Description: Setting controller
    */
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  final SharedPreferences sharedPreferences;
  SettingController({required this.sharedPreferences});

  // Audio player
  final AudioPlayer _backgroundMusicPlayer = AudioPlayer();

  // SharedPreferences key
  static const String _musicKey = 'music_enabled';
  static const String _musicVolumeKey = 'music_volume';

  // Observables with saved state
  late RxBool isMusicOn;
  late RxDouble musicVolume;

  void _setupAudio() async {
    try {
      await _setupBackgroundMusic();
    } catch (e) {
      debugPrint('Error setting up audio: $e');
    }
  }

  Future<void> _setupBackgroundMusic() async {
    try {
      await _backgroundMusicPlayer.setReleaseMode(ReleaseMode.loop);
      await _backgroundMusicPlayer.setPlayerMode(PlayerMode.mediaPlayer);

      await _backgroundMusicPlayer
          .setSourceAsset('audio/music.wav')
          .timeout(const Duration(seconds: 5));

      await _backgroundMusicPlayer.setVolume(musicVolume.value);

      if (isMusicOn.value) {
        await _backgroundMusicPlayer.resume();
        debugPrint('🎵 Background music started at volume: ${(musicVolume.value * 100).toInt()}%');
      }
    } catch (e) {
      debugPrint('Error setting up background music: $e');
    }
  }

  void toggleMusic() {
    isMusicOn.value = !isMusicOn.value;
    sharedPreferences.setBool(_musicKey, isMusicOn.value);

    if (isMusicOn.value) {
      _backgroundMusicPlayer.resume();
      debugPrint('🎵 Music turned ON, volume: ${(musicVolume.value * 100).toInt()}%');
    } else {
      _backgroundMusicPlayer.pause();
      debugPrint('🎵 Music turned OFF');
    }
  }

  void setMusicVolume(double value) {
    musicVolume.value = value;
    sharedPreferences.setDouble(_musicVolumeKey, value);
    _backgroundMusicPlayer.setVolume(value);

    // Only update play state if already enabled
    if (isMusicOn.value) {
      _backgroundMusicPlayer.resume();
    }

    debugPrint('🔊 setMusicVolume: ${(value * 100).toInt()}%');
  }

  @override
  void onInit() {
    super.onInit();

    // Load saved settings with reasonable defaults
    isMusicOn = RxBool(sharedPreferences.getBool(_musicKey) ?? false);
    musicVolume = RxDouble(sharedPreferences.getDouble(_musicVolumeKey) ?? 0.7);

    debugPrint('Music settings initialized:');
    debugPrint('- Music: ${isMusicOn.value ? "ON" : "OFF"} (${(musicVolume.value * 100).toInt()}%)');

    // Use Future.delayed to prevent immediate async calls in onInit
    Future.delayed(Duration.zero, () {
      _setupAudio();
    });
  }

  @override
  void onClose() {
    _backgroundMusicPlayer.dispose();
    super.onClose();
  }
}