///  Save data about the device, is it remote or local, what pin/ip does it have
class DeviceInformation {
  DeviceInformation(this.uuid, this.name);

  ///  uuid of the device
  String uuid;

  ///  Name of the device
  String name;
}

class RemoteDevice extends DeviceInformation {
  RemoteDevice(super.uuid, super.name, this.ip);

  ///  Ip of the device
  String ip;

  //  Get

  String getIp() => ip;
}

class LocalDevice extends DeviceInformation {
  LocalDevice(super.uuid, super.name);
}
