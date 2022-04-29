import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CustomElevatedbutton extends StatelessWidget {
  final String text;
  final Function() press;
  final double radius;
  final double height;
  final double width;
  final Color color;
  final TextStyle style;
  final double buttonheight;
  final Color grad;

  CustomElevatedbutton({
    Key key,
    @required this.text,
    this.press,
    this.style,
    this.buttonheight,
    @required this.radius,
    @required this.height,
    @required this.width,
    @required this.color,
    this.grad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonheight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: grad == null ? null : grad,
          gradient: grad == null
              ? LinearGradient(
              colors: [Color(0xffFFD500), Color(0xffFFBC00)],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)
              : null,
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        child: ElevatedButton(
          onPressed: press,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
            child: Text(
              text.tr,
              style: style,
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(color: Colors.transparent))),
          // style: ButtonStyle(
          //     elevation: MaterialStateProperty.resolveWith<double>(
          //       (Set<MaterialState> states) {
          //         return 6.0;
          //       },
          //     ),
          //     backgroundColor: MaterialStateProperty.all(color),
          //     overlayColor: MaterialStateProperty.all(Colors.amber),
          //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //         RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(radius),
          //             side: BorderSide(color: Colors.transparent)))),
        ),
      ),
    );
  }
}
