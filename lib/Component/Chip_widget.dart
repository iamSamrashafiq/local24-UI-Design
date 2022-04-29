import 'package:local24/Constant/App_Constant.dart';
import 'package:flutter/material.dart';

List<String> interests = [];

// chips helper
Widget chipBuilder({String title, Function onTap}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(12, 4, 10, 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: buttonColor,
    ),
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          title ?? "Data",
          style: TextStyle(
            color: Colors.white,
            fontFamily: poppinsRegular,
            fontSize: 13,
          ),
        ),
        SizedBox(width: 4),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.cancel,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    ),
  );


}