
///A [FMSFile] class holds a real life file's(معاملة) object data
class FMSFile {
  String? _title;
  String? _date;
  String _fileNum = "";
  String _path = "";
  String _entryDate = "";

  ///initialize [FMSFile] object by data passing.
  FMSFile({String? title, String? date, required String fileNum, required String path,required String entryDate})
      : _title = title,
        _date = date,
        _fileNum = fileNum,
        _path = path,
        _entryDate = entryDate;

  ///initialize [FMSFile] object by data directly fetched from database.
  FMSFile.fmsDB(Map<dynamic,dynamic> query){
    fileNum = query['filenumber'];
    path = query['filepath'];
    date = (query['date'] == '1010-01-01')? "" : DateTime(int.parse(query['date'].toString().split(RegExp(r'-'))[0]),int.parse(query['date'].toString().split(RegExp(r'-'))[1]),int.parse(query['date'].toString().split(RegExp(r'-'))[2])).toString();
    title = (query['title'] == 'empty')? "" : query['title'];
    entryDate = (query['entryDate'] == 'empty')? "" : query['entryDate'];
  }

  String get entryDate => _entryDate;

  set entryDate(String value) {
    _entryDate = value;
  }

  String? get title {
    return _title;
  }

  set title(String? value) {
    _title = value;
  }

  String? get date {
    return _date;
  }

  set date(String? value) {
    _date = value;
  }

  String get path {
    return _path;
  }

  set path(String value) {
    _path = value;
  }

  String get fileNum {
    return _fileNum;
  }

  set fileNum(String value) {
    _fileNum = value;
  }
}
