// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/simple_devices/smart_camera_object.dart';
import 'package:cbj_smart_device/application/usecases/smart_server_u/smart_server_u.dart';
import 'package:cbj_smart_device/core/my_singleton.dart';
import 'package:cbj_smart_device/utils.dart';
import 'package:cbj_smart_device_flutter/presentation/server/camera_stram.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:uuid/uuid.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

/// Camera example home widget.
class CameraExampleHome extends StatefulWidget {
  /// Default Constructor
  const CameraExampleHome({super.key});

  @override
  State<CameraExampleHome> createState() {
    return _CameraExampleHomeState();
  }
}

class _CameraExampleHomeState extends State<CameraExampleHome>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  List<CameraDescription>? cameras;

  CameraController? controller;
  XFile? imageFile;
  XFile? videoFile;
  VoidCallback? videoPlayerListener;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;
  late AnimationController _exposureModeControlRowAnimationController;
  late Animation<double> _exposureModeControlRowAnimation;
  late AnimationController _streamQualityModeControlRowAnimationController;
  late Animation<double> _streamQualityModeControlRowAnimation;
  late AnimationController _focusModeControlRowAnimationController;
  late Animation<double> _focusModeControlRowAnimation;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;

  CbjSmartDeviceServerU? smartServerUseCase;

  double _currentScale = 1.0;
  double _baseScale = 1.0;

  // Counting pointers (number of user fingers on screen)
  int _pointers = 0;
  bool sendPictures = true;

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    WidgetsBinding.instance.addObserver(this);
    if (Platform.isAndroid || Platform.isIOS) {
      availableCameras().then((value) {
        if (!mounted) {
          return;
        }
        setState(() {
          cameras = value;
        });
        smartServerUseCase = CbjSmartDeviceServerU();
        final String uuId = const Uuid().v1();
        MySingleton()
            .addToSmartDevicesList(SmartCameraObject(uuId, 'Security Camera'));
        smartServerUseCase!.startLocalServer().then((value) async {
          if (cameras!.isEmpty) {
            return;
          }
          await onNewCameraSelected(cameras![0]);
        });
      });
    }

    _exposureModeControlRowAnimationController = basicAnimation;
    _exposureModeControlRowAnimation =
        getCurvedAnimation(parent: _exposureModeControlRowAnimationController);

    _streamQualityModeControlRowAnimationController = basicAnimation;
    _streamQualityModeControlRowAnimation = getCurvedAnimation(
        parent: _streamQualityModeControlRowAnimationController);

    _focusModeControlRowAnimationController = basicAnimation;
    _focusModeControlRowAnimation =
        getCurvedAnimation(parent: _focusModeControlRowAnimationController);
  }

  AnimationController get basicAnimation => AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      );

  CurvedAnimation getCurvedAnimation({required AnimationController parent}) =>
      CurvedAnimation(parent: parent, curve: Curves.easeInCubic);

  @override
  void dispose() {
    sendPictures = false;
    WidgetsBinding.instance.removeObserver(this);
    controller?.dispose();
    controller = null;
    smartServerUseCase?.dispose();
    WakelockPlus.disable();

    super.dispose();
  }

  // #docregion AppLifecycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (controller == null || !controller!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      controller!.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCameraController(controller!.description);
    }
  }

  Future<Uint8List?> takePicture() async {
    if (controller == null || !controller!.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (controller!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }
    Uint8List uint8list;

    try {
      XFile xfile = await controller!.takePicture();

      uint8list = await xfile.readAsBytes();
      File image = File(xfile.path);
      await image.delete();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    return uint8list;
  }

  Future<Uint8List?> getImageBytes() async {
    if (controller == null || !controller!.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    final completer = Completer<CameraImage>();
    await controller!
        .startImageStream(completer.complete)
        .then((_) => controller!.stopImageStream());
    final Uint8List image = await controller!.inMemoryImage;
    return image;
  }

  void onTakePicture() async {
    while (true && sendPictures) {
      Uint8List? uint8list = await takePicture();
      if (uint8list == null) {
        return;
      }

      logger.i('unit8List size ${uint8list.length}');
      SmartDeviceServerRequestsToSmartDeviceClient.steam.sink.add(
          CbjRequestsAndStatusFromHub(
              allRemoteCommands: CbjAllRemoteCommands(
                  smartDeviceInfo:
                      CbjSmartDeviceInfo(stateMassage: uint8list.toString()))));
    }
  }

  // #enddocregion AppLifecycle

  @override
  Widget build(BuildContext context) {
    if (cameras == null) {
      return const Text('Cameras are null');
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: controller != null && controller!.value.isRecordingVideo
                    ? Colors.redAccent
                    : Colors.grey,
                width: 3.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Center(
                child: _cameraPreviewWidget(),
              ),
            ),
          ),
        ),
        _modeControlRowWidget(),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              _cameraTogglesRowWidget(),
            ],
          ),
        ),
      ],
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller!.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      // return CameraPreviewPage(
      //     cameraController: controller!, onTakePicture: onTakePicture);

      return Listener(
        onPointerDown: (_) => _pointers++,
        onPointerUp: (_) => _pointers--,
        child: CameraPreview(
          controller!,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onScaleStart: _handleScaleStart,
              onScaleUpdate: _handleScaleUpdate,
              onTapDown: (TapDownDetails details) =>
                  onViewFinderTap(details, constraints),
            );
          }),
        ),
      );
    }
  }

  /// Display a bar with buttons to change the flash and exposure modes
  Widget _modeControlRowWidget() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // The exposure and focus mode are currently not supported on the web.
            ...!kIsWeb
                ? <Widget>[
                    IconButton(
                      icon: const Icon(Icons.high_quality),
                      color: Colors.blue,
                      onPressed:
                          controller != null ? onChangeImageQualityMode : null,
                    ),
                    IconButton(
                      icon: const Icon(Icons.exposure),
                      color: Colors.blue,
                      onPressed: controller != null ? onExposureMode : null,
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_center_focus),
                      color: Colors.blue,
                      onPressed: controller != null ? onFocusMode : null,
                    )
                  ]
                : <Widget>[],
            IconButton(
              icon: Icon(controller?.value.isCaptureOrientationLocked ?? false
                  ? Icons.screen_lock_rotation
                  : Icons.screen_rotation),
              color: Colors.blue,
              onPressed: controller != null ? onCaptureOrientationLock : null,
            ),
          ],
        ),
        _exposureModeControlRowWidget(),
        _focusModeControlRowWidget(),
        _streamQualityModeControlRowWidget(),
      ],
    );
  }

  Widget _exposureModeControlRowWidget() {
    final ButtonStyle styleAuto = TextButton.styleFrom(
      foregroundColor: controller?.value.exposureMode == ExposureMode.auto
          ? Colors.orange
          : Colors.blue,
    );
    final ButtonStyle styleLocked = TextButton.styleFrom(
      foregroundColor: controller?.value.exposureMode == ExposureMode.locked
          ? Colors.orange
          : Colors.blue,
    );

    return SizeTransition(
      sizeFactor: _exposureModeControlRowAnimation,
      child: ClipRect(
        child: Container(
          color: Colors.grey.shade50,
          child: Column(
            children: <Widget>[
              const Center(
                child: Text('Exposure Mode'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    style: styleAuto,
                    onPressed: controller != null
                        ? () =>
                            onSetExposureModeButtonPressed(ExposureMode.auto)
                        : null,
                    onLongPress: () {
                      if (controller != null) {
                        controller!.setExposurePoint(null);
                        showInSnackBar('Resetting exposure point');
                      }
                    },
                    child: const Text('AUTO'),
                  ),
                  TextButton(
                    style: styleLocked,
                    onPressed: controller != null
                        ? () =>
                            onSetExposureModeButtonPressed(ExposureMode.locked)
                        : null,
                    child: const Text('LOCKED'),
                  ),
                  TextButton(
                    style: styleLocked,
                    onPressed: controller != null
                        ? () => controller!.setExposureOffset(0.0)
                        : null,
                    child: const Text('RESET OFFSET'),
                  ),
                ],
              ),
              const Center(
                child: Text('Exposure Offset'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(_minAvailableExposureOffset.toString()),
                  Slider(
                    value: _currentExposureOffset,
                    min: _minAvailableExposureOffset,
                    max: _maxAvailableExposureOffset,
                    label: _currentExposureOffset.toString(),
                    onChanged: _minAvailableExposureOffset ==
                            _maxAvailableExposureOffset
                        ? null
                        : setExposureOffset,
                  ),
                  Text(_maxAvailableExposureOffset.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _streamQualityModeControlRowWidget() {
    return SizeTransition(
      sizeFactor: _streamQualityModeControlRowAnimation,
      child: ClipRect(
        child: Container(
          color: Colors.grey.shade50,
          child: Column(
            children: <Widget>[
              const Center(
                child: Text('Stream Quality'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          controller?.resolutionPreset == ResolutionPreset.low
                              ? Colors.orange
                              : Colors.blue,
                    ),
                    onPressed: controller != null
                        ? () => onNewCameraSelected(controller!.description,
                            resolutionPreset: ResolutionPreset.low)
                        : null,
                    child: const Text('low'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: controller?.resolutionPreset ==
                              ResolutionPreset.medium
                          ? Colors.orange
                          : Colors.blue,
                    ),
                    onPressed: controller != null
                        ? () => onNewCameraSelected(controller!.description,
                            resolutionPreset: ResolutionPreset.medium)
                        : null,
                    child: const Text('medium'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          controller?.resolutionPreset == ResolutionPreset.high
                              ? Colors.orange
                              : Colors.blue,
                    ),
                    onPressed: controller != null
                        ? () => onNewCameraSelected(controller!.description,
                            resolutionPreset: ResolutionPreset.high)
                        : null,
                    child: const Text('high'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: controller?.resolutionPreset ==
                              ResolutionPreset.veryHigh
                          ? Colors.orange
                          : Colors.blue,
                    ),
                    onPressed: controller != null
                        ? () => onNewCameraSelected(controller!.description,
                            resolutionPreset: ResolutionPreset.veryHigh)
                        : null,
                    child: const Text('very high'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _focusModeControlRowWidget() {
    final ButtonStyle styleAuto = TextButton.styleFrom(
      foregroundColor: controller?.value.focusMode == FocusMode.auto
          ? Colors.orange
          : Colors.blue,
    );
    final ButtonStyle styleLocked = TextButton.styleFrom(
      foregroundColor: controller?.value.focusMode == FocusMode.locked
          ? Colors.orange
          : Colors.blue,
    );

    return SizeTransition(
      sizeFactor: _focusModeControlRowAnimation,
      child: ClipRect(
        child: Container(
          color: Colors.grey.shade50,
          child: Column(
            children: <Widget>[
              const Center(
                child: Text('Focus Mode'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    style: styleAuto,
                    onPressed: controller != null
                        ? () => onSetFocusModeButtonPressed(FocusMode.auto)
                        : null,
                    onLongPress: () {
                      if (controller != null) {
                        controller!.setFocusPoint(null);
                      }
                      showInSnackBar('Resetting focus point');
                    },
                    child: const Text('AUTO'),
                  ),
                  TextButton(
                    style: styleLocked,
                    onPressed: controller != null
                        ? () => onSetFocusModeButtonPressed(FocusMode.locked)
                        : null,
                    child: const Text('LOCKED'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns a suitable camera icon for [direction].
  IconData getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
    }
    // This enum is from a different package, so a new value could be added at
    // any time. The example should keep working if that happens.
    // ignore: dead_code
    return Icons.camera;
  }

  void _logError(String code, String? message) {
    // ignore: avoid_print
    print('Error: $code${message == null ? '' : '\nError Message: $message'}');
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    final List<Widget> toggles = <Widget>[];

    if (cameras!.isEmpty) {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        showInSnackBar('No camera found.');
      });
      return const Text('None');
    } else {
      for (final CameraDescription cameraDescription in cameras!) {
        toggles.add(
          SizedBox(
            width: 90.0,
            child: RadioListTile<CameraDescription>(
              title: Icon(getCameraLensIcon(cameraDescription.lensDirection)),
              groupValue: controller?.description,
              value: cameraDescription,
              onChanged: onNewCameraSelected,
            ),
          ),
        );
      }
    }

    return Row(children: toggles);
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    controller!.setExposurePoint(offset);
    controller!.setFocusPoint(offset);
  }

  Future onNewCameraSelected(CameraDescription? cameraDescription,
      {ResolutionPreset resolutionPreset = ResolutionPreset.medium}) async {
    if (cameraDescription == null) {
      return;
    }
    sendPictures = false;

    await _initializeCameraController(cameraDescription,
        resolutionPreset: resolutionPreset);

    sendPictures = true;
    onTakePicture();
  }

  Future _initializeCameraController(CameraDescription cameraDescription,
      {ResolutionPreset resolutionPreset = ResolutionPreset.medium}) async {
    controller = CameraController(
      cameraDescription,
      resolutionPreset,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // If the controller is updated then update the UI.
    controller!.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller!.value.hasError) {
        showInSnackBar('Camera error ${controller!.value.errorDescription}');
      }
    });

    try {
      await controller!.initialize();

      await Future.wait(<Future<Object?>>[
        // The exposure mode is currently not supported on the web.
        ...!kIsWeb
            ? <Future<Object?>>[
                controller!.getMinExposureOffset().then(
                    (double value) => _minAvailableExposureOffset = value),
                controller!
                    .getMaxExposureOffset()
                    .then((double value) => _maxAvailableExposureOffset = value)
              ]
            : <Future<Object?>>[],
        controller!
            .getMaxZoomLevel()
            .then((double value) => _maxAvailableZoom = value),
        controller!
            .getMinZoomLevel()
            .then((double value) => _minAvailableZoom = value),
        controller!.setDescription(cameraDescription),
      ]);
      await controller!.setFlashMode(FlashMode.off);
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          showInSnackBar('You have denied camera access.');
          break;
        case 'CameraAccessDeniedWithoutPrompt':
          // iOS only
          showInSnackBar('Please go to Settings app to enable camera access.');
          break;
        case 'CameraAccessRestricted':
          // iOS only
          showInSnackBar('Camera access is restricted.');
          break;
        case 'AudioAccessDenied':
          showInSnackBar('You have denied audio access.');
          break;
        case 'AudioAccessDeniedWithoutPrompt':
          // iOS only
          showInSnackBar('Please go to Settings app to enable audio access.');
          break;
        case 'AudioAccessRestricted':
          // iOS only
          showInSnackBar('Audio access is restricted.');
          break;
        default:
          _showCameraException(e);
          break;
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future onChangeImageQualityMode() async {
    if (_streamQualityModeControlRowAnimationController.value == 1) {
      _streamQualityModeControlRowAnimationController.reverse();
    } else {
      if (_exposureModeControlRowAnimationController.value == 1) {
        await _exposureModeControlRowAnimationController.reverse();
      } else if (_focusModeControlRowAnimationController.value == 1) {
        await _focusModeControlRowAnimationController.reverse();
      }
      _streamQualityModeControlRowAnimationController.forward();
    }
  }

  Future onExposureMode() async {
    if (_exposureModeControlRowAnimationController.value == 1) {
      _exposureModeControlRowAnimationController.reverse();
    } else {
      if (_focusModeControlRowAnimationController.value == 1) {
        await _focusModeControlRowAnimationController.reverse();
      } else if (_streamQualityModeControlRowAnimationController.value == 1) {
        await _streamQualityModeControlRowAnimationController.reverse();
      }
      _exposureModeControlRowAnimationController.forward();
    }
  }

  Future onFocusMode() async {
    if (_focusModeControlRowAnimationController.value == 1) {
      _focusModeControlRowAnimationController.reverse();
    } else {
      if (_exposureModeControlRowAnimationController.value == 1) {
        await _exposureModeControlRowAnimationController.reverse();
      } else if (_streamQualityModeControlRowAnimationController.value == 1) {
        await _streamQualityModeControlRowAnimationController.reverse();
      }
      _focusModeControlRowAnimationController.forward();
    }
  }

  Future onCaptureOrientationLock() async {
    try {
      if (controller != null) {
        if (controller!.value.isCaptureOrientationLocked) {
          await controller!.unlockCaptureOrientation();
          showInSnackBar('Capture orientation unlocked');
        } else {
          await controller!.lockCaptureOrientation();
          showInSnackBar(
              'Capture orientation locked to ${controller!.value.lockedCaptureOrientation.toString().split('.').last}');
        }
      }
    } on CameraException catch (e) {
      _showCameraException(e);
    }
  }

  void onSetExposureModeButtonPressed(ExposureMode mode) {
    setExposureMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      showInSnackBar('Exposure mode set to ${mode.toString().split('.').last}');
    });
  }

  void onSetFocusModeButtonPressed(FocusMode mode) {
    setFocusMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      showInSnackBar('Focus mode set to ${mode.toString().split('.').last}');
    });
  }

  Future setExposureMode(ExposureMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setExposureMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future setExposureOffset(double offset) async {
    if (controller == null) {
      return;
    }

    setState(() {
      _currentExposureOffset = offset;
    });
    try {
      offset = await controller!.setExposureOffset(offset);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future setFocusMode(FocusMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setFocusMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  Future _handleScaleUpdate(ScaleUpdateDetails details) async {
    // When there are not exactly two fingers on screen don't scale
    if (controller == null || _pointers != 2) {
      return;
      // return Listener(
      //   onPointerDown: (_) => _pointers++,
      //   onPointerUp: (_) => _pointers--,
      //   child: CameraPreview(
      //     controller!,
      //     child: LayoutBuilder(
      //         builder: (BuildContext context, BoxConstraints constraints) {
      //       return GestureDetector(
      //         behavior: HitTestBehavior.opaque,
      //         onScaleStart: _handleScaleStart,
      //         onScaleUpdate: _handleScaleUpdate,
      //         onTapDown: (TapDownDetails details) =>
      //             onViewFinderTap(details, constraints),
      //       );
      //     }),
      //   ),
      // );
    }

    _currentScale = (_baseScale * details.scale)
        .clamp(_minAvailableZoom, _maxAvailableZoom);

    await controller!.setZoomLevel(_currentScale);
  }
}
