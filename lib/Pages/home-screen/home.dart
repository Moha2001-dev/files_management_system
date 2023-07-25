import 'package:files_management_system/models/fms_file.dart';
import 'package:files_management_system/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri/jHijri.dart';
import 'dart:math';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  SqlDb sql = new SqlDb();

  var selectedDate = new HijriCalendar.now();

  Future<Null> _selectDate(BuildContext context) async {
    final HijriCalendar? picked = await showHijriDatePicker(
      context: context,
      initialDate: selectedDate,
      lastDate: new HijriCalendar()
        ..hYear = HijriCalendar.now().hYear+5
        ..hMonth = 12
        ..hDay = 30,
      firstDate: new HijriCalendar()
        ..hYear = 1357
        ..hMonth = 1
        ..hDay = 1,
      initialDatePickerMode: DatePickerMode.day,
    );

    if (picked != null)
      setState(() {
        selectedDate = picked;
        controller.text = selectedDate.toString();
        _searchText = controller.text;
      });
  }

  final TextEditingController controller = TextEditingController(text: '');
  String? _searchText = null;

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          height: 80,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.white,
                elevation: 5,
                centerTitle: true,
              ),
              Container(
                width: 671.w,
                height: 71,
                margin: EdgeInsets.only(right: 16,left: 8),
                alignment: Alignment.center,
                child: TextField(
                  controller: controller,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                    hintText: "البحث",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 168, 168, 168)
                    ),
                    hoverColor: Colors.transparent,
                    fillColor: Color.fromARGB(255, 239, 239, 239),
                    filled: true,
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 54, 121, 175),
                          shape: BoxShape.circle
                      ),
                      width: 35,
                      height: 35,
                      margin: EdgeInsets.symmetric(horizontal:8),
                      child: RawMaterialButton(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(0),
                        child: Icon(
                          Icons.date_range,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    prefixIcon: Container(
                      height: 27,
                      width: 27,
                      child: RawMaterialButton(
                        shape: CircleBorder(),
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          setState(() {});
                        },
                        child: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 168, 168, 168),
                          size: 30,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(36.0)),
                      borderSide: BorderSide(
                          color: Colors.transparent
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(36.0)),
                      borderSide: BorderSide(
                          color: Colors.transparent
                      ),
                    ),
                  ),
                  onChanged: (String text){
                    _searchText = text;
                    if(text.isEmpty){
                      setState(() {
                      });
                    }
                  },
                  onSubmitted: (String text){
                    setState(() {
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: MediaQuery.of(context).size.width < 1250? [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: (){},
                                icon: Icon(
                                  Icons.home,
                                  color: Color.fromARGB(255, 54, 121, 175),
                                  size: 35,
                                ),
                              )
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 35,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 54, 121, 175),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11))
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 15,),
                      Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){},
                            icon: Icon(
                              Icons.add_circle_outlined,
                              color: Color.fromARGB(255, 112, 112, 112),
                              size: 35,
                            ),
                          )
                      ),
                      SizedBox(width: 15,),
                      Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){},
                            icon: Icon(
                              Icons.settings,
                              color: Color.fromARGB(255, 112, 112, 112),
                              size: 35,
                            ),
                          )
                      ),
                    ] : [
                    Stack(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: RawMaterialButton(
                              onPressed: (){},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Color.fromARGB(255, 54, 121, 175),
                                    size: 24,
                                  ),
                                  Container(
                                    width: 137,
                                    child: Text(
                                      'الصفحة الرئيسية',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 54, 121, 175),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 161,
                            height: 5,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 54, 121, 175),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11))
                            ),
                          ),
                        )
                      ],
                    ),
                      SizedBox(width: 20,),
                      Align(
                          alignment: Alignment.center,
                          child: RawMaterialButton(
                            onPressed: (){},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outlined,
                                  color: Color.fromARGB(255, 112, 112, 112),
                                  size: 24,
                                ),
                                Container(
                                  width: 53,
                                  child: Text(
                                    'اضافة',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 112, 112, 112),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                      SizedBox(width: 20,),
                      Align(
                          alignment: Alignment.center,
                          child: RawMaterialButton(
                            onPressed: (){},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: Color.fromARGB(255, 112, 112, 112),
                                  size: 24,
                                ),
                                Container(
                                  width: 68,
                                  child: Text(
                                    'اعدادات',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 112, 112, 112),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                    ],

                    /*
                    [
                      /*
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: RawMaterialButton(
                              onPressed: (){},
                              child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.home,
                                  color: Color.fromARGB(255, 54, 121, 175),
                                  size: 24,
                                ),
                                Container(
                                  width: 137,
                                  child: Text(
                                    'الصفحة الرئيسية',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 54, 121, 175),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            )
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 161,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 54, 121, 175),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11))
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 20,),
                      Align(
                          alignment: Alignment.center,
                          child: RawMaterialButton(
                            onPressed: (){},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outlined,
                                  color: Color.fromARGB(255, 112, 112, 112),
                                  size: 24,
                                ),
                                Container(
                                  width: 53,
                                  child: Text(
                                    'اضافة',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 112, 112, 112),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                      SizedBox(width: 20,),
                      Align(
                          alignment: Alignment.center,
                          child: RawMaterialButton(
                            onPressed: (){},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outlined,
                                  color: Color.fromARGB(255, 112, 112, 112),
                                  size: 24,
                                ),
                                Container(
                                  width: 68,
                                  child: Text(
                                    'اضافة',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 112, 112, 112),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                       */

                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: (){},
                                icon: Icon(
                                  Icons.home,
                                  color: Color.fromARGB(255, 54, 121, 175),
                                  size: 35,
                                ),
                              )
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 35,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 54, 121, 175),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11))
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 15,),
                      Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){},
                            icon: Icon(
                              Icons.add_circle_outlined,
                              color: Color.fromARGB(255, 112, 112, 112),
                              size: 35,
                            ),
                          )
                      ),
                      SizedBox(width: 15,),
                      Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){},
                            icon: Icon(
                              Icons.settings,
                              color: Color.fromARGB(255, 112, 112, 112),
                              size: 35,
                            ),
                          )
                      ),
                    ],

                     */
                  ),
                ),
              )
            ],
          ),
        )
      ),
      backgroundColor: const Color.fromARGB(255, 240, 244, 247),
      body: Center(
        child: FilesArea(searchText: _searchText,),
      ),
    );
  }
}


