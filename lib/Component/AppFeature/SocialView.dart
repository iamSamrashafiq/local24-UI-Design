import 'package:flutter/material.dart';
import 'package:local24/Component/Widget/SocialTile.dart';
import 'package:local24/Constant/App_Constant.dart';

class SocialMediaView extends StatelessWidget {
  const SocialMediaView({Key key}) : super(key: key);

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
            print('Facebook');
          },
          leadingIcon:Image.asset(facebook,width: 40,) ,
          text: 'Facebook',
        ),
        SocialTiles(
          onTap: (){
            print('Twitter');
          },
          leadingIcon: Image.asset(twitter,width: 40,) ,
          text: 'Twitter',
        ),
        SocialTiles(
          onTap: (){
            print('Youtube');
          },
          leadingIcon: Image.asset(youtube,width:40,) ,
          text: 'Youtube',
        ),
        SocialTiles(
          onTap: (){
            print('Instagram');
          },
          leadingIcon: Image.asset(instagram,width: 40,) ,
          text: 'Instagram',
        ),
        SocialTiles(
          onTap: (){
            print('Whatsapp');
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
