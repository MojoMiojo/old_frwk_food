import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:desafio_padawans_flutter/src/screens/login_screen/login_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/tab_bar_screen/tab_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_plus/plus.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.getColorByHex("FF4B3A"),
      appBar: null,
      body: this._buildBody(context),
      bottomNavigationBar: this._buildButtom(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 32),
        this._buildLogoAndText(),
        //SizedBox(height: 26),
        this._buildStackPersonsImages(),
      ],
    );
  }

  Widget _buildLogoAndText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 74,
              width: 74,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Image.asset(
                "assets/foodImages/cookHat.png",
              )),
          SizedBox(height: 18),
          /* TextPlus(
            'Food for\nEveryone',
            fontSize: 65,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ), */
          Stack(
            children: [
              Text("Food for",
                  maxLines: 1,
                  style: TextStyle(
                    color: ColorsUtil.white,
                    fontSize: 65,
                    fontWeight: FontWeight.w800,
                    //fontFamily: "SF Pro Rounded Regular",
                  )),
              Container(
                padding: EdgeInsets.only(top: 56),
                child: Text(
                  "Everyone",
                  style: TextStyle(
                    color: ColorsUtil.white,
                    fontSize: 65,
                    fontWeight: FontWeight.w800,
                    //fontFamily: "SF Pro Rounded Regular",
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  } //end _buildLogoAndText

  Widget _buildStackPersonsImages() {
    return Expanded(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/foodImages/Group_53.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ContainerPlus(
              alignment: Alignment.bottomCenter,
              //color: Colors.black,
              height: 130,
              gradient: GradientPlus.linear(
                colors: [
                  ColorsUtil.vermelho.withOpacity(0),
                  ColorsUtil.vermelho
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )
        ],
      ),
    );
  } //_buildStackPersonsImages()

  Widget _buildButtom(BuildContext context) {
    return Container(
      color: ColorsUtil.vermelho,
      padding: EdgeInsets.fromLTRB(50, 0, 50, 32),
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          color: Colors.white,
          height: 70,
          onPressed: () {
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (context) => LoginScreen(),
            // ));
            navigatorPlus.navigate(LoginScreen(), modal: true);
          },
          child: Text(
            "Get starteed",
            style: TextStyle(
              color: ColorsUtil.vermelho,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }
}
