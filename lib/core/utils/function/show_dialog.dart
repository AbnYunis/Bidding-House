import 'package:flutter/material.dart';

Future showDialogFun(context,widget,h,w){
   return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.symmetric(
            horizontal: w * 0.04, vertical: h * 0.02),
        content:  widget,
      );
    },
  );
}