import 'package:files_management_system/Pages/add-screen/add.dart';
import 'package:files_management_system/Pages/home-screen/home-widgets/SearchBar.dart';
import 'package:files_management_system/Pages/settings-screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///[AppBar] is A custom appbar used to configure home appbar only
class HomeAppbar extends PreferredSize {
  HomeAppbar(BuildContext context,Function getSearchCallBack):super(
      preferredSize: const Size.fromHeight(80),
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
            SearchBar(getSearchCallBack: getSearchCallBack,),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(right: 32),
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
                              icon: const Icon(
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
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 54, 121, 175),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11))
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 15,),
                    Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddFile()));
                          },
                          icon: const Icon(
                            Icons.add_circle_outlined,
                            color: Color.fromARGB(255, 112, 112, 112),
                            size: 35,
                          ),
                        )
                    ),
                    const SizedBox(width: 15,),
                    Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Settings()),
                            );
                          },
                          icon: const Icon(
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
                                children:const [
                                  Icon(
                                    Icons.home,
                                    color: Color.fromARGB(255, 54, 121, 175),
                                    size: 24,
                                  ),
                                  SizedBox(
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
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 54, 121, 175),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11))
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Align(
                        alignment: Alignment.center,
                        child: RawMaterialButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddFile()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                                Icon(
                                Icons.add_circle_outlined,
                                color: Color.fromARGB(255, 112, 112, 112),
                                size: 24,
                              ),
                              SizedBox(
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
                    const SizedBox(width: 20,),
                    Align(
                        alignment: Alignment.center,
                        child: RawMaterialButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Settings()),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.settings,
                                color: Color.fromARGB(255, 112, 112, 112),
                                size: 24,
                              ),
                              SizedBox(
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
                ),
              ),
            )
          ],
        ),
      )
  );
}



