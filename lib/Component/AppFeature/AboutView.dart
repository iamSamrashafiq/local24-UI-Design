import 'package:flutter/material.dart';
import 'package:local24/Component/AboutTiles.dart';

class AppFeatureAboutView extends StatelessWidget {
  const AppFeatureAboutView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height*0.03,),
        Divider(color: Colors.grey.shade300,thickness: 1,),
        SizedBox(height: size.height*0.03,),

        Container(
          child: AboutListTiles(
            leadingIcon: Icons.people_alt,
            text: 'TeluguStop Team',
            trailingIcon: Icons.keyboard_arrow_right,
          ),
        ),
        Container(
          child: AboutListTiles(
            leadingIcon: Icons.perm_contact_cal,
            text: 'Contact Us',
            trailingIcon: Icons.keyboard_arrow_right,
          ),
        ),
        Container(
          child: AboutListTiles(
            leadingIcon: Icons.privacy_tip,
            text: 'Privacy Policy ',
            trailingIcon: Icons.keyboard_arrow_right,
          ),
        ),
        Container(
          child: AboutListTiles(
            leadingIcon: Icons.event_note,
            text: 'Terms ',
            trailingIcon: Icons.keyboard_arrow_right,
          ),
        ),

      ],
    );
  }
}
