import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog({
  @required BuildContext context,
  @required String title,
  @required String content,
  @required String defaultActionText,
}) async {
  if (Platform.isIOS) {
    return await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                title,
                style: TextStyle(color: Colors.green[700]),
              ),
              content: Text(
                content,
                style: TextStyle(color: Colors.green[500]),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                    child: Text(defaultActionText,
                        style: TextStyle(color: Colors.green[500])),
                    onPressed: () => Navigator.of(context).pop())
              ],
            ));
  }
  return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              title,
              style: TextStyle(color: Colors.green[700]),
            ),
            content: Text(content, style: TextStyle(color: Colors.green[500])),
            actions: <Widget>[
              FlatButton(
                  child: Text(defaultActionText,
                      style: TextStyle(color: Colors.green[500])),
                  onPressed: () => Navigator.of(context).pop())
            ],
          ));
}
