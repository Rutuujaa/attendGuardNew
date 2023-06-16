//import 'dart:convert';

//String GetRoomNoRespToJson(GetRoomNoResp data) => json.encode(data.toJson());

class GetRoomNoResp {
  String? centerNo;
  String? roomNo;
  int? present;
  int? absent;
  int? total;

  GetRoomNoResp(
      {this.centerNo, this.roomNo, this.present, this.absent, this.total});

  factory GetRoomNoResp.fromJson(Map<String, dynamic> json) {
    return GetRoomNoResp(
      centerNo: json['centerNo'],
      roomNo: json['roomNo'],
      present: json['present'],
      absent: json['absent'],
      total: json['total'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['centerNo'] = this.centerNo;
  //   data['roomNo'] = this.roomNo;
  //   data['present'] = this.present;
  //   data['absent'] = this.absent;
  //   data['total'] = this.total;
  //   return data;
  // }

  // void myPrintInfo() {
  //   print("centerNo: $centerNo");
  //   print("roomNo: $roomNo");
  //   print("present: $present");
  //   print("absent: $absent");
  //   print("total: $total");
  //   return;
  // }
}
