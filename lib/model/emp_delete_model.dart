
class EmpDelete {
  String? status;
  String? message;
  String? data;

  EmpDelete({
    this.status,this.message,required this.data
  });
  EmpDelete.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        status = json['status'],
        data =json['data'];

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': data,
  };
}
