import 'package:local24/Routes/Route_Constant.dart';
import 'package:local24/Screens/Bottom_Navigation/BottomBar.dart';
import 'package:local24/Screens/IntroScreen/IntroScreen.dart';
import 'package:local24/Screens/LoginScreen/Login.dart';
import 'package:local24/Screens/Registration/App_Features/AppFeatures.dart';
import 'package:local24/Screens/Registration/Register_Pages/CreateAccount.dart';
import 'package:flutter/material.dart';
import 'package:local24/Screens/Registration/DetailsPost/Detail_AboutPost.dart';
import 'package:local24/main.dart';
import 'package:page_transition/page_transition.dart';
import '../Screens/Registration/Register_Pages/SelectLanguages.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final animationDuration = Duration(milliseconds: 300);
    final routeArgs = settings.arguments;
    switch (settings.name) {
      case RouteConstant.initialRoute:
        return PageTransition(
            child: SplashScreen(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstant.introScreen:
        return PageTransition(
          child: IntroductionScreen(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
        );
      case RouteConstant.login:
        return PageTransition(
          child: LoginScreen(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
        );
      case RouteConstant.selectLanguage:
        return PageTransition(
            child: SelectLanguage(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration,
        );
      case RouteConstant.registerStep1:
        return PageTransition(
          child: CreateAccount(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
        );
      case RouteConstant.detailPost:
        return PageTransition(
          child: DetailAboutPost(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
        );
      case RouteConstant.appFeature:
        return PageTransition(
          child: AppFeatures(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
        );
      case RouteConstant.home:
        return PageTransition(
          child: BottomNavBar(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
        );


      default:
        return _errorRoute();
    }

  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}