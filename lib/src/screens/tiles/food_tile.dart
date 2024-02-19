import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:desafio_padawans_flutter/src/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus_exports.dart';

class FoodTile extends StatefulWidget {
  @override
  _FoodTileState createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: this._buildTiles(),
    );
  } //end build

  Widget _buildTiles() {
    double height = MediaQuery.of(context).size.height * 0.36;
    double width = MediaQuery.of(context).size.width * 0.54;

    return Center(
      child: Stack(
        children: [
          //Fundo
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            height: height,
            width: width,
            //Don't touch the extremes
            margin: EdgeInsets.fromLTRB(17, 10, 17, 10),
          ),
          //WhiteCardTextAndValue
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                navigatorPlus.navigate(ProductDetailsScreen(), modal: true);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 38),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                height: (height - (height * 0.18)),
                width: width,
                margin: EdgeInsets.fromLTRB(17, 10, 17, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Veggie\ntomato mix",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "N1,900",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: ColorsUtil.vermelho,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //Imagem
          Positioned(
            top: 0,
            left: 50,
            right: 50,
            child: Container(
              child: Image.asset(
                "assets/foodImages/Mask_Group.png",
                //fit: BoxFit.cover,
                height: height * 0.48,
              ),
            ),
          ),
        ],
      ),
    );
  }
} //end class

/*calcs

TileWidth
414 - 100
220 - x
414x = 22000
x = 56%

----
TileHeigth
896 - 100
330 - x
896x = 33000
x = 36%

--

330 - 100
60 - x
330x = 6000
x = 18%

foodImage

width
220 - 100
164 - x

220x = 16400

x = 74%

Heigth

330 - 100
183 - x

330x = 18300

x = 55%

*/
