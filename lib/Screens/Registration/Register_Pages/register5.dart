import 'package:local24/Component/Widget/CustomButton_widget.dart';
import 'package:local24/Component/Widget/TextField_widget.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:flutter/material.dart';
import 'package:local24/Routes/Route_Constant.dart';


class Register5 extends StatefulWidget {
  const Register5({Key key}) : super(key: key);

  @override
  State<Register5> createState() => _Register5State();
}

class _Register5State extends State<Register5> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Form(
                key: _formKey,
                child: Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        child: Text('Username',style: textFieldHeader,),
                      ),
                      SizedBox(height: size.height*0.01,),
                      CustomTextFormField(
                        hintText: 'John Doe',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.done,
                        cursorColor: Colors.black54,
                        validator: (value){
                          if(value ==null  || value.isEmpty){
                            return  'Please enter your username';
                          }    return null;
                        },
                      ),
                      SizedBox(
                        height: size.height*0.02,
                      ),

                      Container(
                        child: Text('Phone Number',style: textFieldHeader,),
                      ),
                      SizedBox(height: size.height*0.01,),
                      CustomTextFormField(
                        hintText: 'Phone Number',
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.done,
                        cursorColor: Colors.black54,
                        validator: (value){
                          if(value ==null  || value.isEmpty){
                            return  'Please enter your phone number';
                          }    return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:20,),
                        child: Container(
                          height: size.height*0.07,
                          child: CustomButton(
                              text: 'Login',
                              radius: 10,
                              height: 0.0,
                              width: 0.0,
                              press: (){
                                Navigator.of(context).pushNamed(RouteConstant.detailPost);
                              },
                              color: buttonColor,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: poppinsRegular,
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
