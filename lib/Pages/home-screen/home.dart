import 'dart:io';

import 'package:files_management_system/Pages/home-screen/home-widgets/FileItem.dart';
import 'package:files_management_system/Pages/universal%20widgets/Appbar.dart';
import 'package:files_management_system/models/utils.dart';
import 'package:flutter/material.dart';

import 'package:files_management_system/sqldb.dart';
import 'package:files_management_system/models/fms_file.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SqlDb sqlDb = SqlDb();
  bool _executed = false;
  List<FMSFile> files = [];
  String? _searchText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(context,getSearchCallBack),
      backgroundColor: const Color.fromARGB(255, 240, 244, 247),
      body: Center(
        child: Container(
          width: 1758.w,
          height: MediaQuery.of(context).size.height - 100,
          margin: EdgeInsets.symmetric(vertical: 22),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(41, 0, 0, 0),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0,4),
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                width: 1691.w,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Expanded(
                      flex: 5,
                      child: Text(
                        "م",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      width: 15,

                    ),
                    const Expanded(
                      flex: 20,
                      child: Text(
                        "عنوان المعاملة",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      width: 15,

                    ),
                    const Expanded(
                      flex: 18,
                      child: Text(
                        "رقم المعاملة",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      width: 15,

                    ),
                    const Expanded(
                      flex: 11,
                      child: Text(
                        "التاريخ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      width: 15,

                    ),
                    const Expanded(
                      flex: 34,
                      child: Text(
                        "اسم الملف",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      width: 15,

                    ),
                    Container(
                      width: 117.w,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "الاجراءات",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width: 1691.w,
                  child: const Divider(
                    color: Color.fromARGB(255, 112, 112, 112),
                  )
              ),
              FutureBuilder(
                future: _processingData(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting && !_executed)
                    return Expanded(
                        child: LoadingAnimationWidget.staggeredDotsWave(color: Color.fromARGB(255, 255, 202, 40), size: 60.spMax)
                    );    ///Splash Screen
                  else {
                    _executed = true;
                    return files.length == 0? Align(
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        height: (MediaQuery.of(context).size.height - 375),
                        child: Text("لا يوجد معاملات",
                          style: TextStyle(
                              color: Color.fromARGB(255, 112, 112, 112),
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                    ):
                    Container(
                      width: 1758.w,
                      height: (MediaQuery.of(context).size.height - 220),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                          itemCount: files.length,
                          itemBuilder: (BuildContext context, int index){
                            return FileItem(index,files[index],deleteCallBack);
                          }
                      ),
                    );
                  }///Main Screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<List> _processingData() {
    return Future.wait([
      loadData(),
    ]);
  }
  Future<List> loadData() async{
    String? search = _searchText;
    String where = '';

    if(search != null){
      search = engNumberToFarsi(_searchText);
      RegExp regex = RegExp(r'^\d{4}/(\d|\d\d)/(\d|\d\d)');
      if (regex.hasMatch(search!.trim())) {
        List<String> dateString = search.split(RegExp(r'/'));
        DateTime date = DateTime(int.parse(dateString[0]),int.parse(dateString[1]),int.parse(dateString[2]));
        search = DateFormat("y-M-d").format(date).toString();
      }


      where =  "WHERE filenumber LIKE '%${search}%' OR title LIKE '%${search}%' OR  date LIKE '${search}'";
    }

    List<Map> response = await sqlDb.query("SELECT * FROM 'FilesInfo' $where");
    files.clear();

    for(int index = 0; index < response.length; index++){
      try {
        files.add(FMSFile.fmsDB(response[index]));
      // ignore: empty_catches
      } on Exception catch (e) {

      }
    }

    return response;
  }

  getSearchCallBack(String? searchWord){
    setState(() {
      _searchText =  searchWord;
    });
  }
  deleteCallBack(String rowID) async{

    //delete docs from storage
    var filePath = await sqlDb.query("SELECT filepath FROM 'filesInfo' WHERE filenumber = '$rowID';");
    File toBeDeleted = File(filePath[0]["filepath"]!);
    if((await toBeDeleted.exists())){
      toBeDeleted.delete();
    }

    //delete from database
    await sqlDb.deleteData("DELETE FROM 'filesInfo' WHERE filenumber = '$rowID';");

    //update state
    setState(() {});
  }
}

