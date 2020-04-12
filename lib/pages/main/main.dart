import 'package:flutter/material.dart';
import 'package:flutternews/common/api/apis.dart';
import 'package:flutternews/common/entity/categories.dart';
import 'package:flutternews/common/entity/channels.dart';
import 'package:flutternews/common/entity/news.dart';
import 'package:flutternews/common/utils/utils.dart';
import 'package:flutternews/pages/main/ad_widget.dart';
import 'package:flutternews/pages/main/categories_widget.dart';
import 'package:flutternews/pages/main/channels_widget.dart';
import 'package:flutternews/pages/main/news_item.dart';
import 'package:flutternews/pages/main/newsletter_widget.dart';
import 'package:flutternews/pages/main/recommend_widget.dart';


class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  NewsPageListResponseEntity _newsPageList; // 新闻翻页
  NewsRecommendResponseEntity _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity> _categories; // 分类
  List<ChannelResponseEntity> _channels; // 频道

  String _selCategoryCode; // 选中的分类Code

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories(
      context: context,
      cacheDisk: true,
    );
    _channels = await NewsAPI.channels(
      context: context,
      cacheDisk: true,
    );
    _newsRecommend = await NewsAPI.newsRecommend(
      context: context,
      cacheDisk: true,
    );
    _newsPageList = await NewsAPI.newsPageList(
      context: context,
      cacheDisk: true,
    );

    _selCategoryCode = _categories.first.code;

    if (mounted) {
      setState(() {});
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    return _categories == null
        ? Container()
        : newsCategoriesWidget(
            categories: _categories,
            selCategoryCode: _selCategoryCode,
            onTap: (CategoryResponseEntity item) {
              // _loadNewsData(item.code);
            },
          );
  }
  // 抽取前先实现业务
  // Widget _buildCategories() {
  //   return _categories == null
  //       ? Container()
  //       : SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           child: Row(
  //             children: _categories.map<Widget>((item) {
  //               return Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 8),
  //                 child: GestureDetector(
  //                   child: Text(
  //                     item.title,
  //                     style: TextStyle(
  //                       color: _selCategoryCode == item.code
  //                           ? AppColors.secondaryElementText
  //                           : AppColors.primaryText,
  //                       fontSize: duSetFontSize(18),
  //                       fontFamily: 'Montserrat',
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                   onTap: () {
  //                     setState(() {
  //                       _selCategoryCode = item.code;
  //                     });
  //                   },
  //                 ),
  //               );
  //             }).toList(),
  //           ),
  //         );
  // }

  // 推荐阅读
  Widget _buildRecommend() {
    return _newsRecommend == null //数据没到位，先用骨架图展示
      ? Container()
      : recommendWidget(_newsRecommend);
  }

  // 频道
  Widget _buildChannels() {
    return _channels == null
        ? Container()
        : newsChannelsWidget(
            channels: _channels,
            onTap: (ChannelResponseEntity item) {},
          );
  }

Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
            height: duSetHeight(161 * 5 + 100.0),
          )
        : Column(
            children: _newsPageList.items.map((item) {
              // 新闻行
              List<Widget> widgets = <Widget>[
                newsItem(item),
                Divider(height: 1),
              ];

              // 每 5 条 显示广告
              int index = _newsPageList.items.indexOf(item);
              if (((index + 1) % 5) == 0) {
                widgets.addAll(<Widget>[
                  adWidget(),
                  Divider(height: 1),
                ]);
              }

              // 返回
              return Column(
                children: widgets,
              );
            }).toList(),
          );
  }
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return newsletterWidget();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCategories(),
          _buildRecommend(),
          _buildChannels(),
          _buildNewsList(),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }
}
