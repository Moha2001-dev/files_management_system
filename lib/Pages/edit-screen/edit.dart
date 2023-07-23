

import 'package:flutter/material.dart';

class EditFile extends StatefulWidget {
  const EditFile({super.key});

  @override
  State<EditFile> createState() => _editFileState();
}

class _editFileState extends State<EditFile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Edit File Page',style: TextStyle(fontSize: 50),),
    );
  }
}
