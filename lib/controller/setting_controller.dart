import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  final SharedPreferences sharedPreferences;
  SettingController({required this.sharedPreferences});

  // Audio players
  final AudioPlayer _backgroundMusicPlayer = AudioPlayer();
  final AudioPlayer _soundEffectPlayer = AudioPlayer();
  final AudioPlayer _soundPlayer = AudioPlayer();

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

  // Debounce timer for smooth slider operations
  Timer? _debounceTimer;

  void _setupAudio() async {
    try {
      // Configure both audio players simultaneously for faster initialization
      await Future.wait([
        _setupBackgroundMusic(),
        _setupSoundPlayer(),
        _setupSound(),
      ]);
    } catch (e) {
      debugPrint('Error setting up audio: $e');
    }
  }

  Future<void> _setupBackgroundMusic() async {
    try {
      await _backgroundMusicPlayer.setReleaseMode(ReleaseMode.loop);
      // Use low latency mode for better responsiveness
      await _backgroundMusicPlayer.setPlayerMode(PlayerMode.lowLatency);

      // Preload the music asset
      await _backgroundMusicPlayer.setSourceAsset('audio/music.wav');
      await _backgroundMusicPlayer.setVolume(musicVolume.value);

      // Ensure it's paused initially
      await _backgroundMusicPlayer.pause();

      // Start playing only if needed
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
      // Use low latency mode for better responsiveness
      await _soundPlayer.setPlayerMode(PlayerMode.lowLatency);

      // Preload the sound asset
      await _soundPlayer.setSourceAsset('audio/sound.wav');
      await _soundPlayer.setVolume(soundVolume.value);

      // Ensure it's paused initially
      await _soundPlayer.pause();

      // Start playing only if needed
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

    if (isMusicOn.value) {
      // Pause sound when music starts
      _soundPlayer.pause();
      isSoundOn.value = false;

      // Start music immediately
      _backgroundMusicPlayer.resume();
      debugPrint('🎵 Music turned ON, volume: ${(musicVolume.value * 100).toInt()}%');
    } else {
      _backgroundMusicPlayer.pause();
      debugPrint('🎵 Music turned OFF');
    }

    // Save settings after audio operations
    sharedPreferences.setBool(_musicKey, isMusicOn.value);
    sharedPreferences.setBool(_soundKey, isSoundOn.value);
  }

  void toggleSound() {
    isSoundOn.value = !isSoundOn.value;

    if (isSoundOn.value) {
      // Pause music when sound starts
      _backgroundMusicPlayer.pause();
      isMusicOn.value = false;

      // Start sound immediately
      _soundPlayer.resume();
      debugPrint('🎶 Sound turned ON, volume: ${(soundVolume.value * 100).toInt()}%');
    } else {
      _soundPlayer.pause();
      debugPrint('🔇 Sound turned OFF');
    }

    // Save settings after audio operations
    sharedPreferences.setBool(_soundKey, isSoundOn.value);
    sharedPreferences.setBool(_musicKey, isMusicOn.value);
  }

  void setSoundVolume(double value) {
    // Apply volume change immediately for instant feedback
    _soundPlayer.setVolume(value);
    _soundEffectPlayer.setVolume(value);
    soundVolume.value = value;

    // If volume is turned up and sound isn't on, activate it
    if (value > 0.01) {
      // Only toggle other audio if we need to
      if (!isSoundOn.value || isMusicOn.value) {
        // Stop music if it's playing
        if (isMusicOn.value) {
          _backgroundMusicPlayer.pause();
          isMusicOn.value = false;
        }

        // Start sound if it's not playing
        if (!isSoundOn.value) {
          isSoundOn.value = true;
          _soundPlayer.resume();
        }

        debugPrint('🔊 Sound volume changed: ${(value * 100).toInt()}%');
      }
    } else if (isSoundOn.value) {
      // Handle volume near zero - pause playback
      _soundPlayer.pause();
      isSoundOn.value = false;
      debugPrint('🔇 Sound paused (volume zero)');
    }

    // Save settings with slight delay to prioritize audio response
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 50), () {
      sharedPreferences.setDouble(_soundVolumeKey, value);
      sharedPreferences.setBool(_soundKey, isSoundOn.value);
      sharedPreferences.setBool(_musicKey, isMusicOn.value);
    });
  }

  void playSoundEffect(String assetPath) async {
    if (!isSoundOn.value) return;

    try {
      await _soundEffectPlayer.stop(); // stop previous sound
      await _soundEffectPlayer.setSourceAsset(assetPath);
      await _soundEffectPlayer.setVolume(soundVolume.value);
      await _soundEffectPlayer.resume();
      debugPrint('🔊 Playing sound: $assetPath');
    } catch (e) {
      debugPrint('Error playing sound effect: $e');
    }
  }

  void setMusicVolume(double value) {
    // Apply volume change immediately for instant feedback
    _backgroundMusicPlayer.setVolume(value);
    musicVolume.value = value;

    // If volume is turned up and music isn't on, activate it
    if (value > 0.01) {
      // Only toggle other audio if we need to
      if (!isMusicOn.value || isSoundOn.value) {
        // Stop sound if it's playing
        if (isSoundOn.value) {
          _soundPlayer.pause();
          isSoundOn.value = false;
        }

        // Start music if it's not playing
        if (!isMusicOn.value) {
          isMusicOn.value = true;
          _backgroundMusicPlayer.resume();
        }

        debugPrint('🔊 Music volume changed: ${(value * 100).toInt()}%');
      }
    } else if (isMusicOn.value) {
      // Handle volume near zero - pause playback
      _backgroundMusicPlayer.pause();
      isMusicOn.value = false;
      debugPrint('🔇 Music paused (volume zero)');
    }

    // Save settings with slight delay to prioritize audio response
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 50), () {
      sharedPreferences.setDouble(_musicVolumeKey, value);
      sharedPreferences.setBool(_musicKey, isMusicOn.value);
      sharedPreferences.setBool(_soundKey, isSoundOn.value);
    });
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
    });
  }

  @override
  void onClose() {
    _debounceTimer?.cancel();
    _backgroundMusicPlayer.dispose();
    _soundPlayer.dispose();
    _soundEffectPlayer.dispose();
    super.onClose();
  }
}