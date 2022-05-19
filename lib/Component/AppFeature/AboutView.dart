import 'package:flutter/material.dart';
import 'package:local24/Component/Widget/AboutTiles.dart';
import 'package:url_launcher/url_launcher.dart';

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

        InkWell(
          onTap: ()async{
            final Uri url = Uri.parse('http://geo.telugustop.com//privacy');
              if(await canLaunchUrl(url) ){
                await launchUrl(
                  url,
                );
            }
          },
          child: Container(
            child: AboutListTiles(
              leadingIcon: Icons.people_alt,
              text: 'TeluguStop Team',
              trailingIcon: Icons.keyboard_arrow_right,
            ),
          ),
        ),
        InkWell(
          onTap: ()async{
            final Uri url = Uri.parse('http://geo.telugustop.com//privacy');   //change the link
            if(await canLaunchUrl(url) ){
              await launchUrl(
                url,
              );
            }
          },
          child: Container(
            child: AboutListTiles(
              leadingIcon: Icons.perm_contact_cal,
              text: 'Contact Us',
              trailingIcon: Icons.keyboard_arrow_right,
            ),
          ),
        ),
        InkWell(
          onTap: ()async{
            final Uri url = Uri.parse('http://geo.telugustop.com//privacy'); //change link here
            if(await canLaunchUrl(url) ){
              await launchUrl(
                url,
              );
            }
          },
          child: Container(
            child: AboutListTiles(
              leadingIcon: Icons.privacy_tip,
              text: 'Privacy Policy ',
              trailingIcon: Icons.keyboard_arrow_right,
            ),
          ),
        ),
        InkWell(
          onTap: ()async{
            final Uri url = Uri.parse('http://geo.telugustop.com//privacy');
            if(await canLaunchUrl(url) ){
              await launchUrl(
                url,
              );
            }
          },
          child: Container(
            child: AboutListTiles(
              leadingIcon: Icons.event_note,
              text: 'Terms ',
              trailingIcon: Icons.keyboard_arrow_right,
            ),
          ),
        ),

      ],
    );
  }
}
