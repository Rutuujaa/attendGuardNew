import 'package:get/get.dart';
import '../login_center_user_resp_model.dart';
import 'package:example_getx/app/constants/constants.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return User.fromJson(map);
    //   if (map is List) return map.map((item) => User.fromJson(item)).toList();
    // };
    httpClient.baseUrl = ApiConstants.baseUrl;
  }

  Future<String?> loginCenterUser(String mobile, String password) async {
    final url = "${ApiConstants.baseUrl}${ApiConstants.loginCenterUser}";
    print('baseurl is: ${ApiConstants.baseUrl}');
    print('api route is : ${ApiConstants.loginCenterUser}');
    final response = await post(
      url,
      {'login': mobile, 'password': password},
    );
    print("response to login is ${response.body}");
    final loginCenterUserResp = LoginCenterUserResp.fromJson(response.body);
    print('loginCenterUserResp.token is: ${loginCenterUserResp.token}');
    return loginCenterUserResp.token;
  }
}
