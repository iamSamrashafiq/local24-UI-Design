import 'package:flutter/material.dart';
import 'package:local24/Constant/App_Constant.dart';

class SocialTiles extends StatelessWidget {
  String text;
  Widget leadingIcon;
  SocialTiles({
    Key key,
    this.text,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(left: 0.0,right:0.0),
      leading: leadingIcon,
      title: Text(text, style: TextStyle(fontFamily: poppinsRegular,fontSize: 15,color: Colors.black54)),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}