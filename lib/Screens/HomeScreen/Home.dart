import 'package:flutter/material.dart';
import 'package:local24/Component/HomePage/HomeSection1/Home_Section1.dart';
import 'package:local24/Constant/App_Constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {

  TabController _tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: list.length);
    var val;
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
        val = list;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: homeBg,
        body:  Container(
            child: Column(
              children: [
                SizedBox(height: 10,),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade300, width: 1))),

                  child: TabBar(
                    controller: _tabController,
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.blue,
                    tabs: list,
                  ),
                ),

                Expanded(
                  child: Container(
                    color: homeBg,
                    child: TabBarView(
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        HomeSection1(),
                        Text('heloo 2'),
                        Text('heloo3'),
                        Text('heloo4'),
                      ],
                    ),
                  ),
                ),



              ],
            ),
          ),
        )
    );
  }



  List<Widget> list = [
    Tab(
      child: Text('Section 1', style: TextStyle(fontFamily: poppinsRegular,fontSize:12)),
    ),
    Tab(
      child: Text('section 2', style: TextStyle(fontFamily: poppinsRegular,fontSize:12)),
    ),
    Tab(
      child: Text('Section 3', style: TextStyle(fontFamily: poppinsRegular,fontSize:12)),
    ),
    Tab(
      child: Text('Section 4', style: TextStyle(fontFamily: poppinsRegular,fontSize:12)),
    )
  ];
}
