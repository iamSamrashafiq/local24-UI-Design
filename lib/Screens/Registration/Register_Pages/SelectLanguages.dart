import 'package:local24/Constant/App_Constant.dart';
import 'package:local24/Routes/Route_Constant.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {

  int currentIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height*0.03,
              ),
              RichText(
                text: TextSpan(
                  text: 'Select Languages ',
                  style: titleStyle,
                  children: const <TextSpan>[
                    TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              // Text('Select Languages',style: titleStyle,),
              SizedBox(
                height: size.height*0.05,
              ),

              Container(
                padding:const EdgeInsets.symmetric(horizontal: 10),
                height: size.height*0.7,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: language.length,
                  itemBuilder: (BuildContext context,int index){
                    return CustomWidget(
                      txt: language[index].name,
                        flag: language[index].flag,
                        size: size,
                      index: index,
                      isSelected: currentIndex == index,
                      onSelect: (){
                        setState(() {
                          currentIndex = index;
                        });
                      },

                    );
                  },

                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          LinearPercentIndicator(
            width:size.width*1,
            lineHeight: 5.0,
            percent: 0.15,
            backgroundColor: Colors.grey.shade200,
            barRadius: Radius.circular(10),
            progressColor: buttonColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.all(8),
                  child: Text(
                    'Select Language',
                    style: TextStyle(fontFamily: poppinsRegular,fontSize: 12,fontWeight:FontWeight.w500,color: buttonColor),
                  )),
              Container(
                margin: EdgeInsets.all(8),
                width: 110,
                child: Material(
                borderRadius: BorderRadius.circular(10),
                  color: Color(0xff000080),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteConstant.registerStep1);
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IconStepperDemo()));
                    },
                    child: const SizedBox(
                      height: kToolbarHeight,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: poppinsRegular,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




class CustomWidget extends StatefulWidget {
  const CustomWidget({
    Key key,
    @required this.index,
    this.txt,
    this.flag,
    @required this.isSelected,
    @required this.onSelect,
    @required this.size,
  }) :  assert(index != null),
        assert(isSelected != null),
        assert(onSelect != null),
        super(key: key);

  final String txt;
 final String flag;
  final Size size;
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onSelect,
      child: Container(
        margin:const EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isSelected?color:Colors.grey.shade200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.txt,style: listViewLanguage,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding:const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
              child:Image.asset(widget.flag,fit: BoxFit.cover,width: widget.size.width*0.08,),
            ),
          ],
        ),
      ),
    );
  }
}


class Language{
  String name;
  String flag;
  bool isSelected;

 Language({this.name,this.flag,this.isSelected});
}

List<Language> language =[
  Language(name:"English",flag: "assets/images/united-states.png",isSelected: false),
  Language(name:"Canada",flag: "assets/images/canada.png",isSelected: false),
  Language(name:"Tamil",flag: "assets/images/india.png",isSelected: false),
  Language(name:"Hindi",flag: "assets/images/india.png",isSelected: false),
  Language(name:"Telugu",flag: "assets/images/india.png",isSelected: false),
];