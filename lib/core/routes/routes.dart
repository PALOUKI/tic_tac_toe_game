import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/routes/routes_names.dart';
import '../../presentation/GamePage.dart';
import '../../presentation/choosePlayerPage.dart';
import '../../presentation/introPage.dart';


class Routes{

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){
      case RouteName.introPage:
        return MaterialPageRoute(builder: (_) => const IntroPage());
      case RouteName.choosePlayerPage:
        return MaterialPageRoute(builder: (_) => const ChoosePlayerPage());
      case RouteName.gamePage:
        final args = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => GamePage(
            isAi: args['isAi'] as bool,
            playerSide: args['selectedSide'] as String,
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const
            Scaffold(
              body: Center(
                child: Text("Error route"),
              ),
            )
        );
    }
  }


}

