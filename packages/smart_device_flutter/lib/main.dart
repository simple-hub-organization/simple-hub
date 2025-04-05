import 'dart:async';

import 'package:camera/camera.dart';
import 'package:smart_device_flutter/commands/flutter_commands.dart';
import 'package:smart_device_flutter/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_device/utils.dart';

Future main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    PhoneCommandsD();
    await getApplicationDocumentsDirectory();
  } on CameraException catch (e) {
    logger.i('${e.code} ${e.description}');
  }

  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    ),
  );
}
