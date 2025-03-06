import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cybearjinni/domain/cbj_comp/cbj_comp_entity.dart';
import 'package:cybearjinni/domain/cbj_comp/cbj_comp_failures.dart';
import 'package:cybearjinni/domain/cbj_comp/cbj_comp_value_objects.dart';
import 'package:cybearjinni/domain/cbj_comp/i_cbj_comp_repository.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';

/// Show light toggles in a container with the background color from smart area
/// object
class ScanForNewCBJCompsWidget extends StatefulWidget {
  @override
  State<ScanForNewCBJCompsWidget> createState() =>
      _ScanForNewCBJCompsWidgetState();
}

class _ScanForNewCBJCompsWidgetState extends State<ScanForNewCBJCompsWidget> {
  StreamSubscription<dartz.Either<CbjCompFailure, String>>?
      _cbjCompStreamSubscription;

  @override
  void initState() {
    super.initState();
    _watchAllStarted();
  }

  Future _watchAllStarted() async {
    await _cbjCompStreamSubscription?.cancel();
    _cbjCompStreamSubscription = ICbjCompRepository.instance
        .getConnectedComputersIP()
        .listen((failureOrCBJCompList) {
      final dynamic failureOrCompListDynamic = failureOrCBJCompList.fold(
        (f) => f,
        (ip) => ip,
      );

      if (failureOrCompListDynamic == CbjCompFailure) {
      } else {
        _compDevicesReceived(failureOrCBJCompList);
      }
    });
  }

  Future _compDevicesReceived(
    dartz.Either<CbjCompFailure, String> failureOrCBJCompList,
  ) async {
    final dynamic failureOrCompListDynamic = failureOrCBJCompList.fold(
      (f) => f,
      (ip) => ip,
    );

    if (failureOrCompListDynamic == CbjCompFailure) {
    } else {
      final String ipAsString = failureOrCompListDynamic as String;
      routeToConfigure(ipAsString);
    }
  }

  void routeToConfigure(String ipAsString) {
    final CbjCompEntity compEntity = CbjCompEntity.empty().copyWith(
      lastKnownIp: CbjCompLastKnownIp(ipAsString),
    );

    context.router.replace(
      ConfigureNewCbjCompRoute(cbjCompEntity: compEntity),
    );
  }

  @override
  Future dispose() async {
    await _cbjCompStreamSubscription?.cancel();
    await ICbjCompRepository.instance.shutdownServer();
    return super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextAtom(
          'Scanning For Devices',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge!.color,
            fontSize: 26,
          ),
        ),
        const Expanded(
          child: Center(
            child: CircularProgressIndicatorAtom(),
          ),
        ),
      ],
    );
  }
}
