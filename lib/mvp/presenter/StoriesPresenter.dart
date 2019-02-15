import 'package:my_flutter_app/model/BaseModel.dart';
import 'package:my_flutter_app/model/HotNewsModel.dart';
import 'package:my_flutter_app/mvp/mvp.dart';

abstract class StoriesPresenter implements IPresenter{
  loadNews(String date);
}


abstract class StoriesView implements IView<StoriesPresenter>{

  void onLoadNewsSuc(BaseModel<HotNewsModel> model);
  void onLoadNewsFail();

}