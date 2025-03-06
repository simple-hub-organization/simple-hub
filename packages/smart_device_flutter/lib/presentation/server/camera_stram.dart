import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension InMemoryImageFromCameraController on CameraController {
  Future<Uint8List> get inMemoryImage async {
    final completer = Completer<CameraImage>();
    await startImageStream(completer.complete);
    final image = await completer.future;
    await stopImageStream();
    final writeBuffer = WriteBuffer();
    for (final plane in image.planes) {
      writeBuffer.putUint8List(plane.bytes);
    }
    return writeBuffer.done().buffer.asUint8List();
  }
}

typedef InMemoryImage = Future<CameraImage> Function(CameraController);

typedef CameraControllerStore = ValueNotifier<CameraController>;

typedef CameraLifeCycleHandler = void Function(
  CameraControllerStore cameraControllerStore,
  AppLifecycleState appLifecycleState,
);

typedef BuildCameraLifeCycleHandler = CameraLifeCycleHandler Function(
  CameraDescription description,
  ResolutionPreset resolutionPreset,
);

extension FromCameraControllerStoreX on CameraControllerStore {
  CameraController get controller => value;
  CameraValue get camera => controller.value;
}

BuildCameraLifeCycleHandler kBuildCameraLifeCycleHandler =
    (description, resolutionPreset) =>
        (cameraControllerStore, appLifecycleState) {
          switch (appLifecycleState) {
            case AppLifecycleState.inactive:
              () {
                cameraControllerStore.controller.dispose();
              }();
              return;
            case AppLifecycleState.resumed:
              () {
                cameraControllerStore.value = CameraController(
                  description,
                  resolutionPreset,
                );
              }();
              return;
            default:
              return;
          }
        };

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: CameraInitializationWidget(),
      ),
    ),
  );
}

class CameraInitializationWidget extends StatelessWidget {
  const CameraInitializationWidget({super.key});

  @override
  Widget build(context) => FutureBuilder(
        future: availableCameras(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return CameraPreviewPage(
                cameraController: CameraController(
                  snapshot.data![0],
                  ResolutionPreset.low,
                  enableAudio: false,
                  imageFormatGroup: ImageFormatGroup.jpeg,
                ),
                onTakePicture: (Uint8List uint8list) {},
              );
            default:
              return const Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          }
        },
      );
}

class CameraPreviewPage extends StatefulWidget {
  /// Default Constructor
  const CameraPreviewPage(
      {super.key, required this.cameraController, required this.onTakePicture});

  final void Function(Uint8List uint8list) onTakePicture;
  final CameraController cameraController;

  @override
  State<CameraPreviewPage> createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage>
    with WidgetsBindingObserver {
  late final ValueNotifier<CameraController> _cameraControllerStore;
  late CameraLifeCycleHandler _cameraLifeCycleHandler;

  @override
  void didChangeAppLifecycleState(appLifecycleState) {
    if (_cameraControllerStore.camera.isInitialized) {
      return;
    }
    _cameraLifeCycleHandler(
      _cameraControllerStore,
      appLifecycleState,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _cameraControllerStore = ValueNotifier(
      CameraController(
        widget.cameraController.description,
        ResolutionPreset.low,
      ),
    );

    _cameraLifeCycleHandler = kBuildCameraLifeCycleHandler(
      widget.cameraController.description,
      ResolutionPreset.low,
    );
  }

  @override
  void dispose() {
    _cameraControllerStore.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(context) => ValueListenableBuilder(
        valueListenable: _cameraControllerStore,
        builder: (context, cameraController, child) => Scaffold(
          body: CameraPreviewWidget(
            cameraController: cameraController,
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.camera),
            onPressed: () async {
              // while (true) {
              try {
                widget.onTakePicture(await cameraController.inMemoryImage);
              } catch (e) {
                debugPrint('$e');
                return;
              }
              // }
            },
          ),
        ),
      );
}

class CameraPreviewWidget extends StatelessWidget {
  final CameraController cameraController;
  const CameraPreviewWidget({super.key, required this.cameraController});

  @override
  Widget build(context) => Center(
        child: cameraController.value.isInitialized
            ? CameraPreview(cameraController)
            : FutureBuilder(
                future: cameraController.initialize(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return CameraPreview(cameraController);
                    default:
                      return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
      );
}
