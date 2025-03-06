import 'package:http/http.dart';
import 'package:hue_dart/hue_dart.dart';

class PhilipsHueApiLight {
  PhilipsHueApiLight({
    required this.ipAdress,
    required this.username,
  }) {
    client = Client();
    bridge = Bridge(client, ipAdress, username);
  }

  final String ipAdress;
  final String username;
  late Client client;
  late Bridge bridge;

  Future<String> turnLightOn(String entityUniqueId) async {
    final List<Light> lights = await bridge.lights();

    for (final Light light in lights) {
      if (light.uniqueId != null && light.uniqueId == entityUniqueId) {
        final state = lightStateForColorOnly(light).rebuild(
          (s) => s..on = true,
        );
        await bridge.updateLightState(
          light.rebuild(
            (l) => l..state = state.toBuilder(),
          ),
        );
        return 'OK';
      }
    }
    return "Can't find device";
  }

  Future<String> turnLightOff(String deviceUniqId) async {
    final List<Light> lights = await bridge.lights();

    for (final Light light in lights) {
      if (light.uniqueId != null && light.uniqueId == deviceUniqId) {
        final state = lightStateForColorOnly(light).rebuild(
          (s) => s..on = false,
        );
        await bridge.updateLightState(
          light.rebuild(
            (l) => l..state = state.toBuilder(),
          ),
        );
        return 'OK';
      }
    }
    return "Can't find device";
  }

  Future<String> setLightBrightness(
    String entityUniqueId,
    int brightness,
  ) async {
    final List<Light> lights = await bridge.lights();

    for (final Light light in lights) {
      if (light.uniqueId != null && light.uniqueId == entityUniqueId) {
        final state = lightStateForColorOnly(light).rebuild(
          (s) => s..brightness = brightness,
        );
        await bridge.updateLightState(
          light.rebuild(
            (l) => l..state = state.toBuilder(),
          ),
        );
        return 'OK';
      }
    }
    return "Can't find device";
  }

  LightState lightStateForColorOnly(Light light) {
    LightState state;
    if (light.state!.colorMode == 'xy') {
      state = LightState((b) => b..xy = light.state!.xy!.toBuilder());
    } else if (light.state!.colorMode == 'ct') {
      state = LightState((b) => b..ct = light.state!.ct);
    } else {
      state = LightState(
        (b) => b
          ..hue = light.state!.hue
          ..saturation = light.state!.saturation
          ..brightness = light.state!.brightness,
      );
    }
    return state;
  }
}
