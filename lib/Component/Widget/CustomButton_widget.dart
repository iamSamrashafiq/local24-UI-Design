import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() press;
  final double radius;
  final double height;
  final double width;
  final Color color;
  final TextStyle style;
  final double buttonHeight;

  const CustomButton({Key key,
  @required this.text,
    this.press,
    this.style,
    this.buttonHeight,
    @required this.radius,
    @required this.height,
    @required this.width,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      width: 100,
      child:DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius)),
          child: Container(
            width:width,
            child: ElevatedButton(
              onPressed: press,
              child: Text(
                text.tr,
                style: style,
              ),
              style: ElevatedButton.styleFrom(
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
