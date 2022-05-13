import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local24/Component/Widget/Chip_widget.dart';
import 'package:local24/Component/Widget/CustomButton_widget.dart';
import 'package:local24/Component/Widget/DropdownButton_Style.dart';
import 'package:local24/Component/Widget/TextField_widget.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:local24/Routes/Route_Constant.dart';

class DetailAboutPost extends StatefulWidget {
  const DetailAboutPost({Key key}) : super(key: key);

  @override
  State<DetailAboutPost> createState() => _DetailAboutPostState();
}

class _DetailAboutPostState extends State<DetailAboutPost> {
  final TextEditingController _input = TextEditingController();
  bool termValue = false;
  String _district;
  String _category;
  List<String> district = ['Government', 'local',"Police"];
  List<String> category = ['category 1', 'category 2',"category 3"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Column(
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
                      width: size.width*0.6,
                      child: Text('Please give detail about your post',style: detailPageTitle,),
                    )
                  ],
                ),
                SizedBox(height: size.height*0.05,),
                Container(
                  child:    RichText(
                    text: TextSpan(
                      text: 'Title',
                      style: textFieldHeader,
                      children: const <TextSpan>[
                        TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height*0.01,),
                CustomTextFormField(
                  hintText: 'Enter your title',
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
                  child:   Text('Description', style: textFieldHeader,)
                ),
                SizedBox(height: size.height*0.01,),
                CustomTextFormField(
                  hintText: 'Write something for your description',
                  inputType: TextInputType.text,
                  maxLines: 3,
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
                    child:   Text('District', style: textFieldHeader,)
                ),
                SizedBox(height: size.height*0.01,),
                Container(
                  child: DropdownButtonFormField(
                    decoration: DropDownButtonDecoration('Select Options'),
                    value:_district,
                    isExpanded: true,
                    validator: (value) {
                      if (value.toString().isEmpty||value ==null) {
                        return "can't empty";
                      } else {
                        return null;
                      }
                    },
                    items: district.map((String val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                          style: dropDownTextStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _district = value.toString();
                      });
                    },
                  ),
                ),
                SizedBox(height: size.height*0.02,),
                Container(
                    child:   Text('Tags', style: textFieldHeader,)
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
                SizedBox(height: size.height*0.02,),
                Container(
                    child:   Text('District', style: textFieldHeader,)
                ),
                SizedBox(height: size.height*0.01,),
                Container(
                  child: DropdownButtonFormField(
                    decoration: DropDownButtonDecoration('Select Category'),
                    value:_category,
                    style: TextStyle(fontFamily: poppinsRegular,fontSize: 14,color: Colors.black87),
                    isExpanded: true,
                    validator: (value) {
                      if (value.toString().isEmpty||value ==null) {
                        return "can't empty";
                      } else {
                        return null;
                      }
                    },
                    items: category.map((String val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                          style: dropDownTextStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _category = value.toString();
                      });
                    },
                  ),
                ),
                SizedBox(height: size.height*0.04,),

                GestureDetector(
                  onTap: ()=>showCameraOption(context),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text('Please Select photo or video',style: detailPostCam,),
                        ),
                        Container(
                          child: Icon(Icons.camera_alt_outlined,size: 30,color: Colors.grey.shade300,),
                        )

                      ],
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        checkColor: Colors.white,
                        activeColor: color,
                        value: this.termValue,
                        onChanged: (bool value) {
                          setState(() {
                            termValue = value;
                          });
                        }),

                    RichText(
                      text: TextSpan(
                        text: 'I agree that all information is accurate and agree \n',
                        style: detailPostAgree,
                        children: const <TextSpan>[
                          TextSpan(text: 'terms of condition & privacy policy', style:TextStyle(decoration: TextDecoration.underline))
                        ],
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical:20,),
                  child: Container(
                    width: size.width*0.9,
                    child: CustomButton(
                        text: 'Submit',
                        radius: 10,
                        height: 0.0,
                        width: 0.0,
                        press: (){
                          Navigator.of(context).pushNamed(RouteConstant.appFeature);
                        },
                        color: buttonColor,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: poppinsRegular,
                        )
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

  void showCameraOption(BuildContext context) =>showDialog(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Choose Option',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12,fontFamily: poppinsRegular,fontWeight: FontWeight.w600),),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text('Camera',style: detailPostCam,),
                      ),
                      Container(
                        child: Icon(Icons.camera_alt_outlined,size: 25,color: Colors.grey.shade300,),
                      )

                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text('Gallery',style: detailPostCam,),
                      ),
                      Container(
                        child: Icon(Icons.photo_camera_back,size: 25,color: Colors.grey.shade300),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.01),

            ],
          ),
        );
      }
  );

}
