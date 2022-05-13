import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:local24/Component/Widget/CustomButton_widget.dart';
import 'package:local24/Component/Widget/CustomOutline_Button.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:local24/Screens/RealEstate_Listing/Listing1.dart';
import 'package:local24/Screens/RealEstate_Listing/Listing2.dart';
import 'package:local24/Screens/RealEstate_Listing/Listing3.dart';
import 'package:local24/Screens/RealEstate_Listing/Listing4.dart';
import 'package:local24/Screens/RealEstate_Listing/Listing5.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:timeline_tile/timeline_tile.dart';


class CreateListing extends StatefulWidget {
  const CreateListing({Key key}) : super(key: key);

  @override
  State<CreateListing> createState() => _CreateListingState();
}

class _CreateListingState extends State<CreateListing> {

  double percentage;

  double value(){
    if(_currentStep==0){
      return percentage =0.25;
    }
    if (_currentStep == 1) {
      return  percentage =0.30;
    }
    if (_currentStep == 2) {
      return  percentage =0.70;
    }
    if (_currentStep == 3) {
      return  percentage =0.90;
    }
    if (_currentStep == 4) {
      return  percentage =0.96;
    }
  }

  String buttonText() {
    if (_currentStep == 0) {
      return 'Next'.tr;
    }
    if (_currentStep == 1) {
      return 'Next'.tr;
    }
    if (_currentStep == 2) {
      return 'Next'.tr;
    }
    if (_currentStep == 3) {
      return 'Next'.tr;
    }
    if (_currentStep == 4) {
      return 'Finish'.tr;
    }

    return '';
  }

  String bottomText(){
    if (_currentStep == 0) {
      return 'Real Estate'.tr;
    }
    if (_currentStep == 1) {
      return 'Location'.tr;
    }
    if (_currentStep == 2) {
      return 'Upload Photo'.tr;
    }
    if (_currentStep == 3) {
      return 'Listing Type'.tr;
    }
    if (_currentStep == 4) {
      return 'Over view'.tr;
    }

    return '';
  }

  String buttonTextP() {
    if (_currentStep == 0) {
      return 'Back'.tr;
    }
    if (_currentStep == 1) {
      return 'Back'.tr;
    }
    if (_currentStep == 2) {
      return 'Back'.tr;
    }
    if (_currentStep == 3) {
      return 'Back'.tr;
    }
    if (_currentStep == 4) {
      return 'Back'.tr;
    }
    return '';
  }

