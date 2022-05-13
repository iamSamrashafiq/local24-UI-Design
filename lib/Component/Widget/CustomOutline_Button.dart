import 'package:local24/Constant/App_Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final Function() press;
  final double radius;
  final double height;
  final double width;
  final Color color;
  final TextStyle style;
  final double buttonHeight;

  const CustomOutlineButton({Key key,
    @required this.text,
    this.press,
    this.style,
    this.buttonHeight,
    @required this.radius,
    @required this.height,
    @required this.width,
     this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      width: 100,
      child:DecoratedBox(
        decoration: BoxDecoration(
            // color: color,
            borderRadius: BorderRadius.circular(radius),
          border: Border.all(color:buttonColor, width: 1)

        ),
        child: Container(
          width:width,
          child: OutlinedButton(
            onPressed: press,
            child: Text(
              text.tr,
              style: style,
            ),
            style:  OutlinedButton.styleFrom(
                primary: color,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),

                )
            ),
          ),
        ),
      ),
    );
  }
}
