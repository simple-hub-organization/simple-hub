///  This class save the state of each permission
class Permission {
  Permission(this.read, this.write, this.execute);

  bool read = false;
  bool write = false;
  bool execute = false;
}
