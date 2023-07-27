import 'package:files_management_system/Pages/home-screen/home.dart';
import 'package:files_management_system/Pages/loading-screen/loading.dart';
import 'package:files_management_system/models/fms_file.dart';
import 'package:files_management_system/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'Pages/settings-screen/settings.dart';
import 'models/ApplicationSettings.dart';

class profider extends StatefulWidget {
  @override
  State<profider> createState() => _profiderState();
}

class _profiderState extends State<profider> {
  SqlDb sqlDb = SqlDb();
  ApplicationSettings settings = ApplicationSettings();

  bool _executed = false;


  databaseTemp()async{
    //sqlDb.initalDB();


    // int response0 = await sqlDb.deleteData("DELETE FROM 'FilesInfo' WHERE filenumber = '531123';");
    // print(response0); //DELETE
    //
    //
    // print(23123);
    // int response2 = await sqlDb.insertData("INSERT INTO 'FilesInfo' ('filenumber', 'filepath' , 'date' , 'title' , 'entryDate') VALUES ('2321','123','2023-3-4'  , 'asd', '2023-7-24');");
    // print(response2); //INSERT
    //
    //
    List<Map> response1 = await sqlDb.query("SELECT * FROM 'FilesInfo';");
    print(response1); //QUERY
  }

  Future<List> loadSettings() async{
    List<Map> response = await sqlDb.query("SELECT * FROM 'Settings'");

    if(response != null || response.length > 0){
      settings.getSettings()?.setCancelCheckBox(response[0]['CancelCheckBox']);
      settings.getSettings()?.setDeleteCheckBox(response[0]['DeleteCheckBox']);
      settings.getSettings()?.scannerChoice = response[0]['Scanner'];
    }

    return response;
  }

  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: _processingData(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.waiting && !_executed)
          return loading();    ///Splash Screen
        else {
          _executed = true;
          return home();
        }///Main Screen
      },
    );
  }

  Future<List> _processingData() {
    return Future.wait([
      //databaseTemp(),
      loadSettings(),
    ]);
  }
}

