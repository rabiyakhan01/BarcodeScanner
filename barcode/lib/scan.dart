import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String barcode = "";
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text('Code Scanner'),
        centerTitle: true,
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
              child: RaisedButton(
                color:Colors.purple ,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: scan,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.scanner,size:40,),
                    SizedBox(height: 2,),
                    Text("Click here for camera scan")
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
              child: Text(barcode,textAlign:TextAlign.center,),
            )
          ],
         ),
      ),
    );
  }
  Future scan() async {
try{
  String barcode= await BarcodeScanner.scan();
  setState((){
    this.barcode=barcode;
  });
}on PlatformException catch(e){
  if(e.code == BarcodeScanner.CameraAccessDenied){
    setState((){
      this.barcode='camera permission not granted';
    });
  }else{
    setState((){
      this.barcode='unknown error:$e';
    });
  }
  }on FormatException {
   setState((){
      this.barcode = 'null(user  returned using the "back"-button before scanning anything,Result)';
   }); 
  }catch(e){
    setState((){
      this.barcode='unknown error:$e ';
    });
  }
}

}

