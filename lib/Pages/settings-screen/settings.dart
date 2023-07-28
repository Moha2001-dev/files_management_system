

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_twain_scanner/flutter_twain_scanner.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../models/ApplicationSettings.dart';
import '../../sqldb.dart';
import '../add-screen/add.dart';
import '../home-screen/home.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _settings();
}



class _settings extends State<Settings> {

  SqlDb sql = new SqlDb();

  @override
  void initState(){
    super.initState();
    initPlatformState();
    settings = ApplicationSettings();
    getSettings();
  }

  late ApplicationSettings settings;
  bool _cancelCheck = false;
  bool _deleteCheck = false;

  getSettings() async{
    await searchForScaner();
    _cancelCheck = settings.getSettings()?.getCancelCheckBox() as bool;
    _deleteCheck = settings.getSettings()?.getDeleteCheckBox() as bool;
    _selectedScanner = settings.getSettings()?.scannerChoice as String;
    if(!_scanners.contains(_selectedScanner)){
      _selectedScanner = null;
    }
  }

  saveSettings() async{
    int response = await sql.updateData("UPDATE 'Settings' SET DeleteCheckBox = ${(_deleteCheck? 1 : 0)}, CancelCheckBox = ${(_cancelCheck? 1 : 0)}, Scanner = '$_selectedScanner' ");
    print(response);


    var response0 = await sql.query("SELECT * FROM 'Settings';");
    print(response0); //DELETE
  }

  Future<void> searchForScaner() async {
  List<String>? scanners = await _flutterTwainScannerPlugin.getDataSources();
  if (scanners != null) {
  setState(() {
  _scanners = scanners;
  });
  }
}


  String _platformVersion = 'Unknown';
  final _flutterTwainScannerPlugin = FlutterTwainScanner();
  String? _documentPath;
  List<String> _scanners = []; // Option 2
  String? _selectedScanner;

  // Platform messages are asynchronous, so we initialize in an async method.
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


  int _totalFiles7Day = 0;
  int _totalFiles30Day = 0;
  int _totalFiles = 0;

  Future<int> getNumberOfFiles() async{
    DateTime now = DateTime.now();

    List<Map> response =await sql.count('SELECT COUNT (*) FROM FilesInfo');
    _totalFiles = response[0]['COUNT (*)'];

    DateTime period = DateTime(now.year,now.month,now.day - 7);
    response =await sql.count("SELECT COUNT (*) FROM FilesInfo WHERE entryDate <= '${now.year}-${now.month}-${now.day}' AND entryDate >='${period.year}-${period.month}-${period.day}' ;");
    _totalFiles7Day = response[0]['COUNT (*)'];

    period = DateTime(now.year,now.month,now.day - 30);
    response =await sql.count("SELECT COUNT (*) FROM FilesInfo WHERE entryDate <= '${now.year}-${now.month}-${now.day}' AND entryDate >='${period.year}-${period.month}-${period.day}' ;");
    _totalFiles30Day = response[0]['COUNT (*)'];
    return 0;
  }

