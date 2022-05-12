import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local24/Component/DropdownButton_Style.dart';
import 'package:local24/Component/GoogleMap/GoogleMap.dart';
import 'package:local24/Component/TextField_widget.dart';
import 'package:local24/Constant/App_Constant.dart';


class ListingLocation extends StatefulWidget {
  const ListingLocation({Key key}) : super(key: key);

  @override
  State<ListingLocation> createState() => _ListingLocationState();
}

class _ListingLocationState extends State<ListingLocation> {
  final _formKey = GlobalKey<FormState>();
  String _selectedCountry;
  String _selectedCity;
  String _selectedMap;

  List<String> country = ['USA','Uk', 'Canada','UAE',];
  List<String> city = ['New York','California', 'Chicago','Texas',];
  List<String> MapView = ['1','2', '3','4',];
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
                            child:RichText(
                              text: TextSpan(
                                text: 'Address',
                                style: textFieldHeader,
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height*0.01,),
                          CustomTextFormField(
                            hintText: 'Address',
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.done,
                            suffixIcon:Icons.location_on,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Please enter Real Estate title";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height*0.02,),
                          Container(
                            child:RichText(
                              text: TextSpan(
                                text: 'Country',
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
                              decoration: DropDownButtonDecoration('Select Country'),
                              value:_selectedCountry,
                              isExpanded: true,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "can't empty";
                                } else {
                                  return null;
                                }
                              },
                              autovalidateMode: AutovalidateMode.always,
                              items: country.map((String val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Text(
                                    val,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedCountry = value.toString();
                                });
                              },
                            ),
                          ),
                          SizedBox(height: size.height*0.02,),
                          Container(
                            child:RichText(
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
                          Container(
                            child: DropdownButtonFormField(
                              decoration: DropDownButtonDecoration('Select City'),
                              value:_selectedCity,
                              isExpanded: true,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "can't empty";
                                } else {
                                  return null;
                                }
                              },
                              autovalidateMode: AutovalidateMode.always,
                              items: city.map((String val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Text(
                                    val,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedCity = value.toString();
                                });
                              },
                            ),
                          ),
                          SizedBox(height: size.height*0.02,),
                          Container(
                            child: Text('Zip/Post Code',style: textFieldHeader,),
                          ),
                          SizedBox(height: size.height*0.01,),
                          CustomTextFormField(
                            hintText: 'Enter Zip/Post Code',
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.done,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Please enter Zip/Post Code";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height*0.02,),
                          Container(
                            child:RichText(
                              text: TextSpan(
                                text: 'Select Map View',
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
                              decoration: DropDownButtonDecoration('Select Map View'),
                              value:_selectedMap,
                              isExpanded: true,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "can't empty";
                                } else {
                                  return null;
                                }
                              },
                              autovalidateMode: AutovalidateMode.always,
                              items: MapView.map((String val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Text(
                                    val,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedMap = value.toString();
                                });
                              },
                            ),
                          ),
                          SizedBox(height: size.height*0.04,),

                          Container(
                            width: double.infinity,
                            height: size.height*0.35,
                            child: MapSample()
                          ),

                          SizedBox(height: size.height*0.04,),
                          Container(
                            child:RichText(
                              text: TextSpan(
                                text: 'Address Latitude',
                                style: textFieldHeader,
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height*0.01,),
                          CustomTextFormField(
                            hintText: '17.87561424',
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.done,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Please enter Latitude";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height*0.02,),
                          Container(
                            child:RichText(
                              text: TextSpan(
                                text: 'Address Longitude',
                                style: textFieldHeader,
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height*0.01,),
                          CustomTextFormField(
                            hintText: '17.87561424',
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.done,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Please enter Longitude";
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: size.height*0.05,),
                        ],
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
