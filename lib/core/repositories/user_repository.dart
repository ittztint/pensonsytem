import 'package:pensionsystem/UI/responsiveState/base_view_model.dart';
import 'package:pensionsystem/core/mixins/validators.dart';
import 'package:pensionsystem/services/cache.dart';

class UserProvider extends BaseNotifier with Validators {
  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  Future<Map<String, String>> headerWithToken() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString("token")!;

    Map<String, String> headerToken = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Token ${SessionManager().getString("token")}',
    };
    return headerToken;
  }
}
