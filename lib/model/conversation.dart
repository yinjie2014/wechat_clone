import 'package:flutter/material.dart';

import '../constants.dart' show AppColors;

// 登录设备类型枚举
enum Device {
  MAC,
  WIN,
}

class Conversation {
  final String avatar; // 头像地址
  final String title; // 标题
  final String des; // 简介
  final String updateAt; // 最新记录时间
  final bool isMute; // 是否开启勿扰模式
  final int titleColor; // 标题颜色
  final int unreadMsgCount; // 未读消息数量
  final bool displayDot; // 是否以小圆点形式显示

  bool isAvatarFromNet() {

    /// 判断图片是否是网络图片
    /// 是否是以http或https开头
    if(avatar.indexOf('http') == 0 || avatar.indexOf('https') == 0) {
      return true;
    }
    return false;
  }

  const Conversation({
    @required this.avatar,
    @required this.title,
    this.titleColor: AppColors.ConversationTitleCorlor,
    this.des,
    @required this.updateAt,
    this.isMute: false,
    this.unreadMsgCount: 0,
    this.displayDot: false,
  })  : assert(avatar != null),
        assert(title != null),
        assert(updateAt != null);
}

const List<Conversation> mockConversation = [
  const Conversation(
      avatar: 'assets/images/ic_file_transfer.png',
      title: '文件传输助手',
      des: '',
      updateAt: '19:56',
      unreadMsgCount: 2,
      displayDot: true
    ),
    const Conversation(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      des: '豪车与出租车刮擦 俩车主划拳定责',
      updateAt: '17:20',
    ),
    const Conversation(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: 0xff586b95,
      des: '25元现金助力开学季！',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      des: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'assets/images/ic_fengchao.png',
      title: '蜂巢智能柜',
      titleColor: 0xff586b95,
      des: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      des: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 99,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      des: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      des: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      des: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 1,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      des: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
    ),
];
