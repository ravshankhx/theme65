
import 'emp_model.dart';

class EmpList{

  String? status;
  String? message;
  List<Employees> data;
  // EmpList({
  //   this.status,this.message,this.data
  // });
  EmpList.fromJson(Map<String,dynamic>json)
      : message =json['message'],
        status = json['status'],
        data = List<Employees>.from(json["data"].map((x)=>Employees.fromJson(x)));

  Map<String, dynamic> toJson()=>{
    'message':message,
    'status':status,
    'data':new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}