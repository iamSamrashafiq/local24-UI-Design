import 'package:flutter/material.dart';
import 'package:local24/Component/Widget/Chip_widget.dart';
import 'package:local24/Component/Widget/TextField_widget.dart';
import 'package:local24/Constant/App_Constant.dart';

class ListingReview extends StatefulWidget {
  const ListingReview({Key key}) : super(key: key);

  @override
  State<ListingReview> createState() => _ListingReviewState();
}

class _ListingReviewState extends State<ListingReview> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child:ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text('Real Estate Title',style: textFieldHeader,),
                      ),
                      SizedBox(height: size.height*0.01,),
                      CustomTextFormField(
                        hintText: 'Title',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.done,
                        // validator: (value){
                        //   if(value==null || value.isEmpty){
                        //     return "Please enter Real Estate title";
                        //   }
                        //   return null;
                        // },
                      ),
                      SizedBox(height: size.height*0.02,),
                      Container(
                        child: Text('Real Estate Description',style: textFieldHeader,),
                      ),
                      SizedBox(height: size.height*0.01,),
                      CustomTextFormField(
                        hintText: 'lorem ipsum ,lorem ipsum lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum ',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.done,
                        maxLines: 3,
                        // validator: (value){
                        //   if(value==null || value.isEmpty){
                        //     return "Please enter Real Estate description";
                        //   }
                        //   return null;
                        // },
                      ),

                      SizedBox(height: size.height*0.02,),
                      Container(
                        child: Text('Tags',style: textFieldHeader,),
                      ),
                      SizedBox(height: size.height*0.01,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: interestDummy.length == 0
                            ? Text(
                          "Enter your Interest",
                          style: TextStyle(color: Colors.grey.shade400, fontSize: 15.0,fontFamily: poppinsRegular),
                          textAlign: TextAlign.start,
                        )
                            : Wrap(
                          runSpacing: 6,
                          spacing: 6,
                          children: List.from(interestDummy.map((e) => chipBuilder(
                            onTap: () {
                              setState(() {
                                interestDummy.remove(e);
                              });
                            },
                            title: e,
                          ))),
                        ),
                      ),
                      SizedBox(height: size.height*0.02,),
                      Container(
                        child: Text('Country',style: textFieldHeader,),
                      ),
                      SizedBox(height: size.height*0.01,),
                      CustomTextFormField(
                        hintText: 'Lorem Ipsum',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.done,
                        // validator: (value){
                        //   if(value==null || value.isEmpty){
                        //     return "Please enter country";
                        //   }
                        //   return null;
                        // },
                      ),

                      SizedBox(height: size.height*0.02,),
                      Container(
                        child: Text('City',style: textFieldHeader,),
                      ),
                      SizedBox(height: size.height*0.01,),
                      CustomTextFormField(
                        hintText: 'Lorem Ipsum',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.done,
                        // validator: (value){
                        //   if(value==null || value.isEmpty){
                        //     return "Please enter City";
                        //   }
                        //   return null;
                        // },
                      ),

                      SizedBox(height: size.height*0.02,),
                      Container(
                        child: Text('Zip',style: textFieldHeader,),
                      ),
                      SizedBox(height: size.height*0.01,),
                      CustomTextFormField(
                        hintText: '12345',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.done,
                        // validator: (value){
                        //   if(value==null || value.isEmpty){
                        //     return "Please enter zip";
                        //   }
                        //   return null;
                        // },
                      ),
                      SizedBox(height: size.height*0.03,),
                      Container(
                        width: double.infinity,
                        height: size.height*0.2,
                        margin: EdgeInsets.only(left: size.width*0.02),
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
                                  // height: size.height*0.1,
                                  // width: size.width*0.15,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: size.height*0.02,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                        child: Container(
                          padding:const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300,width: 1)
                          ),
                          child: Column(
                            children: [
                              Text('Free', style: listingTypeName,),
                              SizedBox(height: size.height*0.02,),
                              Container(
                                child: Text('Lorem Ipsum,Lorem Ipsum,Lorem IpsumLorem Ipsum,Lorem IpsumLorem Ipsum,Lorem IpsumLorem Ipsum'
                                    'Lorem Ipsum Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
