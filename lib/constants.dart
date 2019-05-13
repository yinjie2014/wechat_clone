import 'package:flutter/material.dart';

class AppColors {
  static const AppBarColor = 0xff303030;
  static const TabIconNormal = 0xff999999;
  static const TabIconActive = 0xff46c11b;
  static const AppBarPopupMenuColor = 0xffffffff;
  static const ConversationTitleCorlor = 0xff000000;
  static const ConversationItemBg = 0xffffffff;
  static const ConversationDesColor = 0xff9e9e9e;
  static const DividerColor = 0xffd9d9d9;
  static const NotifyDotBg = 0xffff3e3e;
  static const NotifyDotText = 0xffffffff;
  static const ConversationMuteIconColor = 0xffd8d8d8;
  static const DeviceInfoItemBg = 0xfff5f5f5;
  static const DeviceInfoItemText = 0xff606062;
}

class AppStyle {
  // 标题文本样式
  static const titleStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.ConversationTitleCorlor),
  );

  // 描述文本样式
  static const desStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.ConversationDesColor),
  );

  // 角标样式
  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.NotifyDotText),
  );

  // 多端登录提示文本样式
  static const DeviceInfoItemStyle = TextStyle(
    fontSize: 13.0,
    color: Color(AppColors.DeviceInfoItemText),
  );
}

class Constants {
  static const IconFontFamily = "appIconFont";
  static const ConversationAvatarSize = 48.0;
  static const DividerWidth = 1.0;
  static const UnReadMsgNotifyDotSize = 20.0;
  static const ConversationMuteIconSize = 18.0;
}