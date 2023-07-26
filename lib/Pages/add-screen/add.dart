

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _addFileState();
}

class _addFileState extends State<AddFile> {
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
                              onPressed: (){
                              },
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
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
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
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const AddFile()));
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
        child: AddArea(),
      ),
    );
  }
}


class AddArea extends StatefulWidget {
  const AddArea({super.key});

  @override
  State<AddArea> createState() => _AddAreaState();
}

class _AddAreaState extends State<AddArea> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
