import 'package:flutter/material.dart';
import 'package:files_management_system/models/ApplicationSettings.dart';
import 'package:files_management_system/sqldb.dart';

///[DeleteFile] is a class responsible for delete confirmation and deletion
class DeleteFile extends StatefulBuilder {
  DeleteFile(String fileNumber,bool? deleteCheckBox,Function deleteCallBack):super(
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
                            const Text(
                              'تأكيد الحذف',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              'سيتم حذف المعاملة رقم: $fileNumber',
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: deleteCheckBox,
                                  onChanged: (select){
                                    setState(() {
                                      deleteCheckBox = select;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  side: const BorderSide(
                                    color: Color.fromARGB(255, 112, 112, 112),
                                    width: 2,
                                  ),
                                  splashRadius: 0,
                                  activeColor: const Color.fromARGB(255, 55, 122, 176),
                                ),
                                const SizedBox(width: 4,),
                                const Text(
                                  'عدم تكرار الرسالة(يمكن تغيير الخيار من الاعدادات)',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              width: 507,
                              height: 69,
                              decoration: const BoxDecoration(
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
                                    margin: const EdgeInsets.only(right: 8),
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
                                      onPressed: () async {

                                        //Save delete checkbox Settings
                                          int saveData = ((deleteCheckBox?? false)? 1 : 0);

                                          SqlDb sql = SqlDb();
                                          int response = await sql.updateData("UPDATE 'Settings' SET DeleteCheckBox = $saveData");

                                          SettingsInterface settingsInterface = SettingsInterface();
                                          settingsInterface.getSettings()?.setDeleteCheckBox(saveData);

                                        //setter call back in order to delete file and update state
                                        deleteCallBack(fileNumber);

                                        //Exit Delete Dialog
                                        Navigator.of(context, rootNavigator: true).pop();
                                      },
                                      padding: EdgeInsets.zero,
                                      child: const Text(
                                        'حذف',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 16),
                                    child: RawMaterialButton(
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: (){
                                        Navigator.of(context, rootNavigator: true).pop();
                                      },
                                      padding: EdgeInsets.zero,
                                      child: const Text(
                                        'الغاء',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 25,
                                            color: Colors.black
                                        ),
                                      ),
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
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 213, 84, 78),
                          ),
                          child:const Icon(
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
}
