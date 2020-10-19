import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:storage_capacity/storage_capacity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await StorageCapacity.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  var _size = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Storage Capacity'),
        ),
        body: Center(
            child: Column(children: [
          Padding(padding: EdgeInsets.all(12), child: Text('Storage Space')),
          Padding(padding: EdgeInsets.all(12), child: Text(_size)),
          RaisedButton(
            onPressed: () async {
              var freeSpace = await StorageCapacity.getFreeSpace;
              setState(() {
                _size = "Free Space " + freeSpace.toString() + " bytes";
                ;
              });
            },
            child: Text("Free Space"),
            color: Colors.blue,
            elevation: 0,
            textColor: Colors.white,
          ),
          RaisedButton(
            onPressed: () async {
              var occupiedSpace = await StorageCapacity.getOccupiedSpace;
              setState(() {
                _size = "Occupied Space " + occupiedSpace.toString() + " bytes";
                ;
              });
            },
            child: Text("Occupied Space"),
            color: Colors.blue,
            elevation: 0,
            textColor: Colors.white,
          ),
          RaisedButton(
            onPressed: () async {
              var totalSpace = await StorageCapacity.getTotalSpace;
              setState(() {
                _size = "Total Space " + totalSpace.toString() + " bytes";
              });
            },
            child: Text("Total Space"),
            color: Colors.blue,
            elevation: 0,
            textColor: Colors.white,
          ),
          RaisedButton(
            onPressed: () async {
              dynamic totalSpace = await StorageCapacity.getTotalSpace;
              totalSpace = StorageCapacity.toGigaBytes(
                  double.parse(totalSpace.toString()));
              totalSpace =
                  StorageCapacity.searchCapacity(double.parse(totalSpace));

              setState(() {
                _size = totalSpace.toString();
              });
            },
            child: Text("Get Capacity"),
            color: Colors.blue,
            elevation: 0,
            textColor: Colors.white,
          ),
        ])),
      ),
    );
  }
}
