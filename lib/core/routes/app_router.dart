import 'package:project2/core/utils/exports.dart';

class AppRouter {

  static const String initialRoute = '/splash';
  static const String homeRoute = '/home';
  static const String detailRoute = '/detail';
  static const String searchRoute = '/search';
  static const String wabViewRoute = '/wabView';

  static Map<String, WidgetBuilder> get routes => {
    initialRoute: (context) => SplashScreen(),
    homeRoute: (context) => HomeScreen(),
    detailRoute: (context){
      final args = ModalRoute.of(context)!.settings.arguments;
      final id = (args is int) ? args : 0;
      return DetailScreen(id: id);
    },
    searchRoute:(context) => SearchScreen(),
    wabViewRoute:(context) {
      final arg = ModalRoute.of(context)!.settings.arguments;
      final url = (arg is String) ? arg : '';
      return WebViewScreen(url: url);
    }
  };
}
