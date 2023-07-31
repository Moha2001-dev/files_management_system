import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home-screen/home.dart';
import '../settings-screen/settings.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _addFileState();
}

class _addFileState extends State<AddFile> {



  String _fileTitle = '_fileTitle';
  String _fileNumber = '_fileNumber';
  String _fileDate = '_fileDate';
  String _filePath = '_filePath';

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
                                              builder: (context) => home()),
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
                                              builder: (context) => home()),
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
      body: Center(
        child: SingleChildScrollView(
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
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 24),
                      width: 1078.w,
                      child: Row(
                        children: [
                          Expanded(child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 437.w,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "رقم المعاملة *"
                                ),
                              ),
                            ),
                          )),
                          Expanded(child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 437.w,
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
                                          Icons.scanner,
                                          color: Colors.white,
                                          size: 36,
                                        ),
                                        padding: EdgeInsets.zero,
                                        onPressed: (){
                                        },
                                      )
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
                                        onPressed: (){
                                        },
                                      )
                                  ),
                                  SizedBox(width: 8,),
                                  SizedBox(
                                    width: 251,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: "ملف المعاملة *"
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
                      width: 1078.w,
                      child: Row(
                        children: [
                          Expanded(child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 437.w,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "عنوان المعاملة "
                                ),
                              ),
                            ),
                          )),
                          Expanded(child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 437.w,
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
                                        onPressed: (){
                                        },
                                      )
                                  ),
                                  SizedBox(width: 8,),
                                  SizedBox(
                                    width: 376,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: "تاريخ المعاملة"
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
            )


            /*
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h,),
              Text("إضافة معاملة جديدة",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 59
                ),
              ),
              SizedBox(height: 10.h,),
              Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 81.w,),
                          Text("معلومات المعاملة",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.normal,
                                fontSize: 46
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Container(
                          height: 500.h,
                          width: 1785.w,
                          padding: EdgeInsets.only(left: 34, right: 34),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20.h,),
                              Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 10.w,),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20.h,
                                        width: 100.w,
                                        color: Colors.white,
                                        child: Text("حقول اجبارية",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 112, 112, 112),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 105.h,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 18),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("رقم المعاملة",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                        SizedBox(height: 7.h,),
                                        Container(
                                          height: 51.h,
                                          width: 437.w,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color.fromARGB(255,112,112,112) ,
                                                        width: 4
                                                    )
                                                )
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 131.w,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("ملف المعاملة",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                        SizedBox(height: 7.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 53.h,
                                              width: 53.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                color: Color.fromARGB(255,55,122,176),
                                              ),
                                              child: RawMaterialButton(
                                                onPressed: (){
                                                },
                                                child: Icon(Icons.scanner_outlined,color: Colors.white,size: 31.h,),
                                              ),
                                            ),
                                            SizedBox(width: 11.w,),
                                            Container(
                                              height: 53.h,
                                              width: 53.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                color: Color.fromARGB(255,55,122,176),
                                              ),
                                              child: RawMaterialButton(
                                                onPressed: (){
                                                },
                                                child: Icon(Icons.file_upload,color: Colors.white,size: 31.h,),
                                              ),
                                            ),
                                            SizedBox(width: 11.w,),
                                            Container(
                                              height: 53.h,
                                              width: 416.w,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color.fromARGB(255,112,112,112) ,
                                                            width: 4
                                                        )
                                                    )
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 11.w,),
                                            Container(
                                              height: 53.h,
                                              width: 53.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                color: Color.fromARGB(213,213,84,78),
                                              ),
                                              child: RawMaterialButton(
                                                onPressed: (){
                                                },
                                                child: Icon(Icons.delete_forever_outlined,color: Colors.white,size: 31.h,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 43.h,),
                              Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 10.w,),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20.h,
                                        width: 100.w,
                                        color: Colors.white,
                                        child: Text("حقول اختياري",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 112, 112, 112),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 105.h,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 18),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("عنوان المعاملة",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                        SizedBox(height: 7.h,),
                                        Container(
                                          height: 51.h,
                                          width: 437.w,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color.fromARGB(255,112,112,112) ,
                                                        width: 4
                                                    )
                                                )
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 131.w,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("تاريخ المعاملة",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                        SizedBox(height: 7.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 53.h,
                                              width: 53.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(4),bottomRight: Radius.circular(4)),
                                                color: Color.fromARGB(255,55,122,176),
                                              ),
                                              child: RawMaterialButton(
                                                onPressed: (){
                                                },
                                                child: Icon(Icons.calendar_month_rounded,color: Colors.white,size: 31.h,),
                                              ),
                                            ),
                                            Container(
                                              height: 53.h,
                                              width: 555.w,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color.fromARGB(255,112,112,112) ,
                                                            width: 4
                                                        )
                                                    )
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 75.h,
                                    width: 450.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60.h,
                                          width: 120.w,
                                          child: RawMaterialButton(
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onPressed: (){
                                            },
                                            child: Text("الغاء",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255,0,0,0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w,),
                                        Container(
                                          height: 53.h,
                                          width: 231.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(18),
                                            color: Color.fromARGB(255,55,122,176),
                                          ),
                                          child: RawMaterialButton(
                                            onPressed: (){
                                            },
                                            child: Text("اضافة",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 255, 255, 255),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          )
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          SizedBox(width: 81.w,),
                          Text("معلومات المعاملة",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.normal,
                                fontSize: 46
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Container(
                        height: 154.h,
                        width: 1758.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 55.h,
                              width: 1691.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  const Expanded(
                                    flex: 5,
                                    child: Text("م",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 15,

                                  ),
                                  const Expanded(
                                    flex: 20,
                                    child: Text("عنوان المعاملة",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 15,

                                  ),
                                  const Expanded(
                                    flex: 18,
                                    child: Text("رقم المعاملة",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 15,

                                  ),
                                  const Expanded(
                                    flex: 11,
                                    child: Text("تاريخ المعاملة",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 15,

                                  ),
                                  const Expanded(
                                    flex: 34,
                                    child: Text("اسم الملف",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 15,

                                  ),
                                  Container(
                                    width: 100.w,
                                    alignment: Alignment.center,
                                    child: Text("الاجراءات",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50.h,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color:Color.fromARGB(255,112,112,112),style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Table(
                                columnWidths: {
                                  0: FixedColumnWidth(MediaQuery.of(context).size.width/17),
                                  1: FixedColumnWidth(MediaQuery.of(context).size.width/5.4),
                                  2: FixedColumnWidth(MediaQuery.of(context).size.width/5.8),
                                  3: FixedColumnWidth(MediaQuery.of(context).size.width/9.5),
                                  4: FixedColumnWidth(MediaQuery.of(context).size.width/3.5),
                                  5: FixedColumnWidth(MediaQuery.of(context).size.width/12.5),

                                },
                                children:   [
                                  TableRow(
                                      children: [
                                        TableCell(
                                          child: Text("1",
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 112, 112, 112),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20
                                            ),
                                          ),),
                                        TableCell(
                                          child: Text("معاملة انهاء عقود الموظفين",
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 112, 112, 112),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20
                                            ),
                                          ),),

                                        TableCell(
                                          child: Text("432354213555",
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 112, 112, 112),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20
                                            ),
                                          ),),  TableCell(
                                          child: Text("1444\11\2",
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 112, 112, 112),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20
                                            ),
                                          ),),  TableCell(
                                          child: Text("C:c1ilesMangementSystematabaseilenum4323542135sadasdasd55",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 112, 112, 112),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20
                                            ),
                                          ),),  TableCell(
                                          child: Container(
                                            height: 40.h,
                                            width: MediaQuery.of(context).size.width,
                                            margin: EdgeInsets.only(right: 42.w),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 35.h,
                                                  width: 35.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: Color.fromARGB(255,54,121,175),
                                                  ),
                                                  child: RawMaterialButton(
                                                    onPressed: (){
                                                    },
                                                    child: Icon(Icons.remove_red_eye_outlined,color: Colors.white,size: 31.h,),
                                                  ),
                                                ),
                                                SizedBox(width: 5.w,),
                                                Container(
                                                  height: 35.h,
                                                  width: 35.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: Color.fromARGB(255,240,174,78),
                                                  ),
                                                  child: RawMaterialButton(
                                                    onPressed: (){
                                                    },
                                                    child: Icon(Icons.mode_outlined,color: Colors.white,size: 31.h,),
                                                  ),
                                                ),
                                                SizedBox(width: 5.w,),
                                                Container(
                                                  height: 35.h,
                                                  width: 35.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: Color.fromARGB(255,213,84,78),
                                                  ),
                                                  child: RawMaterialButton(
                                                    onPressed: (){
                                                    },
                                                    child: Icon(Icons.delete_forever_outlined,color: Colors.white,size: 31.h,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              )
            ],
          ),

           */
            ),
      ),
    );
  }
}
