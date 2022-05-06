import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local24/Constant/App_Constant.dart';

class HomeSection1PostSocial extends StatelessWidget {
  const HomeSection1PostSocial({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.45,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: FaIcon(
                        FontAwesomeIcons.solidHeart,
                        color: iconColor,
                      ),
                    ),
                    Container(
                      child: FaIcon(
                        FontAwesomeIcons.solidComment,
                        color: iconColor,
                      ),
                    ),
                    Container(
                      child: FaIcon(
                        FontAwesomeIcons.solidPaperPlane,
                        color: iconColor,
                      ),
                    ),
                    Container(
                      child: FaIcon(
                        FontAwesomeIcons.facebook,
                        color: iconColor,
                      ),
                    ),
                    Container(
                      child: Image.asset(postWhatsapp),
                    ),
                  ],
                ),
              ),
              Container(
                child: FaIcon(
                  FontAwesomeIcons.solidBookmark,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Container(
                width: size.width * 0.45,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '8',
                      style: postView,
                    ),
                    Text(
                      '12',
                      style: postView,
                    ),
                    Text(
                      '1002',
                      style: postView,
                    ),
                    Text(
                      '199',
                      style: postView,
                    ),
                    Text(
                      '12',
                      style: postView,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
