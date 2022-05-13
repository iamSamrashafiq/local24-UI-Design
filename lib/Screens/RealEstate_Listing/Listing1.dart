import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local24/Component/Widget/Chip_widget.dart';
import 'package:local24/Component/Widget/CustomButton_widget.dart';
import 'package:local24/Component/Widget/DropdownButton_Style.dart';
import 'package:local24/Component/Widget/TextField_widget.dart';
import 'package:local24/Constant/App_Constant.dart';


class RealEstate extends StatefulWidget {
  const RealEstate({Key key}) : super(key: key);

  @override
  State<RealEstate> createState() => _RealEstateState();
}

class _RealEstateState extends State<RealEstate> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _input = TextEditingController();
  List<String> category = ['1', '2'];
  String _selectCategory;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: _formKey,
                child: Flexible(
                  fit: FlexFit.loose,
                  child: ListView(
                    // physics:NeverScrollableScrollPhysics() ,
                    scrollDirection: Axis.vertical,
                    // shrinkWrap: true,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child:    RichText(
                              text: TextSpan(
                                text: 'Real Estate Title',
                                style: textFieldHeader,
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height*0.01,),
                          CustomTextFormField(
                            hintText: 'Title',
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.done,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Please enter Real Estate title";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height*0.02,),
                          Container(
                            child:    RichText(
                              text: TextSpan(
                                text: 'Real Estate Description',
                                style: textFieldHeader,
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height*0.01,),
                          CustomTextFormField(
                            hintText: 'Write Something About Your Job',
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.done,
                            maxLines: 3,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Please enter Real Estate description";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height*0.02,),
                          Container(
                            child: Text('Topics',style: textFieldHeader,),
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
                                border: Border.all(color: Colors.grey.shade300),
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
                          SizedBox(height: size.height*0.02,),
                          Container(
                            child:    RichText(
                              text: TextSpan(
                                text: 'Category',
                                style: textFieldHeader,
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height*0.01,),
                          Container(
                            child: DropdownButtonFormField(
                              decoration: DropDownButtonDecoration('Select Options'),
                              value:_selectCategory,
                              isExpanded: true,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "can't empty";
                                } else {
                                  return null;
                                }
                              },
                              autovalidateMode: AutovalidateMode.always,
                              items: category.map((String val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Text(
                                    val,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectCategory = value.toString();
                                });
                              },
                            ),
                          ),
                          SizedBox(height: size.height*0.05,),


                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
