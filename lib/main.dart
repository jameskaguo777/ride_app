import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ride_app/screens/collection_page.dart';
import 'package:ride_app/screens/home_page.dart';
import 'package:ride_app/screens/initial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ride Share',
      theme: _lightTheme(),
      initialRoute: InitialPage.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        InitialPage.routeName: (context) => const InitialPage(),
        HomePage.routeName: (context) => const HomePage(),
        CollectionPage.routeName: (context) => const CollectionPage(),
      },
    );
  }

  ThemeData _lightTheme() => ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light
    ),
    androidOverscrollIndicator: AndroidOverscrollIndicator.glow,
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Color(Colors.black.value),
              onPrimary: Color(Colors.white.value),
              secondary: Color(Colors.grey.value),
              onSecondary: Color(Colors.black.value),
              error: Color(Colors.red.value),
              onError: Color(Colors.white.value),
              background: Color(Colors.white.value),
              onBackground: Color(Colors.black.value),
              surface: Color(Colors.white.value),
              
              onSurface: Color(Colors.black.value)),
          fontFamily: 'PTSans'
  );
}
