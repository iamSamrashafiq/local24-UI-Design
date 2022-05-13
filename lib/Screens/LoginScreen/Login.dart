import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local24/Component/Widget/CustomButton_widget.dart';
import 'package:local24/Component/Widget/CustomTextField.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:local24/Routes/Route_Constant.dart';
import 'package:local24/Screens/Bottom_Navigation/BottomBar.dart';
import 'package:local24/Screens/HomeScreen/Home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }


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
              SizedBox(height: size.height*0.02,),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: size.width*0.9,
                      child: CustomTextField(
                        hintText: 'Email Address',
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.emailAddress,
                        contentPadding: 12,
                        validator:validateEmail,
                      ),
                    ),
                    SizedBox(height: size.height*0.02,),
                    Container(
                      width: size.width*0.9,
                      child: CustomTextField(
                        hintText: 'Password',
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.emailAddress,
                        contentPadding: 12,
                        validator:(value){
                          if(value == null && value.isEmpty){
                            return  'Please enter your username';
                          } return null;

                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height*0.03,),
              Container(
                width: size.width*0.9,
                child: CustomButton(
                  text: "Login",
                  press: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNavBar()));
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
                child: Text("Forget Password",style: introForget,textAlign: TextAlign.center,),
              ),
              SizedBox(height: size.height*0.01,),
              Container(
                child: Text("Don't have an account? Sign up",style: introSignUp,textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
