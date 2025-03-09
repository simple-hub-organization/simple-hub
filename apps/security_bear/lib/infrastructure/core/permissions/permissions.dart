///  This class save the state of each permission
class Permission {
  Permission({required this.read, required this.write, required this.execute});

  bool read = false;
  bool write = false;
  bool execute = false;

  //  Getters

  bool getRead() => read;

  bool getWrite() => write;

  bool getExecute() => execute;
}
