import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:cbj_smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:cbj_smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:cbj_smart_device/utils.dart';

///  This class take the request to turn up or down the blinds and act in safe manner with the pins, act so that blinds up and down will not work simultaneously and stop other tasks on them
class BlindsWishU {
  static Future<String> blindsUp(BlindsObject blindsInformation) async {
    String status;
    logger.i('Turning blind up');

    if (blindsInformation.blindsUpPin == null ||
        blindsInformation.blindsDownPin == null) {
      logger.i('Blinds pin was not set');
      return 'Failed';
    }

    blindsInformation.blindsDownPin?.onDuration = 0;
    status = OffWishU.setOff(
      blindsInformation.deviceInformation,
      blindsInformation.blindsDownPin,
    );

    await Future.delayed(const Duration(seconds: 1));

    blindsInformation.blindsUpPin?.onDuration = -1;

    status +=
        ' ${OnWishU.setOn(blindsInformation.deviceInformation, blindsInformation.blindsUpPin)}';

    blindsInformation.blindsDownPin?.onDuration = 0;
    OffWishU.setOff(
      blindsInformation.deviceInformation,
      blindsInformation.blindsDownPin,
    );

    return status;
  }

  static Future<String> blindsDown(BlindsObject blindsInformation) async {
    String status;
    // In case the pin was not set
    logger.i('Turning blind Down');

    if (blindsInformation.blindsUpPin == null ||
        blindsInformation.blindsDownPin == null) {
      logger.i('Blinds pin was not set');
      return 'Failed';
    }

    blindsInformation.blindsUpPin?.onDuration = 0;
    status = OffWishU.setOff(
      blindsInformation.deviceInformation,
      blindsInformation.blindsUpPin,
    );

    await Future.delayed(const Duration(seconds: 1));

    blindsInformation.blindsDownPin?.onDuration = -1;
    status +=
        ' ${OnWishU.setOn(blindsInformation.deviceInformation, blindsInformation.blindsDownPin)}';

    blindsInformation.blindsUpPin?.onDuration = 0;
    OffWishU.setOff(
      blindsInformation.deviceInformation,
      blindsInformation.blindsUpPin,
    );

    return status;
  }

  static Future<String> blindsStop(BlindsObject blindsInformation) {
    String status;

    logger.i('Stop blinds');

    if (blindsInformation.blindsUpPin == null ||
        blindsInformation.blindsDownPin == null) {
      logger.i('Blinds pin was not set');
      return Future<String>.value('Failed');
    }

    blindsInformation.blindsUpPin?.onDuration = 0;
    status = OffWishU.setOff(
      blindsInformation.deviceInformation,
      blindsInformation.blindsUpPin,
    );

    blindsInformation.blindsDownPin?.onDuration = 0;
    status +=
        ' ${OffWishU.setOff(blindsInformation.deviceInformation, blindsInformation.blindsDownPin)}';

    return Future<String>.value(status);
  }
}
