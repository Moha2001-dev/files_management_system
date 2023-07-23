import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqlDb{

  static Database? _db;

  Future<Database?> get db async{
    if(_db == null){
      _db = await initalDB();
      return _db;
    }else{
      return _db;
    }
  }


  //initiate Database
  initalDB() async {
    String databasePath = await getDatabasesPath(); //get local database path
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = join(appDocDir.path,databasePath,'FilesManagementSystem.db');

    Database mydb = await openDatabase(path , onCreate: _onCreate, version: 9, onUpgrade: _onUpgrade);
    return mydb;
  }

  //once the database created the followings tables will be created
  _onCreate(Database db, int version) async{
    await db.execute('''
    CREATE TABLE "FilesInfo" (
    "filenumber" TEXT PRIMARY KEY, 
    "title" text, 
    "date" Date, 
    "filepath" TEXT NOT NULL);
    CREATE TABLE "Settings" (
    "CancelCheckBox" INTEGER(1) NOT NULL DEFAULT 0, 
    "DeleteCheckBox" INTEGER(1) NOT NULL DEFAULT 0, 
    "Scanner" TEXT);
    ''');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async{
    print("_onUpgrade ================================");
    Database? mydb = await db;
    print("${oldVersion}  ${newVersion}");
    mydb.execute('''
    ALTER TABLE FilesInfo DROP COLUMN 'date';
    ALTER TABLE FilesInfo DROP COLUMN 'title';
    ''');
    mydb.execute('''
    ALTER TABLE FilesInfo ADD COLUMN 'date' DATE DEFAULT '1010-01-01' ;
    ALTER TABLE FilesInfo ADD COLUMN 'title' TEXT DEFAULT 'empty';
    ''');
  }

  query(String sql) async{
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

}