import 'package:flutter/material.dart';
import 'package:local24/Constant/App_Constant.dart';

class AboutListTiles extends StatelessWidget {
  String text;
  IconData leadingIcon;
  IconData trailingIcon;
  AboutListTiles({
    Key key,
    this.text,
    this.leadingIcon,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(left: 0.0,right:0.0),
      leading: Icon(leadingIcon,color: Colors.black54,),
      title: Text(text,style: TextStyle(fontFamily: poppinsRegular,fontSize: 15,color: Colors.black54),),
      trailing: Icon(trailingIcon),

    );
  }
}