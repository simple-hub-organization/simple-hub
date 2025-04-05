// data class from _frame_helper.py in aioesphomeapi

/// aioesphomeapi:
/// cName = Packet
class Packet {
  /// Enter packet data
  Packet({required this.type, required this.data});

  int type;
  List<int> data; // bytes I think
}

/// aioesphomeapi:
/// cName = APIFrameHelper(ABC)
abstract class APIFrameHelper {
  /// aioesphomeapi:
  /// fName = close
  Future close();

  /// aioesphomeapi:
  /// fName = write_packet
  Future writePacket(Packet packet);

  /// aioesphomeapi:
  /// fName = read_packet
  Future<Packet> readPacket();
}

/// Class to handle ESPHome packets
/// aioesphomeapi:
/// cName = APIPlaintextFrameHelper
class EspApiPlaintextFrameHelper extends APIFrameHelper {
  dynamic reader;
  dynamic writer;
  dynamic writeLock;
  dynamic readLock;
  dynamic closedEvent;

  @override
  Future close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  /// aioesphomeapi:
  /// fName = write_packet
  @override
  Future writePacket(Packet packet) async {
    // List<int> data = utf8.encode('\0');
    // data.addAll(EspHomeUtil.varuintToBytes(packet.data));
  }

  @override
  Future<Packet> readPacket() {
    // TODO: implement readPacket
    throw UnimplementedError();
  }
}
