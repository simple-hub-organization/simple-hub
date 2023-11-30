import 'package:cbj_integrations_controller/domain/room/room_entity.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cybear_jinni/application/lights/lights_watcher/lights_watcher_bloc.dart';
import 'package:cybear_jinni/presentation/atoms/atoms.dart';
import 'package:cybear_jinni/presentation/core/types_to_pass.dart';
import 'package:cybear_jinni/presentation/pages/device_full_screen_page/lights/widgets/critical_light_failure_display_widget.dart';
import 'package:cybear_jinni/presentation/pages/device_full_screen_page/lights/widgets/room_lights.dart';
import 'package:cybear_jinni/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';

class RoomsLightsWidget extends StatelessWidget {
  const RoomsLightsWidget({
    required this.roomEntity,
    required this.roomColorGradiant,
  });

  final RoomEntity roomEntity;
  final ListOfColors roomColorGradiant;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LightsWatcherBloc, LightsWatcherState>(
      builder: (context, state) {
        logger.t('Lights loadSuccess');

        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicatorAtom(),
          ),
          loadSuccess: (state) {
            if (state.devices.size != 0) {
              final Map<String, List<DeviceEntityAbstract>> tempDevicesByRooms =
                  <String, List<DeviceEntityAbstract>>{};

              /// Go on all the devices and find only the devices that exist
              /// in this room
              final String roomId = roomEntity.uniqueId.getOrCrash();
              for (final DeviceEntityAbstract? deviceEntityAbstract
                  in state.devices.iter) {
                if (deviceEntityAbstract == null) {
                  continue;
                }
                final int indexOfDeviceInRoom =
                    roomEntity.roomDevicesId.getOrCrash().indexWhere((element) {
                  return element == deviceEntityAbstract.uniqueId.getOrCrash();
                });
                if (indexOfDeviceInRoom != -1) {
                  if (tempDevicesByRooms[roomId] == null) {
                    tempDevicesByRooms[roomId] = [deviceEntityAbstract];
                  } else {
                    tempDevicesByRooms[roomId]!.add(deviceEntityAbstract);
                  }
                }
              }

              final List<KtList<DeviceEntityAbstract>> devicesByRooms = [];

              tempDevicesByRooms.forEach((k, v) {
                devicesByRooms.add(v.toImmutableList());
              });

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final List<Color> gradiantColor =
                        roomColorGradiant.listOfColors!;

                    final devicesInRoom = devicesByRooms[index];

                    return RoomLights(
                      devicesInRoom,
                      gradiantColor,
                      roomEntity.cbjEntityName.getOrCrash(),
                      maxLightsToShow: 50,
                    );
                  },
                  itemCount: devicesByRooms.length,
                ),
              );
            } else {
              return SingleChildScrollView(
                reverse: true,
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      alignment: Alignment.center,
                      child: const ImageAtom(
                        'assets/cbj_logo.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: TextAtom(
                        'Lights does not exist.',
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          loadFailure: (state) {
            return CriticalLightFailureDisplay(
              failure: state.devicesFailure,
            );
          },
          lightError: (LightError value) {
            return const TextAtom('Error');
          },
        );
      },
    );
  }
}
