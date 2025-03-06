/// keys to extract account information from the database
class AccountsInformationD {
  static String fireBaseProjectId = 'fireBaseProjectId';
  static String fireBaseApiKey = 'fireBaseApiKey';
  static String userEmail = 'userEmail';
  static String userPassword = 'userPassword';
  static String homeId = 'homeId';
}

/// firebase Account information
class FirebaseAccountsInformationD {
  FirebaseAccountsInformationD(
    this.fireBaseProjectId,
    this.fireBaseApiKey,
    this.userEmail,
    this.userPassword,
    this.homeId,
  );

  String fireBaseProjectId;
  String fireBaseApiKey;
  String userEmail;
  String userPassword;
  String homeId;

  bool areAllValuesNotNull() {
    return true;
  }
}
