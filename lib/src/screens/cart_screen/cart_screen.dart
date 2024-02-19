import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:desafio_padawans_flutter/src/screens/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus_exports.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.background,
      appBar: this._appBar(),
      body: Column(
        children: [
          this._buildBody(),
          this._buildAllTiles(),
        ],
      ),
      bottomNavigationBar: this._bottomNavigationBar(),
    );
  } //end build

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        padding: EdgeInsets.only(left: 50),
        onPressed: () {
          navigatorPlus.back();
        },
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      title: Text(
        "Cart",
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
      ),
      centerTitle: true,
    );
  } //end _appBar

  Widget _buildBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Image.asset("assets/foodImages/iwwa_swipe.png"),
            SizedBox(width: 6),
            Text(
              "swipe on an item to delete",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Colors.black,
              ),
            )
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildAllTiles() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 50),
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: List.generate(3, (index) {
          return this._dragable(index);
        }),
      ),
    );
  }

  Widget _dragable(int index) {
    return Dismissible(
      key: ValueKey(index.toString()),
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) async {
        Future.delayed(Duration(seconds: 10));
        return false;
      },
      background: Container(),
      secondaryBackground: this._secondaryBackground(),
      child: this._onCartTile(index),
    );
  } //end _dragable

  Widget _secondaryBackground() {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: ColorsUtil.getColorByHex("DF2C2C"),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 15),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: ColorsUtil.getColorByHex("DF2C2C"),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  } //end _secondaryBackground

  Widget _onCartTile(int index) {
    int counter = 1;

    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Stack(
        children: [
          //White background
          Container(
            padding: EdgeInsets.all(17),
            height: MediaQuery.of(context).size.height * 0.14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            //Content
            child: Row(
              children: [
                //OrderImage
                Container(
                    child: Image.asset(
                  "assets/foodImages/Mask_Group.png",
                  fit: BoxFit.cover,
                )),
                SizedBox(width: 6),
                //TitleAndPrice
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Title
                    Text(
                      "Veggie tomato mix",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12),
                    //Price
                    Text(
                      "#1,900",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: ColorsUtil.vermelho,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 14,
            right: 24,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 20,
              width: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ColorsUtil.vermelho,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (counter > 1) {
                        setState(() {
                          counter--;
                        });
                      }
                    },
                    child: Text(
                      "-",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: ColorsUtil.getColorByHex("F4F4F7"),
                      ),
                    ),
                  ),
                  Text(
                    "$counter",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: ColorsUtil.getColorByHex("F4F4F7"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Index: $index: | value: $counter");
                      setState(() {
                        counter += 1;
                      });
                    },
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: ColorsUtil.getColorByHex("F4F4F7"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 12, 50, 32),
      child: ButtomWidget(
        buttomColor: ColorsUtil.vermelho,
        textColor: Colors.white,
        text: "Complete order",
        fn: () {},
      ),
    );
  } //end _bottomNavigationBar

} //end class
