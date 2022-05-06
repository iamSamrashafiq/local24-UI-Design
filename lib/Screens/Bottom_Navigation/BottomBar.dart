// ignore_for_file: file_names, must_be_immutable
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local24/Component/AppBar/appbar.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'package:local24/Screens/HomeScreen/Home.dart';


class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final globalKey = GlobalKey<ScaffoldState>();
  String _title;
  int _currentIndex=0;
  bool backIcon=false;
  final List<Widget> _widgetOptions = [
    HomePage(),
    Text('hi2'),
    Text('hh'),
    Text('hi3'),
    Text('hi4'),
  ]; // to store nested tabs
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _title='Oreas Estate';
  //   super.initState();
  // }
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      // switch(index){
      //   case 0:{ _title = 'Oreas Estate'; }
      //   break;
      //   case 1:{ _title = 'User  Profile'; }
      //   break;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Navigator.pushNamed(context, RouteConstants.filterPage);
        },
        backgroundColor: Colors.transparent,
        child: Container(
            height: 60,
            width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment(0.8, 0.0),
              colors: [
                Color(0xff2376b6),
                Color(0xff80C1E7),
              ]
            )
          ),
            child: Center(child: Image.asset(home))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: (child, animation, secondaryAnimation) =>
            FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 5,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex:_currentIndex,
          selectedItemColor: color,
          onTap: _onItemTapped,
          unselectedLabelStyle:bottomNavLabelStyle ,
          selectedLabelStyle:bottomNavLabelSelectedStyle ,
          items: const [
             BottomNavigationBarItem(icon:  FaIcon(FontAwesomeIcons.locationPin,color: Colors.black,size: 16,),label: 'Local',),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.arrowTrendUp,color: Colors.black,size: 16),label: 'Trending'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.arrowTrendUp,color: Colors.black,size: 1),label: ''),
            BottomNavigationBarItem(icon:FaIcon(FontAwesomeIcons.video,color: Colors.black,size: 16),label: 'Video'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.ellipsis,color: Colors.black,size: 16),label: 'More'),

          ],
        ),
      ),
    );
  }
}
