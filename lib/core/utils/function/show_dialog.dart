import 'package:bidding_house/core/utils/imports.dart';

Future showDialogFun(context,widget){
   return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.blueGrey,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w(context), vertical: 12.h(context)),
        content:  widget,
      );
    },
  );
}