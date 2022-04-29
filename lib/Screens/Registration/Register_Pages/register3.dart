import 'package:local24/Component/DropdownButton_Style.dart';
import 'package:local24/Component/TextField_widget.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:flutter/material.dart';

enum WidgetMaker {Government,Local,}

class Register3 extends StatefulWidget {
  const Register3({Key key}) : super(key: key);

  @override
  State<Register3> createState() => _Register3State();
}

class _Register3State extends State<Register3> {
  final _formKey = GlobalKey<FormState>();
  WidgetMaker selectedWidgetMaker = WidgetMaker.Local;
  List<String> profileFor = ['Government', 'Local'];
  List<String> category = ['1', '2'];
  List<String> contribution = ['1', '2'];
  List<String> status = ['1', '2'];
  String _selectPro;
  String _selectCate;
  String _selectContribution;
  String _status;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Container(
                  height: size.height*1,
                  child: ListView(
                    physics:NeverScrollableScrollPhysics() ,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: Text('How do you want to use your profile',style: textFieldHeader,),
                      ),
                      SizedBox(height:5,),
                      Container(
                        child: DropdownButtonFormField(
                          decoration: DropDownButtonDecoration('Select Option'),
                          value:_selectPro,
                          isExpanded: true,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "can't empty";
                            } else {
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.always,
                          items: profileFor.map((String val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(
                                val,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value == 'Government') {
                              setState(() {
                                selectedWidgetMaker = WidgetMaker.Government;
                              });
                            } else  {
                              setState(() {
                                selectedWidgetMaker = WidgetMaker.Local;
                              });
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20,),

                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: getCustomWidget(),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getCustomWidget() {
    switch (selectedWidgetMaker) {
      case WidgetMaker.Government:
        return govt();
      case WidgetMaker.Local:
        return local();
    }
  }

  Widget govt() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text('Which category you want to contribute',style: textFieldHeader,),
        ),
        SizedBox(height: 5,),
        Container(
          child: DropdownButtonFormField(
            decoration: DropDownButtonDecoration('Select Options'),
            value:_selectCate,
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
                  _selectCate = value.toString();
                });
            },
          ),
        ),
        SizedBox(height: 20,),
        Container(
          child: Text('Which category you want to contribute',style: textFieldHeader,),
        ),
        SizedBox(height: 5,),
        Container(
          child: DropdownButtonFormField(
            decoration: DropDownButtonDecoration('Select Options'),
            value:_selectContribution,
            isExpanded: true,
            validator: (value) {
              if (value.toString().isEmpty) {
                return "can't empty";
              } else {
                return null;
              }
            },
            autovalidateMode: AutovalidateMode.always,
            items: contribution.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectCate = value.toString();
              });
            },
          ),
        ),

        SizedBox(height: 20,),
        Container(
          child: Text('Which category you want to contribute',style: textFieldHeader,),
        ),
        SizedBox(height: 5,),
        Container(
          child: CustomTextFormField(
            hintText: 'Write something for your bio',
            inputType: TextInputType.text,
            inputAction: TextInputAction.done,
            cursorColor: Colors.black54,
            maxLines: 4,
            validator: (String  value){
              if(value ==null  || value.isEmpty){
                return  'Please enter your bio';
              }    return null;
            },
          ),
        ),

        SizedBox(height:20,),
        Container(
          child: Text('Status',style: textFieldHeader,),
        ),
        SizedBox(height: 5,),
        Container(
          child: DropdownButtonFormField(
            decoration: DropDownButtonDecoration('Select Options'),
            value:_status,
            isExpanded: true,
            validator: (value) {
              if (value.toString().isEmpty) {
                return "can't empty";
              } else {
                return null;
              }
            },
            autovalidateMode: AutovalidateMode.always,
            items: status.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _status = value.toString();
              });
            },
          ),
        ),

      ],
    );
  }


  Widget local() {
    return Column(
      children: [

      ],
    );
  }

}