class FilesArea extends StatefulWidget {
  FilesArea({required this.searchText});
  String? searchText;

  @override
  State<FilesArea> createState() => _filesAreaState();
}

class _filesAreaState extends State<FilesArea> {

  _filesAreaState(){
    _deleteCheckBox = false; // to edit
  }

  SqlDb sqlDb = SqlDb();
  bool _executed = false;
  List<FMSFile> files = [];

  bool? _deleteCheckBox = false;

  String? engNumberToFarsi() {
    String? number = widget.searchText;
    Map numbers = {
      '٠' : '0',
      '١' : '1',
      '٢' : '2',
      '٣' : '3',
      '٤' : '4',
      '٥' : '5',
      '٦' : '6',
      '٧' : '7',
      '٨' : '8',
      '٩' : '9',
    };

    numbers.forEach((key, value) => number = number?.replaceAll(key, value));

    return number;
  }

  Future<List> loadData() async{
    String? search = widget.searchText;
    String where = '';

    if(search != null){
      search = engNumberToFarsi();


      RegExp regex = RegExp(r'^\d{4}/(\d|\d\d)/(\d|\d\d)');
      if (regex.hasMatch(search!.trim())) {
        var date = JHijri(fYear: int.parse(search.split('/')[0]),fMonth: int.parse(search.split('/')[1]),fDay: int.parse(search.split('/')[2]));
        search = DateFormat('yyyy-MM-dd').format(date.dateTime).toString();
      }


      where =  "WHERE filenumber LIKE '%${search}%' OR title LIKE '%${search}%' OR  date LIKE '${search}'";
    }

    List<Map> response = await sqlDb.query("SELECT * FROM 'FilesInfo'" + where);
    //print(response);
    //print(response.length);
    files.clear();
      for(int index = 0; index < response.length; index++){
        files.add(FMSFile.fmsDB(response[index]));
      }
    //print(_files.length);
    //print(_files);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 1691.w,
                          height: 51,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color.fromARGB(255, 0, 0, 0))
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 9.w),
                                  child: Text(
                                    (index+1).toString(),
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 112, 112, 112),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                width: 15,
                              ),
                              Expanded(
                                flex: 20,
                                child: Text(
                                  files[index].title ?? "",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: 15,

                              ),
                              Expanded(
                                flex: 18,
                                child: Text(
                                  files[index].fileNum,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: 15,

                              ),
                              Expanded(
                                flex: 11,
                                child: Text(
                                  "${files[index].date ?? ""}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: 15,

                              ),
                              Expanded(
                                flex: 34,
                                child: Text(
                                  files[index].path,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: 15,

                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        width: 35.w > 35? 35: 35.w,
                                        height: 35.w > 35? 35: 35.w,
                                        margin: EdgeInsets.only(left: 5.w),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 54, 121, 175),
                                            borderRadius: BorderRadius.circular(5.sp)
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Colors.white,
                                            size: 21.w > 21? 21: 21.w,
                                          ),
                                          padding: EdgeInsets.zero,
                                          onPressed: (){},
                                        )
                                    ),
                                    Container(
                                        width: 35.w > 35? 35: 35.w,
                                        height: 35.w > 35? 35: 35.w,
                                        margin: EdgeInsets.only(left: 5.w),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 240, 174, 78),
                                            borderRadius: BorderRadius.circular(5.sp)
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 21.w > 21? 21: 21.w,
                                          ),
                                          padding: EdgeInsets.zero,
                                          onPressed: (){},
                                        )
                                    ),
                                    Container(
                                        width: 35.w > 35? 35: 35.w,
                                        height: 35.w > 35? 35: 35.w,
                                        margin: EdgeInsets.only(left: 5.w),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 213, 84, 78),
                                            borderRadius: BorderRadius.circular(5.sp)
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.delete_outline,
                                            color: Colors.white,
                                            size: 21.w > 21? 21: 21.w,
                                          ),
                                          padding: EdgeInsets.zero,
                                          onPressed: (){
                                            ShowAlertDialug(context, files[index].fileNum);
                                          },
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                        );
                      }
                  ),
                );
              }///Main Screen
            },
          ),
        ],
      ),
    );
  }

  ShowAlertDialug(BuildContext context,String fileNumber){
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              title: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 507,
                  height: 299,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 507,
                        height: 253,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'تأكيد الحذف',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              'سيتم حذف المعاملة رقم: ${fileNumber}',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                            SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: _deleteCheckBox,
                                  onChanged: (select){
                                    setState(() {
                                      _deleteCheckBox = select;
                                      //change settings
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 112, 112, 112),
                                    width: 2,
                                  ),
                                  splashRadius: 0,
                                  activeColor: Color.fromARGB(255, 55, 122, 176),
                                ),
                                SizedBox(width: 4,),
                                Text(
                                  'عدم تكرار الرسالة(يمكن تغيير الخيار من الاعدادات)',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16,),
                            Container(
                              width: 507,
                              height: 69,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(13),
                                    bottomRight: Radius.circular(13),
                                  ),
                                  color: Color.fromARGB(255, 236, 236, 236)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 8),
                                    width: 231,
                                    height: 53,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: Color.fromARGB(255, 213, 84, 78)
                                    ),
                                    child: RawMaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(13)
                                      ),
                                      onPressed: (){
                                        deleteRow(fileNumber);
                                        //save changes on settings
                                        Navigator.of(context, rootNavigator: true).pop();
                                      },
                                      child: Text(
                                        'حذف',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white
                                        ),
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: RawMaterialButton(
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: (){
                                        Navigator.of(context, rootNavigator: true).pop();
                                      },
                                      child: Text(
                                        'الغاء',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 25,
                                            color: Colors.black
                                        ),
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 92,
                          height: 92,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 213, 84, 78),
                          ),
                          child:Icon(
                            Icons.delete_outline_outlined,
                            size: 62.6,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<List> _processingData() {
    return Future.wait([
      // databaseTemp(),
      loadData(),
    ]);
  }


  deleteRow(String rowID)async{
    await sqlDb.deleteData("DELETE FROM 'FilesInfo' WHERE filenumber = '$rowID';");
    setState(() {});
  }
}

