import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class MyAlertDialog {
  final String title;
  final String message;
  
  BuildContext context;

  MyAlertDialog({
    this.title = 'Title',
    this.message = 'Message',
    required this.context
  });

  void showConfirmAlert({VoidCallback? execute = null}) {
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(this.title),
          content: Text(this.message),
          actions: <Widget>[
            TextButton(
              child: Text("Ok"),
              onPressed: () => execute == null ?
                Navigator.of(context).pop() :
                execute()
            )
          ]
        );
      }
    );
  }

  void showYesOrNoAlert({VoidCallback? chooseYes = null, VoidCallback? chooseNo = null}) {
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(this.title),
          content: Text(this.message),
          actions: <Widget>[
            TextButton(
              child: Text("Sim"),
              onPressed: () => chooseYes == null ? 
              Navigator.of(context).pop() :
              chooseYes()
            ),
            TextButton(
              child: Text("Não"),
              onPressed: () => chooseNo == null ? 
              Navigator.of(context).pop() :
              chooseNo()
            )
          ]
        );
      }
    );
  }

  Future<bool> closeApp() async {
    return await showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(this.title),
          content: Text(this.message),
          actions: <Widget>[
            TextButton(
              child: Text("Sim"),
              onPressed: () {
                Navigator.of(context).pop(true);
                /*
                if(Platform.isAndroid) SystemNavigator.pop();
                else if(Platform.isIOS) exit(0);
                */
                exit(0);
              }
            ),
            TextButton(
              child: Text("Não"),
              onPressed: () => Navigator.of(context).pop(false)
            )
          ]
        );
      }
    ) ?? false;   
  }
}