import 'dart:io';

import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../get_photo_sign_resp_model.dart';

class GetPhotoSignRespProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return GetPhotoSignResp.fromJson(map);
    //   if (map is List)
    //     return map.map((item) => GetPhotoSignResp.fromJson(item)).toList();
    // };
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.defaultContentType = "application/json";
  }

  Future<GetPhotoSignResp?> getPhotoSign(String rollNumber) async {
    var url = '${ApiConstants.baseUrl}${ApiConstants.getPhotoSign}/$rollNumber';
    String token = ApiConstants.token;
    final response = await get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    GetPhotoSignResp obj = GetPhotoSignResp.fromJson(response.body);
    print("photo is : ${obj.photo}");
    return obj;
    // return response.body;
  }
}
