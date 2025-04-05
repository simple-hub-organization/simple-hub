import 'dart:io';

///  Get Ip info
Future<String?> getIps() async {
  for (final NetworkInterface interface in await NetworkInterface.list()) {
//      print('== Interface: ${interface.name} ==');
    for (final InternetAddress address in interface.addresses) {
//        print(
//            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
      return address.address;
    }
  }
  return null;
}
