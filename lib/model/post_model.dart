
class Employees{
  String? id;
  String? employee_name;
  String? employee_salary;
  String? profile_image;
  String? employee_age;
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

class Employee{
  int? id;
  String? name;
  String? salary;
  String? age;
  Employee({
    this.name,this.id,this.salary,this.age
  });
  Employee.fromJson(Map<String,dynamic>json)
      : id =json['id'],
        name = json['name'],
        salary = json['salary'],
        age = json['age'];

  Map<String, dynamic> toJson()=>{
    'id':id,
    'name':name,
    'salary':salary,
    'age':age,
  };
}