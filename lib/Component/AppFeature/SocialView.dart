import 'package:flutter/material.dart';
import 'package:local24/Component/Widget/SocialTile.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:url_launcher/url_launcher.dart';


class SocialMediaView extends StatefulWidget {
  const SocialMediaView({Key key}) : super(key: key);

  @override
  State<SocialMediaView> createState() => _SocialMediaViewState();
}

class _SocialMediaViewState extends State<SocialMediaView> {

  //change these link given below
  final Uri facebookUrl = Uri.parse('https://www.facebook.com/');
  final Uri twitterUrl = Uri.parse('https://www.twitter.com/');
  final Uri whatsappUrl = Uri.parse('https://api.whatsapp.com/');
  final Uri youtubeUrl = Uri.parse('https://www.youtube.com/');
  final Uri instagramUrl = Uri.parse('https://www.instagram.com/');

  _openFacebook() async {
    if (await canLaunchUrl(facebookUrl)) {
      await launchUrl(facebookUrl);
    } else {
      throw 'Could not launch $facebookUrl';
    }
  }
  _openTwitter() async {
    if (await canLaunchUrl(twitterUrl)) {
      await launchUrl(twitterUrl,);
    } else {
      throw 'Could not launch $twitterUrl';
    }
  }
  _openYoutube() async {
    if (await canLaunchUrl(youtubeUrl)) {
      await launchUrl(youtubeUrl);
    } else {
      throw 'Could not launch $youtubeUrl';
    }
  }
  _openWhatsapp() async {
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  _openInstagram() async {
    if (await canLaunchUrl(instagramUrl)) {
      await launchUrl(instagramUrl);
    } else {
      throw 'Could not launch $instagramUrl';
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height*0.03,),
        Divider(color: Colors.grey.shade300,thickness: 1,),
        SizedBox(height: size.height*0.03,),

        SocialTiles(
          onTap: (){
            _openFacebook();
          },
          leadingIcon:Image.asset(facebook,width: 40,) ,
          text: 'Facebook',
        ),
        SocialTiles(
          onTap: (){
            print('Twitter');
         _openTwitter();
          },
          leadingIcon: Image.asset(twitter,width: 40,) ,
          text: 'Twitter',
        ),
        SocialTiles(
          onTap: (){
           _openYoutube();
          },
          leadingIcon: Image.asset(youtube,width:40,) ,
          text: 'Youtube',
        ),
        SocialTiles(
          onTap: (){
          _openInstagram();
          },
          leadingIcon: Image.asset(instagram,width: 40,) ,
          text: 'Instagram',
        ),
        SocialTiles(
          onTap: (){
         _openWhatsapp();
          },
          leadingIcon:Image.asset(whatsapp,width: 40,) ,
          text: 'Whatsapp',
        ),

        SizedBox(height: size.height*0.03,),
        Divider(color: Colors.grey.shade300,thickness: 1,),
        SizedBox(height: size.height*0.03,),
      ],
    );
  }
}
