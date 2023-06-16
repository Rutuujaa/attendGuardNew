import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../views/get_roomno_model.dart';

class GetRoomNoRespProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.defaultContentType = "application/json";
  }

  Future<GetRoomNoResp> getAttendance(String centerNo) async {
    print('#2');
    var url = '${ApiConstants.baseUrl}${ApiConstants.getAttendance}/$centerNo';
    String token = ApiConstants.token;
    final response = await get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    print('#4');
    //print(response.body);
    print('#5');
    if (response.statusCode == 200) {
      // If the server returns an OK response, then parse the JSON.
      return GetRoomNoResp.fromJson(json.decode(response.body));
    } else {
      // If the response was umexpected, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

// class Root extends GetConnect {
//   @override
//   Future<void> centerNo() async {
//   final response = await http.get(Uri.parse('<API_URL>'));
//   if (response.statusCode == 200) {
//     final jsonData = jsonDecode(response.body);
//     final root = Root.fromJson(jsonData);
//     print(root.centerNo);
//     print(root.centerName);
//     print(root.centerAddress);
//   } else {
//     print('Failed to fetch data from API');
//   }
// }
// void main() {
//   centerNo()
// }
