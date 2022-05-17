
import 'package:flutter/cupertino.dart';
import 'package:local24/Component/Widget/Chip_widget.dart';
import 'package:local24/Component/Widget/CustomButton_widget.dart';
import 'package:local24/Component/Widget/TextField_widget.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register2 extends StatefulWidget {
  const Register2({Key key}) : super(key: key);

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {

  final TextEditingController _input = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: _formKey,
              child: Flexible(
                fit: FlexFit.loose,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      child:    RichText(
                        text: TextSpan(
                          text: 'City',
                          style: textFieldHeader,
                          children: const <TextSpan>[
                            TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.01,),
                    CustomTextFormField(
                      hintText: 'City',
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Please enter your city";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.height*0.02,),
                    Container(
                      child:    RichText(
                        text: TextSpan(
                          text: 'State',
                          style: textFieldHeader,
                          children: const <TextSpan>[
                            TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.01,),
                    CustomTextFormField(
                      hintText: 'State',
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
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
                          text: 'Mandel',
                          style: textFieldHeader,
                          children: const <TextSpan>[
                            TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.01,),
                    CustomTextFormField(
                      hintText: 'Enter Mandal',
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value){
                        if(value ==null  || value.isEmpty){
                          return  'Please enter your username';
                        }    return null;
                      },
                    ),
                    SizedBox(height: size.height*0.02,),
                    Container(
                      child: Text('Village',style: textFieldHeader,),
                    ),
                    SizedBox(height: size.height*0.01,),
                    CustomTextFormField(
                      hintText: 'Housing Village',
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value){
                        if(value ==null  || value.isEmpty){
                          return  'Please enter your username';
                        }    return null;
                      },
                    ),
                    SizedBox(height: size.height*0.02,),
                    GestureDetector(
                      onTap: ()=>showNumberDialog(context),
                      child: Container(
                        child: Text('Favourite topic,celebrity etc',style: textFieldHeader,),
                      ),
                    ),
                    SizedBox(height: size.height*0.01,),
                    GestureDetector(
                      onTap: (){
                        showNumberDialog(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: interests.length == 0
                            ? Text(
                          "Enter your Interest",
                          style: TextStyle(color: Colors.grey.shade400, fontSize: 15.0,fontFamily: poppinsRegular),
                          textAlign: TextAlign.start,
                        )
                            : Wrap(
                          runSpacing: 6,
                          spacing: 6,
                          children: List.from(interests.map((e) => chipBuilder(
                            onTap: () {
                              setState(() {
                                interests.remove(e);
                              });
                            },
                            title: e,
                          ))),
                        ),
                      ),
                    ),

                    // CustomTextFormField(
                    //   hintText: 'Extra',
                    //   inputType: TextInputType.text,
                    //   validator: (value){
                    //     if(value ==null  || value.isEmpty){
                    //       return  'Please enter your username';
                    //     }    return null;
                    //   },
                    // ),
                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showNumberDialog(BuildContext context) =>showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: CustomTextFormField(
                    controller: _input,

                    hintText: 'Add New Topic',
                    inputType: TextInputType.text,

                  ),
                ),
              ),
              SizedBox(height: Get.height*0.01),
              Container(
                width: Get.height*0.42,
                child: CustomButton(
                  text: 'Submit',
                  radius: 10,
                  height: 0.0,
                  width: 0.0,
                  press: (){
                    if (_input.text.isNotEmpty) {
                      setState(() {
                        interests.add(_input.text);
                        _input.clear();

                      });
                      Navigator.of(context).pop();
                    }
                  },
                  color: buttonColor,
                  style: TextStyle(fontFamily: poppinsRegular,fontSize: 16,
                    color: Colors.white,),
                ),
              ),

              const SizedBox(height: 7),

            ],
          ),
        );
      }
  );
}

