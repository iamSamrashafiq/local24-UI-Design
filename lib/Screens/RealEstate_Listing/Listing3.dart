import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local24/Constant/App_Constant.dart';

class ListingImages extends StatefulWidget {
  const ListingImages({Key key}) : super(key: key);

  @override
  State<ListingImages> createState() => _ListingImagesState();
}

class _ListingImagesState extends State<ListingImages> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.loose,
                // height: size.height*0.6,
                child: ListView(
                  // physics:NeverScrollableScrollPhysics() ,
                  scrollDirection: Axis.vertical,
                  // shrinkWrap: true,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal:size.width*0.27),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade300,width: 1)
                            ),
                            child: Column(
                              children: [
                                Text('Upload Photo',style: TextStyle(fontSize: 15,fontFamily: poppinsRegular),),

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
                        ),
                        SizedBox(height: size.height*0.02,),

                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        SizedBox(height: size.height*0.02,),
                        Container(
                          height: size.height*0.2,
                          width: double.infinity,
                          // margin: EdgeInsets.only(left: size.width*0.02),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (context,index){
                              return Container(
                                margin: EdgeInsets.only(left: size.width*0.02),

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://api.makemyhouse.com/public/Media/rimage/500/completed-project/500_1614104231_126.jpg?watermark=false',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),





                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
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
