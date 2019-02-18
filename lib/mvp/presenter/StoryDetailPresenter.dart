import 'package:my_flutter_app/model/BaseModel.dart';
import 'package:my_flutter_app/model/StoryDetailModel.dart';
import 'package:my_flutter_app/model/StoryExtraModel.dart';
import 'package:my_flutter_app/mvp/mvp.dart';

abstract class StoryDetailPresenter implements IPresenter{
  loadStoryDetail(String id);

  loadStoryExtra(String id);

}


abstract class StoryDetailView implements IView<StoryDetailPresenter>{

  void onLoadStoryDetailSuc(BaseModel<StoryDetailModel> model);
  void onLoadStoryDetailFail();

  void onLoadStoryExtraSuc(BaseModel<StoryExtraModel> model);
  void onLoadStoryExtraFail();

}