/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Root {
  String? centerNo;
  String? centerName;
  String? centerAddress;

  Root({this.centerNo, this.centerName, this.centerAddress});

  Root.fromJson(Map<String, dynamic> json) {
    centerNo = json['centerNo'];
    centerName = json['centerName'];
    centerAddress = json['centerAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['centerNo'] = centerNo;
    data['centerName'] = centerName;
    data['centerAddress'] = centerAddress;
    return data;
  }
}
