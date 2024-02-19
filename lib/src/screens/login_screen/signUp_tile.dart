import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/plus.dart';

class SignUpTile extends StatefulWidget {
  @override
  _SignUpTileState createState() => _SignUpTileState();
}

class _SignUpTileState extends State<SignUpTile> {
  @override
  Widget build(BuildContext context) {
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
              this._field("Full name"),
              SizedBox(height: 24),
              this._passField("Password"),
              SizedBox(height: 24),
              this._passField("Confirm your password"),
            ],
          ),
        ),
      ),
    );
  } //end _formulary

  Widget _field(String labelText) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "$labelText",
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
      //keyboardType: TextInputType.emailAddress,
    );
  }

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
  }

  Widget _passField(String labelText) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "$labelText",
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

}
