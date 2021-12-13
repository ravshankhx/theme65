
class Employees{
  int? id;
  String? employee_name;
  int? employee_salary;
  String? profile_image;
  int? employee_age;
  Employees({
    this.employee_name,this.id,this.employee_salary,this.profile_image,this.employee_age
  });
  Employees.fromJson(Map<String,dynamic>json)
      : id =json['id'],
        employee_name = json['employee_name'],
        employee_salary = json['employee_salary'],
        employee_age = json['employee_age'],
        profile_image = json['profile_image'];

  Map<String, dynamic> toJson()=>{
    'id':id,
    'employee_name':employee_name,
    'profile_image':profile_image,
    'employee_salary':employee_salary,
    'employee_age':employee_age,
  };
}