  continued() async {
    controller.animateToPage(_currentStep += 1,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  continuedP() async {
    if (_currentStep == 4) {
      controller.animateToPage(_currentStep =3,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
    if (_currentStep == 3) {
      controller.animateToPage(_currentStep = 2,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
    if (_currentStep == 2) {
      controller.animateToPage(_currentStep = 1,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      controller.animateToPage(_currentStep -= 1,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
  int _currentStep = 0;
  PageController controller;
  @override
  void initState() {
    controller = PageController(
      initialPage: 0,
    );
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // extendBody: true,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical:10),
          child: Stack(
            children: [
              Column(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width*0.64,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Enter Your Real Estate Listing Detail',
                                    style: titleStyle,
                                    children: const <TextSpan>[
                                      TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                              ),
                              Text('Provide details of your real estate listing',style: subTitleStyle,)
                            ],
                          ),
                        )

                      ],
                    ),
                    SizedBox(height: size.height*0.02,),
                    Container(
                      height: Get.height * 0.07,
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10.0),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            // width:Get.width*0.13,
                            flex: 1,
                            child: TimelineTile(
                              axis: TimelineAxis.horizontal,
                              alignment: TimelineAlign.manual,
                              lineXY: 0.1,
                              isFirst: true,
                              isLast: false,
                              indicatorStyle: IndicatorStyle(
                                width: Get.height*0.07,
                                height: Get.height*0.07,
                                indicator: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,

                                      color:color),
                                  child: Center(
                                    child: FaIcon(FontAwesomeIcons.houseChimney,color: Colors.white,),
                                  ),
                                ),
                                drawGap: true,
                              ),
                              beforeLineStyle: LineStyle(
                                color: color,
                                thickness: 3.0,
                              ),

                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TimelineTile(
                              axis: TimelineAxis.horizontal,
                              alignment: TimelineAlign.manual,
                              lineXY: 0.1,
                              isFirst: false,
                              isLast: false,
                              indicatorStyle: IndicatorStyle(
                                width: Get.height*0.07,
                                height: Get.height*0.07,
                                indicator: InkWell(
                                  onTap: (){
                                    _currentStep;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:_currentStep>0?color:Colors.grey.shade300),
                                    child: Center(
                                      child: Icon(Icons.location_on,color:Colors.white ,),),
                                  ),
                                ),

                                drawGap: true,
                              ),
                              beforeLineStyle: LineStyle(
                                color:_currentStep>0?color:Colors.grey.shade300,
                                thickness: 3.0,
                              ),

                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TimelineTile(
                              axis: TimelineAxis.horizontal,
                              alignment: TimelineAlign.manual,
                              lineXY: 0.1,
                              isFirst: false,
                              isLast: false,
                              indicatorStyle: IndicatorStyle(
                                width: Get.height*0.07,
                                height: Get.height*0.07,
                                indicator: InkWell(
                                  onTap: (){
                                    _currentStep;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,

                                        color: _currentStep>1?color:Colors.grey.shade300),
                                    child: Center(
                                      child: Icon(Icons.camera_alt,color:Colors.white ),),
                                  ),
                                ),
                                drawGap: true,
                              ),
                              beforeLineStyle: LineStyle(
                                color: _currentStep>1?color:Colors.grey.shade300,
                                thickness: 3.0,
                              ),

                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TimelineTile(
                              axis: TimelineAxis.horizontal,
                              alignment: TimelineAlign.manual,
                              lineXY: 0.1,
                              isFirst: false,
                              isLast: false,
                              indicatorStyle: IndicatorStyle(
                                width: Get.height*0.07,
                                height: Get.height*0.07,
                                indicator: InkWell(
                                  onTap: (){
                                    _currentStep>2?continuedP():null;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _currentStep>2?color:Colors.grey.shade300),
                                    child: Center(
                                      child: Icon(Icons.bar_chart,color:Colors.white ),),
                                  ),
                                ),
                                drawGap: true,
                              ),
                              beforeLineStyle: LineStyle(
                                color: _currentStep>2?color:Colors.grey.shade300,
                                thickness: 3.0,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TimelineTile(
                              axis: TimelineAxis.horizontal,
                              alignment: TimelineAlign.manual,
                              lineXY: 0.1,
                              isFirst: false,
                              isLast: true,
                              indicatorStyle: IndicatorStyle(
                                width: Get.height*0.07,
                                height: Get.height*0.07,
                                indicator: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,

                                      color: _currentStep>3?color:Colors.grey.shade300),
                                  child: Center(
                                    child: FaIcon(FontAwesomeIcons.circleCheck,color: Colors.white,)
                                  ),
                                ),
                                drawGap: true,
                              ),
                              beforeLineStyle: LineStyle(
                                color: _currentStep>3?color:Colors.grey.shade300,
                                thickness: 3.0,
                              ),

                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height*0.03,
                      //  margin: EdgeInsets.symmetric(horizontal: 3,),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Real Estate',style: TextStyle(fontFamily: poppinsRegular,color: Colors.black54,fontSize:12 ),),
                          Text('Location',style: TextStyle(fontFamily: poppinsRegular,color: Colors.black54,fontSize:12)),
                          Text('Image',style: TextStyle(fontFamily: poppinsRegular,color: Colors.black54,fontSize:12)),
                          Text('Listing Type',style: TextStyle(fontFamily: poppinsRegular,color: Colors.black54,fontSize:12)),
                          Text('Review',style: TextStyle(fontFamily: poppinsRegular,color: Colors.black54,fontSize:12)),

                        ],
                      ),
                    ),
                    Expanded(
                      // height: Get.height*0.62,
                      flex: 10,
                      child: PageView(
                          onPageChanged: (i) {
                            _currentStep = i;
                            setState(() {});
                            print('$_currentStep');
                          },
                          controller: controller,
                          pageSnapping: false,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RealEstate(),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListingLocation(),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListingImages(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListingType(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListingReview(),
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Register2(),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Register3(),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Register4(),
                            // ),
                            //
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Register5(),
                            // ),
                          ]),
                    ),
                  ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LinearPercentIndicator(
              width:size.width*1,
              lineHeight: 5.0,
              percent: value(),
              backgroundColor: Colors.grey.shade200,
              barRadius: Radius.circular(10),
              progressColor: buttonColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                _currentStep == 0
                    ?Container()
                    : Container(
                  margin: EdgeInsets.all(8),
                  child: CustomOutlineButton(
                      text: buttonTextP(),
                      radius: 10.0,
                      height: 0.0,
                      width: 40,
                      press: () => continuedP(),
                      // color: Color(0xff000080),
                      style: TextStyle(
                        fontSize: 16,
                        color: buttonColor,
                        fontFamily: poppinsRegular,
                      )
                  ),
                ),
                Container(
                  child: Text(bottomText(),style: TextStyle(fontSize: 14,fontFamily: poppinsRegular,color: buttonColor),),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: CustomButton(
                      text:buttonText(),
                      radius: 10.0,
                      height: 0.0,
                      width: 40,
                      color: _currentStep==4?color:buttonColor,
                      press: () => continued(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: poppinsRegular,
                      )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
