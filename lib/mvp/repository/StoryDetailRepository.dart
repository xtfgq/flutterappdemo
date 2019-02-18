import 'package:my_flutter_app/model/BaseModel.dart';
import 'package:my_flutter_app/model/StoryDetailModel.dart';
import 'package:my_flutter_app/model/StoryExtraModel.dart';

abstract class StoryDetailRepository {

  Future<BaseModel<StoryDetailModel>> loadStoryDetail(String id);

  Future<BaseModel<StoryExtraModel>> loadStoryExtra(String id);

}