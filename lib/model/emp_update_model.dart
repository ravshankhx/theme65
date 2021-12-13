
class EmpUpdate {
  String? status;
  String? message;
  List data;

  EmpUpdate({
    this.status,this.message,required this.data
  });
  EmpUpdate.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        status = json['status'],
        data =List.from(json["data"].map((x)=>null));

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'data': new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
