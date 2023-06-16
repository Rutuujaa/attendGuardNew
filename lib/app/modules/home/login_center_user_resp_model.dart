class LoginCenterUserResp {
  bool? success;
  int? error;
  String? errorMsg;
  String? token;

  LoginCenterUserResp({this.success, this.error, this.errorMsg, this.token});

  LoginCenterUserResp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    errorMsg = json['errorMsg'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    data['errorMsg'] = errorMsg;
    data['token'] = token;
    return data;
  }
}
