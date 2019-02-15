import 'package:my_flutter_app/model/BaseModel.dart';
import 'package:my_flutter_app/model/HotNewsModel.dart';

abstract class StoriesRepository {

  Future<BaseModel<HotNewsModel>> loadNews(String date);

}
