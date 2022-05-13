
import 'package:local24/Component/Widget/TextField_widget.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:flutter/material.dart';

class Register1 extends StatefulWidget {
  const Register1({Key key}) : super(key: key);

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    height: size.height*0.7,
                    child: ListView(
                      physics:NeverScrollableScrollPhysics() ,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Container(
                          child:    RichText(
                            text: TextSpan(
                              text: 'Username',
                              style: textFieldHeader,
                              children: const <TextSpan>[
                                TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
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
                        SizedBox(height: size.height*0.02,),
                        Container(
                          child:    RichText(
                            text: TextSpan(
                              text: 'Phone Number',
                              style: textFieldHeader,
                              children: const <TextSpan>[
                                TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
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
                      ],
                    ),
                  ),
                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
}

