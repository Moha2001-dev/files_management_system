import 'package:flutter/material.dart';

import 'package:files_management_system/Pages/home-screen/home.dart';
import 'package:files_management_system/Pages/loading-screen/loading.dart';
import 'package:files_management_system/models/ApplicationSettings.dart';


/// [Provider] Class helps loading settings and navigate between screens
/// as [Provider] class act like a base checkpoint whenever route tree get cleared.
class Provider extends StatefulWidget{
  const Provider({super.key});

  @override
  State<StatefulWidget> createState() => _ProviderState();
}

class _ProviderState extends State<Provider> {
  SettingsInterface settings = SettingsInterface();
  bool _isProviderLoaded = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _processingData(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.waiting && !_isProviderLoaded) {
          ///Splash Screen
          return const loading();
        } else {
          _isProviderLoaded = true;
          ///Main Screen
          return Home();
        }
      },
    );
  }

  Future<List> _processingData() {
    return Future.wait([
      settings.getSettings()!.loadSettings(),
    ]);
  }
}

