
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local24/Component/HomePage/HomeAds/Google_BannerAds.dart';
import 'package:local24/Component/HomePage/HomeAds/MobAds.dart';
import 'package:local24/Component/HomePage/HomeSection1/Home_Section1UserData.dart';
import 'package:local24/Component/HomePage/HomeSection1/Home_Section1_PostSocial.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:local24/Screens/RealEstate_Listing/CreateListing.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'Home_VideoItem.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class HomeSection1 extends StatefulWidget {
  const HomeSection1({Key key}) : super(key: key);

  @override
  State<HomeSection1> createState() => _HomeSection1State();
}

class _HomeSection1State extends State<HomeSection1> {

  CarouselSliderController _carouselSliderController=CarouselSliderController();
  VideoPlayerController controller;
  final urlLandscapeVideo =
      'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4';


  @override
  void initState() {
    super.initState();
    FacebookAudienceNetwork.init(
        testingId: "a77955ee-3304-4635-be65-81029b0f5201", //optional
        // iOSAdvertiserTrackingEnabled: fale //default false
    );
    controller = VideoPlayerController.network(urlLandscapeVideo)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.pause());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final  isMute = controller.value.volume==0;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: color,
        child: Icon(Icons.edit),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///post card
          Container(
              padding: EdgeInsets.symmetric( horizontal: 10),
              child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      print('Open this Card');
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 0,
                        child: Column(
                          children: [
                            // Container(
                            //   margin: EdgeInsets.symmetric(
                            //       vertical: 10, horizontal: 10),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Container(
                            //         child: Text(
                            //           'New Restaurant open in Town',
                            //           style: postTitle,
                            //         ),
                            //       ),
                            //       FaIcon(
                            //         FontAwesomeIcons.ellipsis,
                            //         color: Colors.grey,
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   margin: EdgeInsets.symmetric(horizontal: 10),
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         child: CircleAvatar(
                            //             radius: 25,
                            //             backgroundImage: NetworkImage(
                            //               'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                            //             )
                            //             // child: Image.network('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                            //             ),
                            //       ),
                            //       Container(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Column(
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.start,
                            //           children: [
                            //             Row(
                            //               children: [
                            //                 Text(
                            //                   'local360',
                            //                   style: postUserName,
                            //                 ),
                            //                 Container(
                            //                   child: Image.asset(
                            //                     verified,
                            //                     width: size.width * 0.04,
                            //                   ),
                            //                 )
                            //               ],
                            //             ),
                            //             Container(
                            //               width: size.width * 0.7,
                            //               child: Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text(
                            //                     'New Delhi',
                            //                     style: postDetail,
                            //                   ),
                            //                   Text(
                            //                     '5 hour ago',
                            //                     style: postDetail,
                            //                     textAlign: TextAlign.right,
                            //                   ),
                            //                 ],
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            HomeSection1UserData(), //copy paste this page code here to make every thing work in Index Id
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            HomeSection1PostSocial(),

                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            ///Video Card for native
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      print('Video card');
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 0,
                        child: Column(
                          children: [
                            HomeSection1UserData(),
                            SizedBox(
                              height: 10,
                            ),

                            Stack(
                              children: [
                                Container(
                                  child: VideoPlayerWidget(controller: controller,),
                                ),

                                if(controller !=null && controller.value.isInitialized )
                                  IconButton(
                                      onPressed: ()=>controller.setVolume(isMute?1:0),
                                      icon: Icon(
                                        isMute ? Icons.volume_mute :Icons.volume_up,
                                        color: Colors.white,
                                      )
                                  )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            HomeSection1PostSocial(),
                          ],
                        ),
                      ),
                    ),
                  );
                },

              ),

            ),
            ///video for youtube
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  String videoId;
                  videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=mhxoXm8lWIo");
                  YoutubePlayerController _controller = YoutubePlayerController(
                    initialVideoId:videoId,
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: true,
                      loop: false,
                      forceHD: false,
                      isLive: false,
                    ),
                  );
                  return Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                      child: Column(
                        children: [
                          HomeSection1UserData(),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            child:YoutubePlayer(
                              controller: _controller,
                              liveUIColor: Colors.amber,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          HomeSection1PostSocial(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            /// Top stories
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              elevation: 2,
              child: Stack(
                children: [
                  Container(
                    height: size.height*0.5,
                    width: 400,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: CarouselSlider.builder(
                      controller: _carouselSliderController,
                      unlimitedMode: true,
                      slideBuilder: (index) {
                        return GestureDetector(
                          onTap: (){
                            print('Top Stories');
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                          'https://images.pexels.com/photos/1191377/pexels-photo-1191377.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                                ),
                                SizedBox(height: 3,),
                                Container(
                                  child: Text('Story About Something Going on', style: topStoryTitle,),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Local360',
                                            style: breakingNewLocal,
                                          ),
                                          Container(
                                            child: Image.asset(
                                              verified,
                                              width: size.width * 0.06,
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        child:Text(
                                          'May 12,2022 9:30PM',
                                          style: breakingNewTime,
                                        ) ,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 3,
                      initialPage: 0,
                      enableAutoSlider: false,
                      slideTransform:const DefaultTransform(),
                      slideIndicator: CircularSlideIndicator(
                        padding: const EdgeInsets.only(bottom:80 ),
                        indicatorRadius: 10,
                        indicatorBackgroundColor: Colors.white.withOpacity(0.7),
                        currentIndicatorColor: Colors.amber.withOpacity(0.7),
                        itemSpacing:30,
                      ),

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: size.height*0.14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child:Container(
                            decoration: BoxDecoration(
                              shape:BoxShape.circle,
                              color: Colors.white.withOpacity(0.7)
                            ),
                            child: IconButton(
                              icon:FaIcon(FontAwesomeIcons.caretLeft),
                              onPressed: ()=>_carouselSliderController.previousPage(),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                shape:BoxShape.circle,
                                color: Colors.white.withOpacity(0.7)
                            ),
                            child: IconButton(
                              icon:FaIcon(FontAwesomeIcons.caretRight),
                              onPressed: ()=>_carouselSliderController.nextPage(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///advertisement card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          'Advertisement',
                          style: advertisement,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                          'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          color: shopNow,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Text(
                              'Shop Now',
                              style: advertisementShop,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Icon(
                              Icons.arrow_forward,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            ///breaking news card
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                      child: Text(
                        'Breaking News Stories',
                        style: breakingNewTitle,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: breakingNew.length,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: size.height * 0.15,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 2,
                            child: Row(
                              children: [
                                Container(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        breakingNew[index].breakingImage,
                                        width: size.width * 0.27,
                                        height: size.height * 0.12,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 6, top: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: size.width * 0.55,
                                        child: Text(
                                          breakingNew[index].headline,
                                          style: TextStyle(
                                              fontFamily: poppinsBold,
                                              fontSize: 12, ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Local360',
                                            style: breakingNewLocal,
                                          ),
                                          Container(
                                            child: Image.asset(
                                              verified,
                                              width: size.width * 0.06,
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.3),
                                        child: Text(
                                          'May 12,2022 9:30PM',
                                          style: breakingNewTime,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),

            //Button to Show Listing will remove later

            ElevatedButton(
                onPressed: (){
                  Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>CreateListing()));
                },
                child: Text('Show Listing')
            ),



            ///FaceBook Ads Card
            Container(
              // color: Colors.black54,
              height:size.height*0.3 ,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                elevation: 0,
                child: Column(
                  children: [
                    FacebookNativeAd(
                      placementId:"YOUR_PLACEMENT_ID",   /// add your placement id heree
                      adType: NativeAdType.NATIVE_AD,
                      width: double.infinity,
                      bannerAdSize:NativeBannerAdSize.HEIGHT_100,
                      backgroundColor: Colors.blue,
                      titleColor: Colors.white,
                      descriptionColor: Colors.white,
                      buttonColor: Colors.deepPurple,
                      buttonTitleColor: Colors.white,
                      buttonBorderColor: Colors.white,
                      keepAlive: true, //set true if you do not want adview to refresh on widget rebuild
                      keepExpandedWhileLoading: false, // set false if you want to collapse the native ad view when the ad is loading
                      expandAnimationDuraion: 300, //in milliseconds. Expands the adview with animation when ad is loaded
                      listener: (result, value) {
                        print("Native Ad: $result --> $value");
                      },
                    ),
                  ],
                ),
              ),
            ),


            SizedBox(height: 10,),
            /// Google Mob Ads
            MobileNativeAds(),

            GoogleBannerAds(),







          ],
        ),
      ),
    );
  }
}

class BreakingNews {
  String headline;
  String breakingImage;

  BreakingNews({
    this.headline,
    this.breakingImage,
  });
}

List<BreakingNews> breakingNew = [
  BreakingNews(
      headline: 'Story About Something that going on',
      breakingImage:
          'https://br24.com/wp-content/uploads/Br24_Blog_FoodPhotography_OverheadAngle.jpg'),
  BreakingNews(
      headline: 'Story About Something that going on',
      breakingImage:
          'https://br24.com/wp-content/uploads/Br24_Blog_FoodPhotography_OverheadAngle.jpg'),
  BreakingNews(
      headline: 'Story About Something that going on',
      breakingImage:
          'https://br24.com/wp-content/uploads/Br24_Blog_FoodPhotography_OverheadAngle.jpg'),
  BreakingNews(
      headline: 'Story About Something that going on',
      breakingImage:
          'https://br24.com/wp-content/uploads/Br24_Blog_FoodPhotography_OverheadAngle.jpg'),
];
