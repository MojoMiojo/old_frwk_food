import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:desafio_padawans_flutter/src/screens/cart_screen/cart_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/home_screen/home_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/login_screen/login_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/product_details/product_details_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/splash_screen/splash_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/tab_bar_screen/tab_bar_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plus/plus.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: ColorsUtil.vermelho,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterAppPlus(
      debugShowCheckedModeBanner: false,
      title: 'frwkFood',
      navigatorKey: FlutterPlus.navigator.navigatorKey,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        canvasColor: Colors.transparent,
      ),
      home: SplashScreen(),
      //home: HomeScreen(),
      //home: LoginScreen(),
      //home: TabBarScreen(),
      //home: ProductDetailsScreen(),
      //home: CartScreen(),
    );
  }
}
