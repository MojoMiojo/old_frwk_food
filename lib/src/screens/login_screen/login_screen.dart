import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:desafio_padawans_flutter/src/screens/home_screen/home_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/login_screen/signUp_tile.dart';
import 'package:desafio_padawans_flutter/src/screens/tab_bar_screen/tab_bar_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/widgets/button_widget.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_plus/plus.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.background,
      body: ListView(
        children: [
          Column(
            children: [
              this._credentialSelector(),
              this.selectedItem == 0 ? this._loginFormulary() : SignUpTile(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 32),
        child: ButtomWidget(
          buttomColor: ColorsUtil.vermelho,
          text: "Login",
          textColor: Colors.white,
          fn: () {
            navigatorPlus.navigate(TabBarScreen(), modal: true);
          },
        ),
      ),
    );
  } //build

  Widget _credentialSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          SizedBox(
            height: 48,
          ),
          Center(
            child: Image.asset(
              "assets/foodImages/cookHat.png",
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: ButtonPlus(
                  highlightColor: ColorsUtil.vermelho,
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 3,
                        color: this.selectedItem == 0
                            ? ColorsUtil.vermelho
                            : Colors.transparent,
                      )
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      this.selectedItem = 0;
                    });
                  },
                ),
              ),
              Flexible(
                child: ButtonPlus(
                  highlightColor: ColorsUtil.vermelho,
                  child: Column(
                    children: [
                      Text(
                        "Sign-up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 3,
                        color: this.selectedItem == 1
                            ? ColorsUtil.vermelho
                            : Colors.transparent,
                      )
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      this.selectedItem = 1;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  } //end _credentialSelector()

  Widget _loginFormulary() {
    return ContainerPlus(
      //color: Colors.pink,
      //isExpanded: true,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 32),
      child: Container(
        //color: Colors.yellow,
        child: Center(
          //Listview
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              this._emailField(),
              SizedBox(height: 24),
              this._passField(),
              SizedBox(height: 24),
              Text(
                "Forgot password?",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: ColorsUtil.vermelho,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } //end _formulary

  Widget _emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email Adress",
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: ColorsUtil.cinza,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsUtil.vermelho),
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
    );
  } //end _emailField

  Widget _passField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: ColorsUtil.cinza,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsUtil.vermelho),
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 1,
      keyboardType: TextInputType.visiblePassword,
    );
  } //end _passField

} //end class
