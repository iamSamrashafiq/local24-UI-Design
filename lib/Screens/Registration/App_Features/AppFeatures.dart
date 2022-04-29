import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:local24/Component/AppFeature/AboutView.dart';
import 'package:local24/Component/AppFeature/SocialView.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:fswitch/fswitch.dart';

enum NewsDisplayMode { AppMode, ListMode, ShortMode }

class AppFeatures extends StatefulWidget {
  const AppFeatures({Key key}) : super(key: key);

  @override
  State<AppFeatures> createState() => _AppFeaturesState();
}

class _AppFeaturesState extends State<AppFeatures> {
  bool switchVal = true;
  NewsDisplayMode _mode =NewsDisplayMode.AppMode;
  bool first = false;
  bool second = false;
  bool third = false;
  bool forth = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width:size.width*0.25,
                      height:size.height*0.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/loca24_screeheadings.png",),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                    Container(
                      width: size.width*0.6,
                      child: Text('Please select App Feature',style: detailPageTitle,),
                    )
                  ],
                ),
                SizedBox(height: size.height*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text('Notification',style: featureSubHeading,),
                        ),
                        Container(
                          child: Text('Please turn on if you want to receive updates',style: featureTxt,),
                        ),
                      ],
                    ),
                    Container(
                      child: FSwitch(
                        offset: 2.0,
                        width: 60,
                        height: 25,
                        open: switchVal,
                        openColor: color,
                        onChanged: (v) {
                          switchVal = v;
                          print(switchVal);
                        },
                        closeChild: Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.white,
                        ),
                        openChild: Icon(
                          Icons.check,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height*0.03,),
                Container(
                  child: ExpandablePanel(
                    header:  RichText(
                      text: TextSpan(
                        text: 'News Display Mode  \n',
                        style:featureSubHeading,
                        children: const <TextSpan>[
                          TextSpan(text: 'App Default Mode:Big Image View',style:featureTxt),
                        ],
                      ),
                    ),
                    expanded:NewMode(context) ,
                    collapsed: null,
                    theme: ExpandableThemeData(
                      iconColor: Colors.grey,
                    ),

                  ),
                ),
                SizedBox(height: size.height*0.03,),
                Container(
                  child: ExpandablePanel(
                    header:  RichText(
                      text: TextSpan(
                        text: 'App Home Feed Display  \n',
                        style:featureSubHeading,
                        children: const <TextSpan>[
                          TextSpan(text: 'Please choose Your Home Feed News',style:featureTxt),
                        ],
                      ),
                    ),
                    expanded:HomeFeedDisplay(context) ,
                    collapsed: null,
                    theme: ExpandableThemeData(
                      iconColor: Colors.grey,
                    ),

                  ),
                ),
                SizedBox(height: size.height*0.03,),
                Container(
                  child: RichText(
                    text: TextSpan(
                      text: 'Feed Posts Count  \n',
                      style:featureSubHeading,
                      children: const <TextSpan>[
                        TextSpan(text: '50',style:featureTxt),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height*0.03,),
                Divider(color: Colors.grey.shade300,thickness: 1,),
                SizedBox(height: size.height*0.03,),
                Container(
                  child: ExpandablePanel(
                    header:  RichText(
                      text: TextSpan(
                        text: 'Send Feedback  \n',
                        style:featureSubHeading,
                        children: const <TextSpan>[
                          TextSpan(text: 'Report Technical Issue or Suggest New Features',style:featureTxt),
                        ],
                      ),
                    ),
                    expanded:null ,
                    collapsed: null,
                    theme: ExpandableThemeData(
                      iconColor: Colors.grey,
                    ),

                  ),
                ),
                SizedBox(height: size.height*0.03,),
                Container(
                  child: RichText(
                    text: TextSpan(
                      text: 'Version \n',
                      style:featureSubHeading,
                      children: const <TextSpan>[
                        TextSpan(text: '1.0.0',style:featureTxt),
                      ],
                    ),
                  ),
                ),

                AppFeatureAboutView(),

                SocialMediaView(),

                // SizedBox(height: size.height*0.03,),
                // Divider(color: Colors.grey.shade300,thickness: 1,),
                // SizedBox(height: size.height*0.03,),
                //
                // ListTileWithIcon(
                //   leadingIcon:FaIcon(FontAwesomeIcons.facebookSquare,color: Colors.indigo,size: 30,) ,
                //   text: 'Facebook',
                // ),
                // ListTileWithIcon(
                //   leadingIcon: FaIcon(FontAwesomeIcons.twitterSquare,color: Colors.blueAccent,size: 30,),
                //   text: 'Twitter',
                // ),
                // ListTileWithIcon(
                //   leadingIcon: FaIcon(FontAwesomeIcons.youtubeSquare,color: Colors.redAccent,size: 30,),
                //   text: 'Youtube',
                // ),
                // ListTileWithIcon(
                //   leadingIcon: FaIcon(FontAwesomeIcons.instagramSquare,color: Colors.red,size: 30),
                //   text: 'Instagram',
                // ),
                // ListTileWithIcon(
                //   leadingIcon: FaIcon(FontAwesomeIcons.whatsappSquare,color: Colors.green,size: 30,),
                //   text: 'Instagram',
                // ),
                // SizedBox(height: size.height*0.03,),
                // Divider(color: Colors.grey.shade300,thickness: 1,),
                // SizedBox(height: size.height*0.03,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Share the app  \n',
                        style:featureSubHeading,
                        children: const <TextSpan>[
                          TextSpan(text: 'Please Share your app to your friends',style:featureTxt),
                        ],
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
                SizedBox(height: size.height*0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Rate Us  \n',
                        style:featureSubHeading,
                        children: const <TextSpan>[
                          TextSpan(text: 'Please Give Rating at Playstore',style:featureTxt),
                        ],
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
                SizedBox(height: size.height*0.03,),






              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget NewMode(BuildContext context) =>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListTile(
        dense:true,
        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,top: 5.0),
        title: const Text('App Mode: Post will display in Big Thumb image',style: featureListTitle,),
        leading: Radio(
          activeColor: buttonColor,
          value: NewsDisplayMode.AppMode,
          groupValue: _mode,
          onChanged: (NewsDisplayMode value) {
            setState(() {
              _mode = value;
            });
          },
        ),
      ),
      ListTile(
        dense:true,
        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,top: 5.0),
        title: const Text('List Mode: Post will display in Small Thumb image',style: featureListTitle,),
        leading: Radio(
          activeColor: buttonColor,
          value: NewsDisplayMode.ListMode,
          groupValue: _mode,
          onChanged: (NewsDisplayMode value) {
            setState(() {
              _mode = value;
            });
          },
        ),
      ),
      ListTile(
        dense:true,
        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,top: 5.0),
        title: const Text('Short news Mode: News display in short format',style: featureListTitle,),
        leading: Radio(
          activeColor: buttonColor,
          value: NewsDisplayMode.ShortMode,
          groupValue: _mode,
          onChanged: (NewsDisplayMode value) {
            setState(() {
              _mode = value;
            });
          },
        ),
      ),
    ],
  );

  Widget HomeFeedDisplay(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            activeColor: buttonColor,
            value: this.first,
            onChanged: (bool value) {
              setState(() {
                this.first = value;
              });
            },
          ),
          Text('English News ',style: featureCheckText, ),

        ],
      ),
      Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            activeColor: buttonColor,
            value: this.second,
            onChanged: (bool value) {
              setState(() {
                this.second = value;
              });
            },
          ),
          Text('Video ',style: featureCheckText, ),

        ],
      ),
      Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            activeColor: buttonColor,
            value: this.third,
            onChanged: (bool value) {
              setState(() {
                this.third = value;
              });
            },
          ),
          Text('Local News ',style: featureCheckText, ),

        ],
      ),
      Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            activeColor: buttonColor,
            value: this.forth,
            onChanged: (bool value) {
              setState(() {
                this.forth = value;
              });
            },
          ),
          Text('Favorite Topic ',style:featureCheckText , ),

        ],
      ),

    ],
  );

}

// class ListTileWithIcon extends StatelessWidget {
//   String text;
//   Widget leadingIcon;
//  ListTileWithIcon({
//     Key key,
//     this.text,
//     this.leadingIcon,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       dense: true,
//       contentPadding: EdgeInsets.only(left: 0.0,right:0.0),
//       leading: leadingIcon,
//       title: Text(text),
//       trailing: Icon(Icons.keyboard_arrow_right),
//     );
//   }
// }


