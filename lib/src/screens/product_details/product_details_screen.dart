import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:desafio_padawans_flutter/src/screens/cart_screen/cart_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_plus/flutter_plus_exports.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.background,
      appBar: this._appBar(),
      body: Column(
        children: [
          this._buildCarousel(),
          this._buildBody(),
        ],
      ),
      bottomNavigationBar: this._bottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: InkWell(
        onTap: () {
          navigatorPlus.back();
        },
        child: Container(
          margin: EdgeInsets.only(left: 34),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 50),
            child: Icon(Icons.favorite_border, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildCarousel() {
    List<String> product = [
      "assets/foodImages/Mask_Group.png",
      "assets/foodImages/Mask_Group.png",
      "assets/foodImages/Mask_Group.png",
      "assets/foodImages/Mask_Group.png"
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      height: MediaQuery.of(context).size.height * 0.30,
      child: Carousel(
        dotIncreasedColor: ColorsUtil.vermelho,
        dotSize: 8.0,
        dotSpacing: 18,
        dotBgColor: Colors.transparent,
        dotColor: ColorsUtil.cinza,
        autoplay: false,
        images: product.map((url) {
          return Container(
            //color: Colors.green,
            child: Image.asset(
              url,
              //fit: BoxFit.cover,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        //color: Colors.green,
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              "Veggie tomato mix",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: Colors.black),
            ),
            SizedBox(height: 12),
            Text(
              "N1,900",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: ColorsUtil.vermelho),
            ),
            SizedBox(height: 22),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Text(
                    "Delivery info",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Delivered between monday aug and thursday 20 from 8pm to 91:32 pm",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Return policy",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  } //end _buildBody

  Widget _bottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 12, 50, 32),
      child: ButtomWidget(
        buttomColor: ColorsUtil.vermelho,
        textColor: Colors.white,
        text: "Add to cart",
        fn: () {
          navigatorPlus.navigate(CartScreen(), modal: true);
        },
      ),
    );
  }
} //end class
