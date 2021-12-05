import 'dart:convert';

import 'package:http/http.dart';
import 'package:theme65/model/post_model.dart';
//http://dummy.restapiexample.com/api/v1/employees
class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  static String status = "success";


  static String API_LIST = "/api/v1/employee";
 static String API_LISTT = "/employee/1";
  static String API_CREATE = "/create";
  static String API_UPDATE = "/update/21"; //{id}
  static String API_DELETE = "/delete/2";


  static Future <String?> GET(String api,Map<String,String> params)async{
    var uri = Uri.http( BASE, api,params);
    var response = await get(uri,headers: headers);
    if(response.statusCode==200){
      return response.body;
    }
    return null;

  }
  static Future <String?> GET1(String api,Map<String,String> params)async{
    var uri = Uri.http( BASE, api,params);
    var response = await get(uri,headers: headers);
    if(response.statusCode==200){
      return response.body;
    }
    return null;

  }
//post
  static Future <String?> POST(String api,Map<String,String> params)async{
    var uri = Uri.http( BASE, api);
    var response = await post(uri,headers: headers,body: jsonEncode(params));
    if(response.statusCode==200 || response.statusCode==201){
      return response.body;
    }
    return null;
  }

//put
  static Future <String?> PUT(String api,Map<String,String> params)async{
    var uri = Uri.http( BASE, api);
    var response = await put(uri,headers: headers,body: jsonEncode(params));
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }
//delete
  static Future <String?> DEL(String api,Map<String,String> params)async{
    var uri = Uri.http( BASE, api,params);
    var response = await delete(uri,headers: headers);
    if(response.statusCode==200){
      return response.body;
    }
    return null;

  }


  static Map<String,String> paramsEmpty(){
    Map<String,String> params = new Map();
    return params;
  }


  static Map<String,String> paramsCreate(Employee employee){
    Map<String,String> params = new Map();
    params.addAll({
    'name': employee.name.toString(),
    'salary':employee.salary.toString(),
    'age': employee.age.toString(),
    'id':employee.id.toString()
    });
    return params;
  }
  static Map<String, String> paramsUpdate(Employees employees) {
    Map<String, String> params = new Map();
    params.addAll({

      'employee_name': employees.employee_name.toString(),
      'employee_salary':employees.employee_salary.toString(),
      'employee_age': employees.employee_age.toString(),
      'profile_image': employees.profile_image.toString(),
      'id':employees.id.toString()
    });
    return params;
  }


}
