
class ApplicationSettings{
  static applicationSettings? settings;

  applicationSettings? getSettings (){
    settings ??= applicationSettings();
    return settings;
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