  bool _executed = false;
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
                      children: MediaQuery.of(context).size.width < 1250? [
                        Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: (){
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    home()), (Route<dynamic> route) => false);
                              },
                              icon: Icon(
                                Icons.home,
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
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddFile())
                                );
                              },
                              icon: Icon(
                                Icons.add_circle_outlined,
                                color: Color.fromARGB(255, 112, 112, 112),
                                size: 35,
                              ),
                            )
                        ),
                        SizedBox(width: 15,),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: (){},
                                  icon: Icon(
                                    Icons.settings,
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
                      ] : [
                        Align(
                            alignment: Alignment.center,
                            child: RawMaterialButton(
                              onPressed: (){
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    home()), (Route<dynamic> route) => false);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Color.fromARGB(255, 112, 112, 112),
                                    size: 24,
                                  ),
                                  Container(
                                    width: 137,
                                    child: Text(
                                      'الصفحة الرئيسية',
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
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AddFile())
                                );
                              },
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
                                        Icons.settings,
                                        color: Color.fromARGB(255, 54, 121, 175),
                                        size: 24,
                                      ),
                                      Container(
                                        width: 68,
                                        child: Text(
                                          'اعدادات',
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
                                width: 92.14,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 54, 121, 175),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11))
                                ),
                              ),
                            )
                          ],
                        ),
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
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 42,
                                child: Text(
                                  'رجوع',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 112, 112, 112),
                                size: 24,
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                )
              ],
            ),
          )
      ),
      backgroundColor: const Color.fromARGB(255, 240, 244, 247),
      body: FutureBuilder(
          future: _processingData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.waiting && !_executed)
              return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(color: Color.fromARGB(255, 255, 202, 40), size: 60.spMax)
              );    ///Splash Screen
            else {
              _executed = true;
              return SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: SizedBox(
                      width: 1684.w, // to be edited
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 27),
                            alignment: Alignment.center,
                            child: Text(
                              'اعدادات',
                              style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            alignment: Alignment.centerRight,
                            child: Text(
                              'اعدادات',
                              style: TextStyle(
                                  fontSize: 49,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 1670.w+8,
                              height: 322,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(23),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
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
                                        width: 40,
                                        margin: EdgeInsets.only(right: 50,bottom: 5),
                                        alignment: Alignment.center,
                                        color: Colors.white,
                                        child: Text(
                                          'عام',
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
                                    margin: EdgeInsets.only(top: 8),
                                    width: 1151.w,
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Checkbox(
                                          value: _deleteCheck,
                                          onChanged: (select){
                                            setState(() {
                                              _deleteCheck = select!;
                                              saveSettings();
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
                                          'عدم تكرار رسالة تأكيد الحذف',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(255, 112, 112, 112),
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8,bottom: 8),
                                    width: 1151.w,
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          value: _cancelCheck,
                                          onChanged: (select){
                                            setState(() {
                                              _cancelCheck = select!;
                                              saveSettings();
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
                                          r"عدم تكرار رسالة تأكيد الغاء الإضافة\التعديل",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(255, 112, 112, 112),
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
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
                                        width: 119,
                                        margin: EdgeInsets.only(right: 50,bottom: 4),
                                        alignment: Alignment.center,
                                        color: Colors.white,
                                        child: Text(
                                          'الماسح الضوئي',
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
                                    margin: EdgeInsets.only(top: 8),
                                    width: 1151.w+8,
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'تحديد جهاز الماسح الضوئي',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(right: 4),
                                              child: Tooltip(
                                                message: 'تحديد الماسح الضوئي الخارجي لمسح المعاملات مباشرة',
                                                child: Icon(
                                                  Icons.info_outline,
                                                  color: Colors.black,
                                                  size: 30,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 976.w> 976? 976: 976.w,
                                              height: 53,
                                              margin: EdgeInsets.only(top: 8),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  border: Border.all(color: Color.fromARGB(255, 112, 112, 112),width: 1.5)
                                              ),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  hint: Text(
                                                    '  اختر الماسح الضوئي',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.black
                                                    ),
                                                  ),
                                                  value: _selectedScanner,
                                                  items: _scanners.map((location) {
                                                    return DropdownMenuItem(
                                                      child: Row(children: [
                                                        Text('  '),
                                                        Expanded(child: Text(location,overflow: TextOverflow.ellipsis,)),
                                                      ],),
                                                      value: location,
                                                    );
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      _selectedScanner = newValue;
                                                    });
                                                  },
                                                  isExpanded: true,
                                                  icon: Container(
                                                    width: 55,
                                                    height: 53,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(255, 219, 219, 219),
                                                        borderRadius: BorderRadius.only(
                                                            bottomLeft: Radius.circular(8),
                                                            topLeft: Radius.circular(8)
                                                        )
                                                    ),
                                                    child: Icon(
                                                      Icons.keyboard_arrow_down_outlined,
                                                      size: 23.62,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                height: 53,
                                                margin: EdgeInsets.only(right: 8),
                                                width: 167.w>167? 167:167.w,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Color.fromARGB(255, 55, 122, 176)
                                                ),
                                                child: RawMaterialButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8)
                                                  ),
                                                  onPressed: searchForScaner,
                                                  child: MediaQuery.of(context).size.width > 1005? Text(
                                                    'بحث',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 25,
                                                        color: Colors.white
                                                    ),
                                                  ) : Icon(Icons.search, color: Colors.white,size: 30,),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 53),
                            alignment: Alignment.centerRight,
                            child: Text(
                              'إحصائيات عامة',
                              style: TextStyle(
                                  fontSize: 49,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 536.w,
                                        height: 154,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(23),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromARGB(41, 0, 0, 0),
                                              spreadRadius: 1,
                                              blurRadius: 6,
                                              offset: Offset(0,4),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${NumberFormat.compactCurrency(decimalDigits: 1, symbol: '').format(_totalFiles)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 60,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 55, 122, 176)
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              'عدد المعاملات(الكلي)',
                                              style: TextStyle(
                                                  fontSize: 30.w,
                                                  //fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                              ),
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 536.w,
                                        height: 154,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(23),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromARGB(41, 0, 0, 0),
                                              spreadRadius: 1,
                                              blurRadius: 6,
                                              offset: Offset(0,4),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${NumberFormat.compactCurrency(decimalDigits: 1, symbol: '').format(_totalFiles30Day)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 60,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 55, 122, 176)
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              'عدد المعاملات(اخر 30 يوم)',
                                              style: TextStyle(
                                                  fontSize: 30.w,
                                                  //fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                              ),
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 536.w,
                                        height: 154,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(23),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromARGB(41, 0, 0, 0),
                                              spreadRadius: 1,
                                              blurRadius: 6,
                                              offset: Offset(0,4),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${NumberFormat.compactCurrency(decimalDigits: 1, symbol: '').format(_totalFiles7Day)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 60,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 55, 122, 176)
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              'عدد المعاملات(اخر 7 ايام)',
                                              style: TextStyle(
                                                  fontSize: 30.w,
                                                  //fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                              ),
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }///Main Screen
          }
      ),
    );
  }


  Future<List<int>> _processingData() {
    return Future.wait([
      getNumberOfFiles(),
    ]);
  }
}