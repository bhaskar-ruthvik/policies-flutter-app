import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

const pathToSaveAudio = 'my_audio.aac';

class SoundRecorder {
  AudioRecorder? recorder;
  bool isRecording = false;
  bool _isRecorderInitialised = false;

  Future init() async {
    recorder = AudioRecorder();
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      print('Microphone permission not granted');
      return;
    }
    _isRecorderInitialised = true;
  }

  void dispose() {
    if (!_isRecorderInitialised) return;

    //recorder!.closeAudioSession();
    recorder = null;

    _isRecorderInitialised = false;
  }

  Future<void> _record(String filePath) async {
    if (!_isRecorderInitialised) return;
    await recorder?.start(const RecordConfig(),
        path: filePath); // Start recording and save to filePath
    isRecording = true;
  }

  Future<String?> _stop() async {
    if (!_isRecorderInitialised) return null;

    if (recorder != null && await recorder!.isRecording()) {
      final path = await recorder?.stop();
      isRecording = false;
      return path;
    } else {
      print("Track was not started or already stopped.");
      return null;
    }
  }

  Future toggleRecording(String filePath) async {
    if (isRecording) {
      return await _stop();
    } else {
      await _record(filePath);
      return null;
    }
  }
}
