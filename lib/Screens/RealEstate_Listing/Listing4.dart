import 'package:flutter/material.dart';
import 'package:local24/Constant/App_Constant.dart';



enum listingTypes { Free, OneWeek, OneMonth,OneYear }

class ListingType extends StatefulWidget {
  const ListingType({Key key}) : super(key: key);

  @override
  State<ListingType> createState() => _ListingTypeState();
}

class _ListingTypeState extends State<ListingType> {
  listingTypes _types = listingTypes.Free;

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
              Container(
                child: Flexible(
                  fit: FlexFit.loose,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            child: Container(
                              padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade300,width: 1)
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        activeColor: color,
                                        value: listingTypes.Free,
                                        groupValue: _types,
                                        onChanged: (listingTypes value) {
                                          setState(() {
                                            _types = value;
                                          });
                                        },
                                      ),
                                      Text('Free', style: listingTypeName,)

                                    ],
                                  ),
                                  SizedBox(height: size.height*0.02,),
                                  Container(
                                    child: Text('Lorem Ipsum,Lorem Ipsum,Lorem IpsumLorem Ipsum,Lorem IpsumLorem Ipsum,Lorem IpsumLorem Ipsum'
                                        'Lorem Ipsum Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum'),
                                  ),
                                  SizedBox(height: size.height*0.02,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height*0.02,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            child: Container(
                              padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade300,width: 1)
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        activeColor: color,
                                        value: listingTypes.OneWeek,
                                        groupValue: _types,
                                        onChanged: (listingTypes value) {
                                          setState(() {
                                            _types = value;
                                          });
                                        },
                                      ),
                                      Text('Premium 1 Week', style: listingTypeName,)

                                    ],
                                  ),
                                  SizedBox(height: size.height*0.02,),
                                  Container(
                                    child: Text('Lorem Ipsum,Lorem Ipsum,Lorem IpsumLorem Ipsum,Lorem IpsumLorem Ipsum,Lorem IpsumLorem Ipsum'
                                        'Lorem Ipsum Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum'),
                                  ),
                                  SizedBox(height: size.height*0.02,),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: size.height*0.02,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            child: Container(
                              padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade300,width: 1)
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        activeColor: color,
                                        value: listingTypes.OneMonth,
                                        groupValue: _types,
                                        onChanged: (listingTypes value) {
                                          setState(() {
                                            _types = value;
                                          });
                                        },
                                      ),
                                      Text('Premium 1 Month', style: listingTypeName,)

                                    ],
                                  ),
                                  SizedBox(height: size.height*0.02,),
                                  Container(
                                    child: Text('Lorem Ipsum,Lorem Ipsum,Lorem IpsumLorem Ipsum,Lorem IpsumLorem Ipsum,Lorem IpsumLorem Ipsum'
                                        'Lorem Ipsum Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum'),
                                  ),
                                  SizedBox(height: size.height*0.02,),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: size.height*0.02,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                            child: Container(
                              padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade300,width: 1)
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        activeColor: color,
                                        value: listingTypes.OneYear,
                                        groupValue: _types,
                                        onChanged: (listingTypes value) {
                                          setState(() {
                                            _types = value;
                                          });
                                        },
                                      ),
                                      Text('Premium 1 Year', style: listingTypeName,)

                                    ],
                                  ),
                                  SizedBox(height: size.height*0.02,),
                                  Container(
                                    child: Text('Lorem Ipsum,Lorem Ipsum,Lorem IpsumLorem Ipsum,Lorem IpsumLorem Ipsum,Lorem IpsumLorem Ipsum'
                                        'Lorem Ipsum Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum'),
                                  ),
                                  SizedBox(height: size.height*0.02,),
                                ],
                              ),
                            ),
                          ),
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
}
