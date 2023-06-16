class GetPhotoSignResp {
  String? rollNumber;
  String? photo;
  String? sign;

  GetPhotoSignResp({this.rollNumber, this.photo, this.sign});

  GetPhotoSignResp.fromJson(Map<String, dynamic> json) {
    rollNumber = json['rollNumber'];
    photo = json['photo'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['rollNumber'] = rollNumber;
    data['photo'] = photo;
    data['sign'] = sign;
    return data;
  }

  void myPrintInfo() {
    print("rollNumber: $rollNumber");
    print("photo: $photo");
    print("sign: $sign");
    return;
  }
}
