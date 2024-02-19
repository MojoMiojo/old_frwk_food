import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:desafio_padawans_flutter/src/screens/cart_screen/cart_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/tiles/food_tile.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_plus/plus.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> menu = [
    "Food",
    "Drinks",
    "Snacks",
    "Sauces",
    "IN PROGRESS"
  ];
  List<int> marked = [0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.background,
      appBar: this._appBar(),
      body: Column(
        children: [
          this._buildTitleAndSearch(),
          SizedBox(height: 46),
          this._buildBodyTopics(),
          this._buildFoodTiles(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: ButtonPlus(
        child: Image.asset(
          "assets/foodImages/Vector.png",
          fit: BoxFit.cover,
        ),
        onPressed: () {},
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      actions: [
        InkWell(
          onTap: () {
            navigatorPlus.navigate(CartScreen(), modal: true);
          },
          child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 50),
            child: Image.asset(
              "assets/foodImages/shopping-cart.png",
              //fit: BoxFit.cover,
            ),
          ),
        )
        /* ButtonPlus(
          color: Colors.green,
          margin: EdgeInsets.only(right: 50),
          child: Image.asset(
            "assets/foodImages/shopping-cart.png",
            fit: BoxFit.cover,
          ),
          onPressed: () {
            navigatorPlus.navigate(CartScreen(), modal: true);
          },
        ) */
      ],
    );
  } //end _appBar

  Widget _buildTitleAndSearch() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 24),
          Text(
            "Delicious\nfood for you",
            style: TextStyle(
              color: Colors.black,
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 28),
          this._search(),
        ],
      ),
    );
  }

  FocusNode focus = FocusNode();

  Widget _search() {
    return TextFieldPlus(
      focusNode: this.focus,
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      maxLines: 1,
      backgroundColor: ColorsUtil.backgroundInput,
      radius: RadiusPlus.all(30),
      placeholder: TextPlus(
        'Search',
        color: ColorsUtil.cinza,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      prefixWidget: Icon(Icons.search, color: Colors.black),
      shadow: [ShadowPlus(color: ColorsUtil.cinza, opacity: 0.2)],
      cursorColor: ColorsUtil.vermelho,
      border: BorderPlus(
        color: ColorsUtil.vermelho,
        width: 1,
        style: this.focus.hasFocus ? BorderStyle.solid : BorderStyle.none,
      ),
      onTap: () {
        setState(() {});
      },
    );
  } //end _emailField

  Widget _buildBodyTopics() {
    return Container(
      height: 40,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 50),
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // physics: ClampingScrollPhysics(),
        children: this.menu.map((topic) {
          var index = this.menu.indexOf(topic);
          return this._buildTopic(topic, index);
        }).toList(),
      ),
    );
  } //end _buildyBody

  Widget _buildTopic(String topic, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          this.marked.clear();
          this.marked.add(index);
          print(this.marked);
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$topic",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: this.marked.contains(index)
                  ? ColorsUtil.vermelho
                  : ColorsUtil.cinza,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 3,
            width: 87,
            color: this.marked.contains(index)
                ? ColorsUtil.vermelho
                : Colors.transparent,
          )
        ],
      ),
    );
  } //end _buildTopic

  Widget _buildFoodTiles() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 33),
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) {
          return FoodTile();
        }),
      ),
    );
  } //end _buildFoodTiles

} //end class
