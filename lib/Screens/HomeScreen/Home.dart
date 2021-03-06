import 'package:flutter/material.dart';
import 'package:local24/Component/AppBar/appbar.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) => new Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                //here place Ad widget inside a contain
                Container(
                  height:100,
                  width:double.infinity,
                ),
              ],
            ),
          )
      );
    });

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
      length: 10,
      child: Scaffold(
        // appBar: CustomAppBar(),
        backgroundColor: homeBg,
        body:  NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            CustomAppBar(
              tab:  TabBar(
              indicatorWeight: 3,
                padding: EdgeInsets.symmetric(horizontal: 10),
                isScrollable: true,
                controller: _tabController,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.blue,
                tabs: list,
              ),
            ),
          ],
          body: Container(
              child:
              Column(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //       border: Border(
                  //           bottom: BorderSide(
                  //               color: Colors.grey.shade300, width: 1))),
                  //
                  //   child: TabBar(
                  //     isScrollable: true,
                  //
                  //     controller: _tabController,
                  //     unselectedLabelColor: Colors.black,
                  //     labelColor: Colors.blue,
                  //     tabs: list,
                  //   ),
                  // ),

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
                          Text('heloo5'),
                          Text('heloo6'),
                          Text('heloo7'),
                          Text('heloo8'),
                          Text('heloo9'),
                          Text('heloo10'),
                        ],
                      ),
                    ),
                  ),



                ],
              ),
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
    ),
    Tab(
      child: Text('Section 5', style: TextStyle(fontFamily: poppinsRegular,fontSize:12)),
    ),
    Tab(
      child: Text('Section 6', style: TextStyle(fontFamily: poppinsRegular,fontSize:12)),
    ),
    Tab(
      child: Text('Section 7', style: TextStyle(fontFamily: poppinsRegular,fontSize:12)),
    ),
    Tab(
      child: Text('Section 8', style: TextStyle(fontFamily: poppinsRegular,fontSize:12)),
    ),
    Tab(
      child: Text('Section 9', style: TextStyle(fontFamily: poppinsRegular,fontSize:12)),
    ),
    Tab(
      child: Text('Section 10', style: TextStyle(fontFamily: poppinsRegular,fontSize:12)),
    ),
  ];
}
