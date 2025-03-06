///  This class save the state of each permission
class Permission {
  Permission(this._read, this._write, this._execute);

  bool _read = false;
  bool _write = false;
  bool _execute = false;

  //  Getters

  bool getRead() => _read;

  bool getWrite() => _write;

  bool getExecute() => _execute;

  //  TODO: check if user have permissions to change permissions

  //  Setters

  void setRead(bool read) => _read = read;

  void setWrite(bool write) => _write = write;

  void setExecute(bool execute) => _execute = execute;
}
