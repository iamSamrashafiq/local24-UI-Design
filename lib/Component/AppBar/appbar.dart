import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:local24/Constant/App_Constant.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;


  CustomAppBar(
      { Key key,}) : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 130,
      leading:Container(
        child:  Image.asset(appBarImage,fit: BoxFit.cover,),
      ) ,
      backgroundColor:bgColor ,
      automaticallyImplyLeading: false,
      actions: [
        Container(
          padding: EdgeInsets.only(right: 10),
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Icon(Icons.account_circle_outlined,color: Colors.black,),
            //   IconButton(
            //     onPressed: (){},
            //     icon: Icon(Icons.account_circle_outlined,color: Colors.black,),
            //   ),
            //   IconButton(
            //     onPressed: (){},
            //     icon: Icon(Icons.search,color: Colors.black,),
            //   ),
             Icon(Icons.search,color: Colors.black),
              Badge(
                position: BadgePosition.topEnd(end: -4),

                badgeContent: Text('6',  style: TextStyle(color: Colors.white, fontSize: 11),),
                child: Icon(Icons.notifications_rounded,color: Colors.black,),
              ),
              Icon(Icons.settings,color: Colors.black),
            ],
          ),
        )
      ],
    );
  }
}

