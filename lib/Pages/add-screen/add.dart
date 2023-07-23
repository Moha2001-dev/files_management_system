

import 'package:flutter/material.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _addFileState();
}

class _addFileState extends State<AddFile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Add File Page',style: TextStyle(fontSize: 50),),
    );
  }
}