import 'package:hijri/hijri_calendar.dart';

class FMSFile {
  String? _title;
  String? _date;
  String _fileNum = "";
  String _path = "";

  FMSFile({String? title, String? date, required String fileNum, required String path})
      : this._title = title,
        this._date = date,
        this._fileNum = fileNum,
        this._path = path;

  FMSFile.fmsDB(Map<dynamic,dynamic> query){
    this.fileNum = query['filenumber'];
    this.path = query['filepath'];
    List<String> dateList = query['date'].toString().split('-');
    DateTime dateTime = DateTime(int.parse(dateList[0]),int.parse(dateList[1]),int.parse(dateList[2]));
    this._date = (query['date'] == '1010-01-01')? "" : HijriCalendar.fromDate(dateTime).toString();
    this.title = (query['title'] == 'empty')? "" : query['title'];
  }

  String? get title => _title;

  set title(String? value) {
    _title = value;
  }

  String? get date => _date;

  set date(String? value) {
    _date = value;
  }

  String get path => _path;

  set path(String value) {
    _path = value;
  }

  String get fileNum => _fileNum;

  set fileNum(String value) {
    _fileNum = value;
  }
}
