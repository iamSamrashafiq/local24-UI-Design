import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local24/Component/Widget/CustomButton_widget.dart';
import 'package:local24/Component/Widget/CustomOutline_Button.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:local24/Routes/Route_Constant.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height*0.04,),
              Container(
                child: Image.asset("assets/images/loca24_logo.png",width:size.width*0.94 ,height:120,fit:BoxFit.fitWidth,),
              ),
              Container(
                child: SvgPicture.asset("assets/images/explore-tile.svg",fit: BoxFit.fitWidth,height:size.height*0.25),
              ),
              SizedBox(height: size.height*0.02,),
              Container(
                child: Text('The All-in-one app for \n for your local needs.',style: introTxt,textAlign: TextAlign.center),
              ),
              Container(
                child: Text("Sign in to see what's going \n an round you",style: introSubText,textAlign: TextAlign.center,),
              ),
              SizedBox(height: size.height*0.04,),
              Container(
                width: size.width*0.9,
                child: CustomOutlineButton(
                  text: "Log in",
                  press: (){
                    Navigator.of(context).pushNamed(RouteConstant.login);
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  radius: 25,
                  height: 0.0,
                  width: 0.0,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: poppinsRegular,
                    color: Colors.black,
                  ),
                  // color: Colors.black,
                ),
              ),
              SizedBox(height: size.height*0.02,),
              Container(
                width: size.width*0.9,
                child: CustomButton(
                  text: "Sign Up",
                  press: (){
                    Navigator.of(context).pushNamed(RouteConstant.selectLanguage);
                  },
                  radius: 25,
                  height: 0.0,
                  width: 0.0,
                  color: Colors.black,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: poppinsRegular,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: size.height*0.02,),
              Container(
                child: Text("By Continuing,I agree with the",style: introContinue,textAlign: TextAlign.center,),
              ),
              SizedBox(height: size.height*0.01,),
              Container(
                child: Text("Privacy Policy,Terms & Condition",style: introTerm,textAlign: TextAlign.center,),
              ),








            ],
          ),
        ),
      ),
    );
  }
}
