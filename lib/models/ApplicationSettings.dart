import 'package:files_management_system/sqldb.dart';

/// [SettingsInterface] provide an interface and easy
/// access to the settings shared object.
class SettingsInterface{
  static ApplicationSettings? settings;

  /// if settings are initialized, return app settings
  /// if settings aren't initialized, initialize settings then return it.
  ApplicationSettings? getSettings (){
    settings ??= ApplicationSettings();
    return settings;
  }
}

/// An [ApplicationSettings] class store Settings in runtime
/// and fetch settings from the database
class ApplicationSettings{
  bool _cancelCheckBox = false;
  bool _deleteCheckBox = false;
  String? _scannerChoice;
  SqlDb sqlDb = SqlDb();

  Future<List> loadSettings() async{
    List<Map> response = await sqlDb.query("SELECT * FROM 'Settings'");
    if(response.isNotEmpty){
      setCancelCheckBox(response[0]['CancelCheckBox']);
      setDeleteCheckBox(response[0]['DeleteCheckBox']);
      setScannerChoice(response[0]['Scanner']);
    }
    return response;
  }

  bool getCancelCheckBox(){
    return _cancelCheckBox;
  }

  void setCancelCheckBox(int value) {
    _cancelCheckBox = value == 0? false : true;
  }

  bool getDeleteCheckBox(){
    return _deleteCheckBox;
  }

  void setDeleteCheckBox(int value) {
    _deleteCheckBox = value == 0? false : true;
  }

  String? getScannerChoice(){
    return _scannerChoice;
  }

  void setScannerChoice(String? value) {
    _scannerChoice = value;
  }
}