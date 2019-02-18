class Constant {

  static const String baseUrl = "https://news-at.zhihu.com/api/4/";

  //宽高常量
  static const double bannerHeight = 200.0;
  static const double normalItemHeight = 100.0;
  static const double dateTimeItemHeight = 60.0;

  //字符串常量
  static const String todayHot = '今日热点';
  static const String themeTitle = '专题';
  static const String storyTitle = '详情';

  static const String tips = '本页应该由banner+html组成，由于Flutter对Html支持的问题，'
      '以及暂时没找到好的解决方案，暂缓该功能，怕忘记了，故保留该页面，作为优化\n请点击下面链接跳转到webview查看本文';
}