import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:wechat_clone/constants.dart';
import './conversation_page.dart';

enum ActionItems { GROP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView({
    Key key,
    String title,
    IconData icon,
    IconData activeIcon,
    BottomNavigationBarItem item,
  }) : item = new BottomNavigationBarItem(
            icon: Icon(icon),
            activeIcon: Icon(activeIcon),
            title: Text(title),
            backgroundColor: Colors.white);
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 底部BottomItem数组
  List<NavigationIconView> _navigationViews;
  // 当前选中的BottomItem索引
  int _currentIndex = 0;
  // 分页
  PageController _pageController;
  // 存取分页对应的Widget
  List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    // 底部BottomItem数组初始化
    _navigationViews = [
      new NavigationIconView(
        title: "微信",
        icon: const IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      new NavigationIconView(
        title: "通讯录",
        icon: const IconData(
          0xe601,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe656,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      new NavigationIconView(
        title: "发现",
        icon: const IconData(
          0xe600,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe671,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      new NavigationIconView(
        title: "我",
        icon: const IconData(
          0xe6c0,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe626,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
    ];

    // 分页初始化
    _pageController = PageController(initialPage: _currentIndex);

    // 初始化分页Widget
    _pages = [
      ConversationPage(),
      Container(
        color: Colors.grey,
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.blue,
      )
    ];
  }

  // 构建顶部加号下拉列表项菜单
  _buildPopupMenuItem(int iconName, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          IconData(iconName, fontFamily: Constants.IconFontFamily),
          size: 22.0,
          color: Color(AppColors.AppBarPopupMenuColor),
        ),
        Container(
          width: 12.0,
        ),
        Text(
          title,
          style: TextStyle(color: Color(AppColors.AppBarPopupMenuColor)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        print("点击了第$index个");
        // 重绘动态赋值
        setState(() {
          // 设置当前选中的索引
          _currentIndex = index;

          // 设置pageController对应的index
          _pageController.animateToPage(_currentIndex,
              duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("点击了搜搜");
              },
            ),
          ),
          Container(
              padding: EdgeInsets.only(right: 8.0),
              child: PopupMenuButton(
                icon: Icon(Icons.add),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<ActionItems>>[
                    PopupMenuItem(
                      child: _buildPopupMenuItem(0xe69e, "发起群聊"),
                      value: ActionItems.GROP_CHAT,
                    ),
                    PopupMenuItem(
                      child: _buildPopupMenuItem(0xe638, "添加朋友"),
                      value: ActionItems.ADD_FRIEND,
                    ),
                    PopupMenuItem(
                      child: _buildPopupMenuItem(0xe61b, "扫一扫"),
                      value: ActionItems.QR_SCAN,
                    ),
                    PopupMenuItem(
                      child: _buildPopupMenuItem(0xe62a, "收付款"),
                      value: ActionItems.PAYMENT,
                    ),
                    PopupMenuItem(
                      child: _buildPopupMenuItem(0xe63d, "帮助与反馈"),
                      value: ActionItems.HELP,
                    ),
                  ];
                },
                onSelected: (ActionItems actionItems) {
                  print('点击的是$actionItems');
                },
              )
              // IconButton(
              // icon: Icon(
              //   IconData(
              //     0xe65e,
              //     fontFamily: Constants.IconFontFamily,
              //   ),
              //   size: 22.0,
              // ),
              // onPressed: () {
              //   print("显示下拉列表");
              // },
              ),
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext contex, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: 4,
        onPageChanged: (int index) {
          print('当前选择时第$index页');
          setState(() {
            // 设置选中的索引
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
