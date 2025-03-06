import 'dart:io';

import 'package:cbj_smart_device/utils.dart';

class PythonSpeechToText {
  PythonSpeechToText() {
    projectPath =
        '/home/guyl/Documents/programing/git/Smart-Home/SmartDevice/scripts/pythonScripts/voiceAssistance/';
  }

  String? projectPath;

  Future<ProcessResult> listenToVoiceCommand() async {
    logger.i('Start talking');
    await Future.delayed(const Duration(milliseconds: 3000));

    return await Process.run(
      '${projectPath!}venv/bin/python3',
      ['${projectPath!}main.py'],
    );
//        .then((ProcessResult results) { print(results.stdout.toString());});
  }
}
