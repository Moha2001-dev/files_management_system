import 'dart:io';

import 'package:files_management_system/Pages/home-screen/home-widgets/DeleteAlert.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:files_management_system/models/ApplicationSettings.dart';
import 'package:files_management_system/models/fms_file.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

///[FileItem] is a widget that build one file card/item and present it.
class FileItem extends StatefulWidget {
  FileItem(this.index, this.files, this.deleteCallBack, {super.key});

  int index;
  FMSFile files;
  Function deleteCallBack;

  @override
  State<FileItem> createState() => _FileItemState();
}

class _FileItemState extends State<FileItem> {
  late SettingsInterface settingsInterface;
  bool? deleteCheckBox;

  _FileItemState() {
    settingsInterface = SettingsInterface();
    deleteCheckBox = settingsInterface.getSettings()?.getDeleteCheckBox();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 1691.w,
        height: 51,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 0, 0, 0))),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(right: 9.w),
                child: Text(
                  (widget.index + 1).toString(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 112, 112, 112),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 20,
              child: Align(
                alignment: Alignment.centerRight,
                child: Tooltip(
                  message: widget.files.title ?? "",
                  child: Text(
                    widget.files.title ?? "",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 112, 112, 112),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 18,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Tooltip(
                    message: widget.files.fileNum,
                    child: Text(
                      widget.files.fileNum,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 112, 112, 112),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 11,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Tooltip(
                      message: (widget.files.date ?? "").isNotEmpty
                          ? DateFormat('yyyy/MM/dd')
                              .format(DateTime.parse(widget.files.date ?? ""))
                          : "",
                      child: Text(
                        (widget.files.date ?? "").isNotEmpty
                            ? DateFormat('yyyy/MM/dd')
                                .format(DateTime.parse(widget.files.date ?? ""))
                            : "",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 112, 112, 112),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 34,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Tooltip(
                      message: widget.files.path,
                      child: Text(
                        (widget.files.path.length >
                                (MediaQuery.of(context).size.width /
                                    (1920 / 53)))
                            ? widget.files.path.substring(
                                    0,
                                    (MediaQuery.of(context).size.width /
                                                (1920 / 53))
                                            .floor() -
                                        3) +
                                "..."
                            : (widget.files.path),
                        textAlign: TextAlign.right,
                        textDirection: ui.TextDirection.ltr,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 112, 112, 112),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                    ))),
            const SizedBox(
              width: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: 35.w > 35 ? 35 : 35.w,
                    height: 35.w > 35 ? 35 : 35.w,
                    margin: EdgeInsets.only(left: 5.w),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 54, 121, 175),
                        borderRadius: BorderRadius.circular(5.sp)),
                    child: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white,
                        size: 21.w > 21 ? 21 : 21.w,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () async{
                        File file = File(widget.files.path);
                        if(await file.exists()){
                          Process.run(widget.files.path, [],runInShell: true);
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(content: Row(
                              children: [
                                Icon(Icons.error,color: Colors.red,),
                                SizedBox(width: 16,),
                                Text('ملف المعاملة غير موجود!'),
                              ],
                            )),
                          );
                        }
                      },
                    )),
                Container(
                    width: 35.w > 35 ? 35 : 35.w,
                    height: 35.w > 35 ? 35 : 35.w,
                    margin: EdgeInsets.only(left: 5.w),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 174, 78),
                        borderRadius: BorderRadius.circular(5.sp)),
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 21.w > 21 ? 21 : 21.w,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                    )),
                Container(
                    width: 35.w > 35 ? 35 : 35.w,
                    height: 35.w > 35 ? 35 : 35.w,
                    margin: EdgeInsets.only(left: 5.w),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 213, 84, 78),
                        borderRadius: BorderRadius.circular(5.sp)),
                    child: IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 21.w > 21 ? 21 : 21.w,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (!(deleteCheckBox ?? false)) {
                          showDialog(
                              context: context,
                              builder: (context) => DeleteFile(
                                  widget.files.fileNum,
                                  deleteCheckBox,
                                  widget.deleteCallBack) //to be checked
                              );
                        } else {
                          widget.deleteCallBack(widget.files.fileNum);
                        }
                      },
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
