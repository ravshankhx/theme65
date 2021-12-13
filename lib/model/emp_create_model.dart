import 'package:theme65/model/user_data_model.dart';

class EmpCreate {
  String? status;
  String? message;
  User data;

  EmpCreate({this.status, this.message, required this.data});

  EmpCreate.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        status = json['status'],
        data = User.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
        'data': data.toJson(),
      };
}
