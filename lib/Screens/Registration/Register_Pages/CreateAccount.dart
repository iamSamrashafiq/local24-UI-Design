import 'package:local24/Component/CustomButton_widget.dart';
import 'package:local24/Component/CustomOutline_Button.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:local24/Screens/Registration/Register_Pages/register1.dart';
import 'package:local24/Screens/Registration/Register_Pages/register2.dart';
import 'package:local24/Screens/Registration/Register_Pages/register3.dart';
import 'package:local24/Screens/Registration/Register_Pages/register4.dart';
import 'package:local24/Screens/Registration/Register_Pages/register5.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
      return 'Finish'.tr;
    }

    return '';
  }

  String bottomText(){
    if (_currentStep == 0) {
      return 'Account'.tr;
    }
    if (_currentStep == 1) {
      return 'Personal'.tr;
    }
    if (_currentStep == 2) {
      return 'Profile'.tr;
    }
    if (_currentStep == 3) {
      return 'Image'.tr;
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
    // if (_currentStep == 4) {
    //   return 'Back'.tr;
    // }
    return '';
  }

  continued() async {
   controller.animateToPage(_currentStep += 1,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  continuedP() async {
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
                            // width: size.width*0.7,
                            child: RichText(
                              text: TextSpan(
                                text: 'User Account Registration',
                                style: titleStyle,
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                          ),
                          Text('Fill all the form field to go next  step',style: subTitleStyle,)
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
                                  child: Icon(Icons.lock,color: Colors.white,),),
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
                                  child: Icon(Icons.person,color:Colors.white ,),),
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
                                  child: Icon(Icons.person_pin_rounded,color:Colors.white ),),
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
                                  child: Icon(Icons.camera_alt,color:Colors.white ),),
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
                                child: Icon(Icons.done,color:Colors.white ),),
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
                      Text('Account',style: TextStyle(fontFamily: poppinsRegular,color: Colors.black54,fontSize:12 ),),
                      Text('Personal',style: TextStyle(fontFamily: poppinsRegular,color: Colors.black54,fontSize:12)),
                      Text('Profile',style: TextStyle(fontFamily: poppinsRegular,color: Colors.black54,fontSize:12)),
                      Text('Image',style: TextStyle(fontFamily: poppinsRegular,color: Colors.black54,fontSize:12)),
                      Text('Success',style: TextStyle(fontFamily: poppinsRegular,color: Colors.black54,fontSize:12)),

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
                        // Text("Step 1"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Register1(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Register2(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Register3(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Register4(),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Register5(),
                        ),
                      ]),
                ),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _currentStep!=4?Container(
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
                    ? Container(
                    margin: EdgeInsets.all(8),
                    child: CustomOutlineButton(
                        text:'Back',
                        radius: 10.0,
                        height: 0.0,
                        width: 40,
                        press: () => Navigator.of(context).pop(),
                        // color: Color(0xff000080),
                        style: TextStyle(
                          fontSize: 16,
                          color: buttonColor,
                          fontFamily: poppinsRegular,
                        )
                    ))
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
                      color: _currentStep==3?color:buttonColor,
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
      ):null,
    );
  }
}
