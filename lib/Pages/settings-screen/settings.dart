

import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _settings();
}

class _settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings',style: TextStyle(fontSize: 50),),
    );
  }
}