import 'package:flutter_bilibili/Fragment/dynamic/model/dynamic_model_entity.dart';
import 'package:flutter_bilibili/Fragment/channelPage/news_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "DynamicModelEntity") {
      return DynamicModelEntity.fromJson(json) as T;
    } else if (T.toString() == "NewsEntity") {
      return NewsEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}