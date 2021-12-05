import 'package:flutter/material.dart';
import 'package:theme65/model/post_model.dart';
import 'package:theme65/services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    String data= "";
   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     var employees = new Employees(id: "1",employee_age: "22",employee_name: "ra",employee_salary: "32131",profile_image: "");
     var employee = new Employee(id:1,salary: "1000",name: "online",age: "1");
     print(employee);
     print(employees);
     _apiPostList();
     _apiPostListt();
     _apiCreatePost(employee);
     _apiPostUpdate(employees);
     _apiDeletePost(employees);


   }
  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }
    void _apiPostListt(){
      Network.GET1(Network.API_LISTT, Network.paramsEmpty()).then((response) => {
        print(response),
        _showResponse(response!),
      });
    }
  void _apiCreatePost(Employee employee){
    Network.POST(Network.API_CREATE, Network.paramsCreate(employee)).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

   void _apiPostUpdate(Employees employees){
     Network.PUT(Network.API_UPDATE + employees.id.toString(), Network.paramsUpdate(employees)).then((response) => {
       print(response),
       _showResponse(response!),
     });
   }
  void _apiDeletePost(Employees employees){
    Network.DEL(Network.API_DELETE, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }
  void _showResponse(String response){
    setState(() {
      data =response;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Text(data != null ? data : "KASFKASfpa",style: TextStyle(fontSize: 50),),
        )
      )
    );
  }
}
