import 'package:flutternews/common/entity/entitys.dart';
import 'package:flutternews/common/utils/utils.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<UserResponseEntity> login({UserRequestEntity params}) async {
    var response = await HttpUtil().post('/user/login', params: params);
    return UserResponseEntity.fromJson(response);
  }
}