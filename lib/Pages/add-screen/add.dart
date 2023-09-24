import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_twain_scanner/flutter_twain_scanner.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../models/ApplicationSettings.dart';
import '../../sqldb.dart';
import '../home-screen/home.dart';
import '../settings-screen/settings.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _addFileState();
}

class _addFileState extends State<AddFile> {

  @override
  void initState() {
    super.initState();
    initPlatformState();
    getSettings();
  }

  var selectedDate = new HijriCalendar.now();

  final TextEditingController dateController = TextEditingController(text: '');
  final TextEditingController pathController = TextEditingController(text: '');

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
        dateController.text = selectedDate.toString();
        _fileDate = dateController.text;
      });
  }
  final _pathFormKey = GlobalKey<FormState>();
  final _numFormKey = GlobalKey<FormState>();
  final _dateFormKey = GlobalKey<FormState>();

  String _fileTitle ='';
  String _fileNumber ='';
  String _fileDate='';
  String _filePath='';

  bool _cancelCheckBox = false;

  @override
  Widget build(BuildContext context) {
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
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: MediaQuery.of(context).size.width < 1250
                          ? [
                              Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => Home()),
                                          (Route<dynamic> route) => false);
                                    },
                                    icon: Icon(
                                      Icons.home,
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      size: 35,
                                    ),
                                  )),
                              SizedBox(
                                width: 15,
                              ),
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add_circle_outlined,
                                          color:
                                              Color.fromARGB(255, 54, 121, 175),
                                          size: 35,
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: 35,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 54, 121, 175),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(11),
                                              topRight: Radius.circular(11))),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Settings()),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.settings,
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      size: 35,
                                    ),
                                  )),
                            ]
                          : [
                              Align(
                                  alignment: Alignment.center,
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => Home()),
                                          (Route<dynamic> route) => false);
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.home,
                                          color: Color.fromARGB(
                                              255, 112, 112, 112),
                                          size: 24,
                                        ),
                                        Container(
                                          width: 137,
                                          child: Text(
                                            'الصفحة الرئيسية',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: RawMaterialButton(
                                        onPressed: () {},
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add_circle_outlined,
                                              color: Color.fromARGB(
                                                  255, 54, 121, 175),
                                              size: 24,
                                            ),
                                            Container(
                                              width: 53,
                                              child: Text(
                                                'اضافة',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 54, 121, 175),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: 90,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 54, 121, 175),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(11),
                                              topRight: Radius.circular(11))),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Settings()),
                                      );
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.settings,
                                          color: Color.fromARGB(
                                              255, 112, 112, 112),
                                          size: 24,
                                        ),
                                        Container(
                                          width: 68,
                                          child: Text(
                                            'اعدادات',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 112, 112, 112),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 70,
                    margin: EdgeInsets.only(left: 32),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: RawMaterialButton(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 42,
                                child: Text(
                                  'رجوع',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 112, 112, 112),
                                size: 24,
                              ),
                            ],
                          ),
                        )),
                  ),
                )
              ],
            ),
          )),
      backgroundColor: Color.fromARGB(255, 240, 244, 247),
      body: SingleChildScrollView(
          child: Container(
            width: 1920.w,
            alignment: Alignment.center,
            child: Container(
              width: 1758.w,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 53),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'معلومات المعاملة',
                      style: TextStyle(
                          fontSize: 49,
                          fontWeight: FontWeight.w300,
                          color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                    width: 1758.w,
                    height: 437,
                    margin: EdgeInsets.symmetric(vertical: 22),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 32),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Divider(
                                  indent: 40.w,
                                  endIndent: 40.w,
                                  color: Color.fromARGB(255, 112, 112, 112),
                                ),
                              ),
                              Container(
                                width: 100,
                                margin: EdgeInsets.only(right: 50,bottom: 5),
                                alignment: Alignment.center,
                                color: Colors.white,
                                child: Text(
                                  'حقول اجبارية',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 24),
                          width: 1700.w,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 251.w + 183,
                                  height: 100,
                                  child: Form(
                                    key: _numFormKey,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: "رقم المعاملة *"
                                      ),
                                      onChanged: (text){
                                        setState(() {
                                          _fileNumber = text;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'رجاءا ادخل رقم المعاملة';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              )),
                              Expanded(child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 251.w + 183,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 53,
                                          height: 53,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(255, 54, 121, 175),
                                              borderRadius: BorderRadius.circular(5.sp)
                                          ),
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.scanner,
                                                color: Colors.white,
                                                size: 36,
                                              ),
                                              padding: EdgeInsets.zero,
                                              mouseCursor: SystemMouseCursors.forbidden,
                                              onPressed: null
                                            /*() async {
                                                try{
                                                  if (_selectedScanner != null) {
                                                    int index = _scanners.indexOf(_selectedScanner!);
                                                    String? documentPath = await _flutterTwainScannerPlugin.scanDocument(index);

                                                    setState(() {
                                                      _documentPath = documentPath;
                                                    });
                                                  }
                                                }catch(e){
                                                  print(e);
                                                }
                                              },

                                                   */
                                          ),
                                      ),
                                      SizedBox(width: 8,),
                                      Container(
                                          width: 53,
                                          height: 53,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(255, 54, 121, 175),
                                              borderRadius: BorderRadius.circular(5.sp)
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.open_in_browser,
                                              color: Colors.white,
                                              size: 36,
                                            ),
                                            padding: EdgeInsets.zero,
                                            onPressed: () async{

                                              // showDialog(
                                              //   context: context, builder: (BuildContext context) {
                                              //   return Container();
                                              // },
                                              //   barrierDismissible: false
                                              // );


                                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                                  type: FileType.custom,
                                                  allowedExtensions: ['pdf','png','jpg'],
                                                  allowMultiple: false,
                                                  lockParentWindow: true
                                              );

                                              if (result != null) {
                                                setState(() {
                                                  File file = File(result.files.single.path!);
                                                  _filePath = file.path;
                                                  pathController.text = _filePath;
                                                });
                                              }
                                            },
                                          )
                                      ),
                                      SizedBox(width: 8,),
                                      SizedBox(
                                        width: 251.w,
                                        height: 100,
                                        child: Form(
                                          key: _pathFormKey,
                                          child: TextFormField(
                                            controller: pathController,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: "ملف المعاملة *"
                                            ),
                                            onChanged: (text){
                                              setState(() {
                                                _filePath = text;
                                              });
                                            },
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'رجاءا ادخل مسار الملف';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8,),
                                      Container(
                                          width: 53,
                                          height: 53,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 213, 84, 78),
                                              borderRadius: BorderRadius.circular(5.sp)
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.delete_outline,
                                              color: Colors.white,
                                              size: 36,
                                            ),
                                            padding: EdgeInsets.zero,
                                            onPressed: (){
                                              setState(() {
                                                _filePath = '';
                                                pathController.text = '';
                                              });
                                            },
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:5),
                              child: Divider(
                                indent: 40.w,
                                endIndent: 40.w,
                                color: Color.fromARGB(255, 112, 112, 112),
                              ),
                            ),
                            Container(
                              width: 100,
                              margin: EdgeInsets.only(right: 50,bottom: 4),
                              alignment: Alignment.center,
                              color: Colors.white,
                              child: Text(
                                'حقول اختيارية',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 24),
                          width: 1700.w,
                          child: Row(
                            children: [
                              Expanded(child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 251.w + 183,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "عنوان المعاملة "
                                    ),
                                    onChanged: (text){
                                      setState(() {
                                        _fileTitle = text;
                                      });
                                    },
                                  ),
                                ),
                              )),
                              Expanded(child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 251.w + 183,
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 53,
                                          height: 53,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(255, 54, 121, 175),
                                              borderRadius: BorderRadius.circular(5.sp)
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.date_range,
                                              color: Colors.white,
                                              size: 36,
                                            ),
                                            padding: EdgeInsets.zero,
                                            onPressed: () => _selectDate(context),
                                          )
                                      ),
                                      SizedBox(width: 8,),
                                      SizedBox(
                                        width: 251.w + 122,
                                        child: Form(
                                          key: _dateFormKey,
                                          child: TextFormField(
                                            controller: dateController,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: "تاريخ المعاملة"
                                            ),
                                            onChanged: (text){
                                              setState(() {
                                                _fileDate = text;
                                              });
                                            },
                                            validator: (value){

                                              if(value != null && (value?? "").isNotEmpty){
                                                String? tempDate = engNumberToFarsi(value);
                                                RegExp dateExp = RegExp(r'^\d{4}/(\d|\d\d)/(\d|\d\d)');
                                                if(!dateExp.hasMatch(tempDate?? value)){
                                                  return 'التاريخ المدخل يجب ان يكون مماثل الى : ${HijriCalendar.now().toString()} ';
                                                }
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 18),
                            width: 1690.w,
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    width: 100,
                                    height: 53,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18)
                                    ),
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: 50,
                                      child: IconButton(
                                        icon: Text(
                                          "الغاء",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),
                                        ),
                                        padding: EdgeInsets.zero,
                                        onPressed: (){
                                          if(_cancelCheckBox || (_fileDate.isEmpty && _fileDate.isEmpty && _fileTitle.isEmpty && _fileNumber.isEmpty)){
                                            Navigator.of(context).pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) => Home()),
                                                    (Route<dynamic> route) => false);
                                          }else{
                                            ShowAlertDialug(context);
                                          }
                                        },
                                      ),
                                    )
                                ),
                                SizedBox(width: 8,),
                                Container(
                                    width: 231,
                                    height: 53,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 54, 121, 175),
                                        borderRadius: BorderRadius.circular(18)
                                    ),
                                    child: IconButton(
                                      icon: Text(
                                        "اضافة",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                      padding: EdgeInsets.zero,
                                      onPressed: () async {
                                        bool pathValidate = _pathFormKey.currentState!.validate();
                                        bool numValidate = _numFormKey.currentState!.validate();
                                        bool dateValidate = _dateFormKey.currentState!.validate();
                                        if (pathValidate && numValidate && dateValidate) {
                                          List<Map> isExist =  await isFileExist();
                                          if(isExist[0]['COUNT(*)'] > 0){
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('رقم المعاملة موجود مسبقا, تأكد من ادخال رقم غير متكرر!')),
                                            );
                                            return;
                                          }

                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('جاري معالجة البيانات')),
                                          );
                                          
                                          //copy file
                                          Directory directory = await getApplicationDocumentsDirectory();
                                          Directory appDucs = Directory(join('${directory.path}','FilesManagementSystem'));
                                          if(!await appDucs.exists()){
                                            await appDucs.create(recursive: true);
                                          }
                                          File file = File(_filePath);
                                          if(!await file.exists()){
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('لا يوجد ملف $_filePath')),
                                            );
                                            return;
                                          }
                                          File newFile = await file.copy(join(appDucs.path,'$_fileNumber${extension(file.path)}'));

                                          int isInsert =await insertToDatabase(newFile.path,context);
                                          if(isInsert != 0){
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('تم اضافة المعاملة')),
                                            );
                                          }
                                          Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                  builder: (context) => Home()),
                                                  (Route<dynamic> route) => false);
                                        }
                                      },
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 53),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'شكل السجل',
                      style: TextStyle(
                          fontSize: 49,
                          fontWeight: FontWeight.w300,
                          color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                    width: 1758.w,
                    height: 154,
                    margin: EdgeInsets.symmetric(vertical: 22),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          )
                        ]),
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
                          Align(
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
                                          '1',
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
                                        _fileTitle ?? "",
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
                                        _fileNumber ?? "",
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
                                        "${_fileDate ?? ""}",
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
                                        _filePath ?? "",
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
                                                onPressed: null,
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
                                                onPressed: null,
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
                                                onPressed: null,
                                              )
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                          )
                        ]
                    ),

                  )
                ],
              ),
            ),
          )
      ),
    );
  }
