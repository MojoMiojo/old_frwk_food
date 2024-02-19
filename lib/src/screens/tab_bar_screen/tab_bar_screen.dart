import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:desafio_padawans_flutter/src/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  final List<Widget> _children = [
    HomeScreen(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: this.index,
        children: this._children,
      ),
      bottomNavigationBar: _buildBottomBar(context, this.index),
    );
  }

  Widget _buildBottomBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      backgroundColor: ColorsUtil.background,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.home,
            color: currentIndex == 0 ? ColorsUtil.vermelho : ColorsUtil.cinza,
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.favorite_border,
            color: currentIndex == 1 ? ColorsUtil.vermelho : ColorsUtil.cinza,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.person_outline,
            color: currentIndex == 2 ? ColorsUtil.vermelho : ColorsUtil.cinza,
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.update,
            color: currentIndex == 3 ? ColorsUtil.vermelho : ColorsUtil.cinza,
            size: 30,
          ),
        ),
      ],
      currentIndex: currentIndex,
      elevation: 0,
      selectedItemColor: ColorsUtil.vermelho,
      onTap: (int index) {
        setState(() {
          this.index = index;
        });
        // frwkTabBar.changeTabIndex(index);
      },
    );
  }
}
