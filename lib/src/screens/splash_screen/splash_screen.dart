import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:desafio_padawans_flutter/src/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _splashScreenMode().then((status) {
      if (status) {
        _gettingOut();
      }
    });
  }

  Future<bool> _splashScreenMode() async {
    await Future.delayed(Duration(seconds: 5), () {});
    return true;
  }

  void _gettingOut() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => WelcomeScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/foodImages/Splash.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: (MediaQuery.of(context).size.width / 2) - 18,
          top: (MediaQuery.of(context).size.height / 2) + 56,
          child: CircularProgressIndicator(
            //espessura
            strokeWidth: 2,
            backgroundColor: Colors.white,
            valueColor: new AlwaysStoppedAnimation<Color>(ColorsUtil.vermelho),
          ),
        )
      ]),
    );
  }
}
