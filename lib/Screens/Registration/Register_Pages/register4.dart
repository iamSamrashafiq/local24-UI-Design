import 'package:get/get.dart';
import 'package:local24/Constant/App_Constant.dart';

import 'package:flutter/material.dart';

class Register4 extends StatefulWidget {
  const Register4({Key key}) : super(key: key);

  @override
  State<Register4> createState() => _Register4State();
}

class _Register4State extends State<Register4> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
           fit: FlexFit.loose,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300,width: 1)
                  ),
                  child: Container(
                    height:size.height*0.18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/images/man.png',),
                        fit: BoxFit.contain,
                      )
                    ),
                  ),
                ),
                SizedBox(height: size.height*0.03,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Container(
                    padding:const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300,width: 1)
                    ),
                    child: Column(
                      children: [
                        Text('Upload Your Profile Image',style: TextStyle(fontSize: 15,fontFamily: poppinsRegular),),

                        GestureDetector(
                          onTap: (){
                            showCameraOption(context);
                          },
                          child: Container(
                            child:Image.asset('assets/images/upload.png',) ,
                          ),
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }


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
