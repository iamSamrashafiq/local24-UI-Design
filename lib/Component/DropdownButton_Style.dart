
import 'package:local24/Constant/App_Constant.dart';
import 'package:flutter/material.dart';

InputDecoration DropDownButtonDecoration(String hint){
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(fontFamily: poppinsRegular,fontSize: 14,color: Colors.grey),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300]),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey[300]),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color:  Colors.grey[300]),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red),
    ),

  );
}