import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtomWidget extends StatelessWidget {
  String text;
  Color textColor;
  Color buttomColor;
  VoidCallback fn;

  ButtomWidget({this.text, this.textColor, this.buttomColor, this.fn});

  @override
  Widget build(BuildContext context) {
    return _buildButtom();
  }

  Widget _buildButtom() {
    return Container(
      //margin: const EdgeInsets.only(bottom: 12),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        color: this.buttomColor,
        height: 70,
        child: Text(
          "${this.text}",
          style: TextStyle(
            color: this.textColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {
          this.fn();
        },
      ),
    );
  }
}
