import 'package:scoped_model/scoped_model.dart';
class HomeModel  extends Model{
  String name = 'HomoModel这里';

//重写of方法
  static HomeModel of(context) => ScopedModel.of<HomeModel>(context);
}