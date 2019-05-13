import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/conversation.dart';

class _ConversationItem extends StatelessWidget {
  final Conversation conversation;

  const _ConversationItem({Key key, this.conversation})
      : assert(conversation != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 根据图片类型来创建网络图片或者本地图片
    Widget avatar;
    if (conversation.isAvatarFromNet()) {
      avatar = Image.network(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    } else {
      avatar = Image.asset(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    }

    // 头像和消息的组合控件
    Widget avtarConstainer;
    if (conversation.unreadMsgCount > 0) {
      // 未读消息角标控件
      Widget unreadMsgCountText = Container(
        width: Constants.UnReadMsgNotifyDotSize,
        height: Constants.UnReadMsgNotifyDotSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(Constants.UnReadMsgNotifyDotSize / 2.0),
          color: Color(AppColors.NotifyDotBg),
        ),
        child: Text(
          conversation.unreadMsgCount.toString(),
          style: AppStyle.UnreadMsgCountDotStyle,
        ),
      );

      // 头像和消息的组合控件
      avtarConstainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            top: -Constants.UnReadMsgNotifyDotSize / 4.0,
            right: -Constants.UnReadMsgNotifyDotSize / 4.0,
            child: unreadMsgCountText,
          ),
        ],
      );
    } else {
      avtarConstainer = avatar;
    }

    // 勿扰模式图标
    Widget muteIcon = Icon(
      IconData(0xe755, fontFamily: Constants.IconFontFamily),
      color: Color(AppColors.ConversationMuteIconColor),
      size: Constants.ConversationMuteIconSize,
    );

    // 右侧时间和勿扰控件List
    List<Widget> _rightArea = [
      Text(
        conversation.updateAt,
        style: AppStyle.desStyle,
      )
    ];

    // 如果开启勿扰模式则添加勿扰图标
    if (conversation.isMute) {
      _rightArea.add(Container(
        height: 10.0,
      ));
      _rightArea.add(muteIcon);
    } else {
      _rightArea.add(Container(
        height: 10.0,
      ));
      _rightArea.add(SizedBox(
        height: Constants.ConversationMuteIconSize,
      ));
    }

    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color(AppColors.DividerColor),
                  width: Constants.DividerWidth)),
          color: Color(AppColors.ConversationItemBg)),
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          avtarConstainer,
          Container(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  conversation.title,
                  style: AppStyle.titleStyle,
                ),
                Text(conversation.des, style: AppStyle.desStyle),
              ],
            ),
          ),
          Container(
            width: 10.0,
          ),
          Container(
            child: Column(
              children: _rightArea,
            ),
          ),
        ],
      ),
    );
  }
}

// 多端登录提示信息Widget
class _DeiveInfoItem extends StatelessWidget {
  const _DeiveInfoItem({Key key, this.device: Device.WIN})
      : assert(device != null),
        super(key: key);
  
  // 设备枚举
  final Device device;

  // 图标名称
  Icon get iconName {
    return device == Device.WIN ? Icon(Icons.widgets) : Icon(Icons.desktop_mac);
  }

  // 设备名称
  String get deviceName {

    Map aa = {'aaa': 'aaaaaafadasdasa'};
    print(aa['aaa']);

    return device == Device.WIN ? 'Windows': 'MAC';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(AppColors.DeviceInfoItemBg),
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Color(AppColors.DividerColor)))),
      padding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          iconName,
          SizedBox(
            width: 10.0,
          ),
          Text('$deviceName 微信已登录，手机通知已关闭'),
        ],
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _DeiveInfoItem();
          }
          return _ConversationItem(
            conversation: mockConversation[index],
          );
        },
        itemCount: mockConversation.length,
      ),
    );
  }
}
