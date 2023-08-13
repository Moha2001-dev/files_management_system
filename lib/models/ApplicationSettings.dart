import 'package:files_management_system/sqldb.dart';

class ApplicationSettings{
  static applicationSettings? settings;
  SqlDb sqlDb = SqlDb();

  applicationSettings? getSettings (){
    settings ??= applicationSettings();
    return settings;
  }

  Future<List> loadSettings() async{
    List<Map> response = await sqlDb.query("SELECT * FROM 'Settings'");
    if(response != null || response.length > 0){
      getSettings()?.setCancelCheckBox(response[0]['CancelCheckBox']);
      getSettings()?.setDeleteCheckBox(response[0]['DeleteCheckBox']);
      getSettings()?.scannerChoice = response[0]['Scanner'];
    }
    return response;
  }

}

class applicationSettings{
  bool _cancelCheckBox = false;
  bool _deleteCheckBox = false;
  String? _scannerChoice;

  bool getCancelCheckBox(){
    return _cancelCheckBox;
  }

  @override
  void setCancelCheckBox(int value) {
    _cancelCheckBox = value == 0? false : true;
  }

  bool getDeleteCheckBox(){
    return _deleteCheckBox;
  }

  @override
  void setDeleteCheckBox(int value) {
    _deleteCheckBox = value == 0? false : true;
  }

  String? get scannerChoice => _scannerChoice;

  set scannerChoice(String? value) {
    _scannerChoice = value;
  }
}