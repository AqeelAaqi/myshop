import 'package:flutter/material.dart';

class CustomRoute extends MaterialPageRoute<Object> {
  CustomRoute(
      {WidgetBuilder? builder, RouteSettings? routeSettings})
      : super(builder: builder!, settings: routeSettings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    // return super
    //     .buildTransitions(context, animation, secondaryAnimation, child);
    if(settings.name == '/'){
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    if (route.settings.name == '/') {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
