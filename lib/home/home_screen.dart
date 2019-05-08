import 'package:flutter/material.dart';

class NavigationIconView {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({
    Key key,
    String title,
    Widget icon,
    Widget activeIcon,
    BottomNavigationBarItem item,
  })  : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        item = new BottomNavigationBarItem(
            icon: icon,
            activeIcon: activeIcon,
            title: Text(title),
            backgroundColor: Colors.white);
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();

    _navigationViews = [
      new NavigationIconView(
        title: "微信",
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm),
      ),
      new NavigationIconView(
        title: "通讯录",
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm),
      ),
      new NavigationIconView(
        title: "发现",
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm),
      ),
      new NavigationIconView(
        title: "我",
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        print("点击了第$index个");
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("搜索按钮");
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print("显示下拉列表");
            },
          )
        ],
      ),
      body: Container(
        color: Colors.blue[50],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
