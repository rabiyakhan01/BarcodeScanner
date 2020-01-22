import 'package:flutter/material.dart';
import 'scan.dart';
import 'package:barcode/scan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return MaterialApp(
      title: 'Code Scanner',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ScanScreen(),
    );
  }
}
