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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height*0.6,
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
                            onTap: (){},
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
      ),
    );
  }
}
