import 'emp_model.dart';

class EmpOne {
  String? status;
  String? message;
  Employees data;

  EmpOne({
    this.status,this.message,required this.data
  });
  EmpOne.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        status = json['status'],
        data = Employees.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
        'data': data.toJson(),
      };
}
