import 'package:flutter/material.dart';
import 'package:theme65/model/emp_list_model.dart';
import 'package:theme65/model/emp_model.dart';
import 'package:theme65/model/empone_model.dart';
import 'package:theme65/services/http_service.dart';

class DetailPage extends StatefulWidget {
  static final String id = "detail_page";
  final int? input;
  DetailPage({required this.input});


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Employees employees = new Employees();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpOne();
  }
  void _apiEmpOne(){
    Network.GET(Network.API_LISTT+widget.input.toString(), Network.paramsEmpty())
        .then((response) => {
      print(response),
      _showResponse(response!),
    });
  }
  void _showResponse(String response) {
    if (response != null) {
      EmpOne empone = Network.parseEmpOne(response);
      setState(() {
        employees = empone.data;
      });
    } else {
      print("Try again!");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Employee"),
        ),
        body: Center(
          child: itemOfEmploy(employees),
        )
    );
    }

    Widget itemOfEmploy(Employees emp) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              emp.employee_name.toString() +
                  "(" +
                 emp.employee_age.toString() +
                  ")",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              emp.employee_salary.toString() + "\$",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      );
    }
  }
