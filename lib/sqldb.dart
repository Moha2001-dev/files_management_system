import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


/// [SqlDb] provide an interface and easy
/// access to the database shared object.
class SqlDb{
  static Database? _appDB;

  /// if database are initialized, return database
  /// if database aren't initialized, initialize database then return it.
  Future<Database?> get appDB async{
    _appDB ??= await initDB();
    return _appDB;
  }


  /// initialize database by getting the database default path
  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,'FilesManagementSystem.db');
    Database myDB = await openDatabase(path , onCreate: _onCreate, version: 10, onUpgrade: _onUpgrade);
    return myDB;
  }

  /// create database with relations.
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

  /// update database structure, tables, columns, etc...
  _onUpgrade(Database db, int oldVersion, int newVersion) async{
    Database? myDB = await db;
    myDB.execute('''
    
    ''');
  }


  /// fetch data from database
  query(String sql) async{
    Database? myDB = await appDB;
    List<Map> response = await myDB!.rawQuery(sql);
    return response;
  }

  /// insert new data into the database
  insertData(String sql) async{
    Database? myDB = await appDB;
    int response = await myDB!.rawInsert(sql);
    return response;
  }

  /// Update existing data from the database
  updateData(String sql) async{
    Database? myDB = await appDB;
    int response = await myDB!.rawUpdate(sql);
    return response;
  }

  /// delete existing record from the database
  deleteData(String sql) async{
    Database? myDB = await appDB;
    int response = await myDB!.rawDelete(sql);
    return response;
  }

  /// fetch number of records/fields from the database; helps with statistics
  Future<List<Map<String, Object?>>> count(String sql) async{
    Database? myDB = await appDB;
    List<Map<String, Object?>> response = await myDB!.rawQuery(sql);
    return response;
  }
}