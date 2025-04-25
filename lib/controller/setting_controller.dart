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
  final AudioPlayer _soundEffectPlayer = AudioPlayer();


  // SharedPreferences key
  static const String _musicKey = 'music_enabled';
  static const String _musicVolumeKey = 'music_volume';
  static const String _soundKey = 'sound_enabled';
  static const String _soundVolumeKey = 'sound_volume';


  // Observables with saved state
  late RxBool isMusicOn;
  late RxDouble musicVolume;

  late RxBool isSoundOn;
  late RxDouble soundVolume;

  void _setupAudio() async {
    try {
      await _setupBackgroundMusic();
      await _setupSoundPlayer();
    } catch (e) {
      debugPrint('Error setting up audio: $e');
    }
  }
  final AudioPlayer _soundPlayer = AudioPlayer();

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

  Future<void> _setupSound() async {
    try {
      await _soundPlayer.setReleaseMode(ReleaseMode.loop);
      await _soundPlayer.setPlayerMode(PlayerMode.mediaPlayer);
      await _soundPlayer.setVolume(soundVolume.value);

      await _soundPlayer.setSourceAsset('audio/sound.wav');

      if (isSoundOn.value) {
        await _soundPlayer.resume();
        debugPrint('🔁 Sound effect started in loop at ${(soundVolume.value * 100).toInt()}%');
      }
    } catch (e) {
      debugPrint('❌ Error setting up sound: $e');
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

  void toggleSound() {
    isSoundOn.value = !isSoundOn.value;
    sharedPreferences.setBool(_soundKey, isSoundOn.value);

    if (isSoundOn.value) {
      _soundPlayer.resume();
      debugPrint('🎶 Sound turned ON, volume: ${(soundVolume.value * 100).toInt()}%');
    } else {
      _soundPlayer.pause();
      debugPrint('🔇 Sound turned OFF');
    }
  }

  void setSoundVolume(double value) {
    soundVolume.value = value;
    sharedPreferences.setDouble(_soundVolumeKey, value);
    _soundPlayer.setVolume(value);

    if (isSoundOn.value) {
      _soundPlayer.resume();
    }

    debugPrint('🔊 setSoundVolume: ${(value * 100).toInt()}%');
  }


  void playSoundEffect(String assetPath) async {
    if (!isSoundOn.value) return;

    try {
      await _soundEffectPlayer.stop(); // optional: stop previous sound
      await _soundEffectPlayer.setSourceAsset(assetPath);
      await _soundEffectPlayer.resume();
      debugPrint('🔊 Playing sound: $assetPath');
    } catch (e) {
      debugPrint('Error playing sound effect: $e');
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

  Future<void> _setupSoundPlayer() async {
    try {
      await _soundEffectPlayer.setPlayerMode(PlayerMode.lowLatency);
      await _soundEffectPlayer.setVolume(soundVolume.value);
    } catch (e) {
      debugPrint('Error setting up sound player: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();

    // Load saved settings with reasonable defaults
    isMusicOn = RxBool(sharedPreferences.getBool(_musicKey) ?? false);
    musicVolume = RxDouble(sharedPreferences.getDouble(_musicVolumeKey) ?? 0.7);

    isSoundOn = RxBool(sharedPreferences.getBool(_soundKey) ?? true);
    soundVolume = RxDouble(sharedPreferences.getDouble(_soundVolumeKey) ?? 0.7);

    debugPrint('Music settings initialized:');
    debugPrint('- Music: ${isMusicOn.value ? "ON" : "OFF"} (${(musicVolume.value * 100).toInt()}%)');
    debugPrint('Sound: ${isSoundOn.value ? "ON" : "OFF"} (${(soundVolume.value * 100).toInt()}%)');

    // Use Future.delayed to prevent immediate async calls in onInit
    Future.delayed(Duration.zero, () {
      _setupAudio();
      _setupSound();
    });
  }

  @override
  void onClose() {
    _backgroundMusicPlayer.dispose();
    _soundPlayer.dispose();
    super.onClose();
  }
}