/*
1445/1/25 hello
123 1231
90 asd
 */
  isFileExist() async{
    List<Map> response = await sql.query("SELECT COUNT(*) FROM 'FilesInfo' WHERE filenumber LIKE '$_fileNumber';");
    return response;
  }
  insertToDatabase(String path,BuildContext context) async{
    String nowDate = DateFormat('yyyy-mm-dd').format(DateTime.now());
    String? fileDate = '';
    if(!_fileDate.isEmpty){
      fileDate = engNumberToFarsi(_fileDate);
      fileDate = fileDate?.replaceAll(RegExp(r'/'), '-');
    }
    try{
      int result = await sql.insertData("INSERT INTO 'FilesInfo' (filenumber,${_fileTitle.isEmpty? "":"title,"}${_fileDate.isEmpty? "":"date,"}filepath,entryDate) VALUES ('$_fileNumber', ${_fileTitle.isEmpty? "":"'$_fileTitle',"}${_fileDate.isEmpty? "":"'$fileDate',"}'$path','$nowDate');");
    }on  Exception catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }


    return 0;
  }

  ShowAlertDialug(BuildContext context){
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
                                'تأكيد الغاء الاضافة',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                              SizedBox(height: 8,),
                              Text(
                                'سيتم الغاء المعلومات المدخلة',
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
                                    value: _cancelCheckBox,
                                    onChanged: (select){
                                      setState(() {
                                        _cancelCheckBox = select!;
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
                                          saveSettings();
                                          Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                  builder: (context) => Home()),
                                                  (Route<dynamic> route) => false);
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


  SettingsInterface settings = SettingsInterface();
  SqlDb sql = new SqlDb();
  String _platformVersion = 'Unknown';
  final _flutterTwainScannerPlugin = FlutterTwainScanner();
  String? _documentPath;
  List<String> _scanners = []; // Option 2
  String? _selectedScanner;

  getSettings() async{
    await searchForScaner();
    _cancelCheckBox = await settings.getSettings()?.getCancelCheckBox() as bool;
    _selectedScanner = await settings.getSettings()?.getScannerChoice() as String;
    if(!_scanners.contains(_selectedScanner)){
      _selectedScanner = null;
    }
  }
  saveSettings() async{
    int response = await sql.updateData("UPDATE 'Settings' SET CancelCheckBox = ${(_cancelCheckBox? 1 : 0)}, Scanner = '$_selectedScanner' ");
    settings.getSettings()?.setScannerChoice(_selectedScanner);
    settings.getSettings()?.setCancelCheckBox(_cancelCheckBox?1:0);
  }
  Future<void> searchForScaner() async {
    List<String>? scanners = await _flutterTwainScannerPlugin.getDataSources();
    if (scanners != null) {
      setState(() {
        _scanners = scanners;
      });
    }
  }
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _flutterTwainScannerPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  String? engNumberToFarsi(String? number) {
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

  bool validator = false;
   Future<bool> valid(String? value) async{
    return File(value?? '').exists();
  }
}
