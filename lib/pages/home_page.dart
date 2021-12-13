import 'package:flutter/material.dart';
import 'package:theme65/model/emp_list_model.dart';
import 'package:theme65/model/emp_model.dart';
import 'package:theme65/model/empone_model.dart';
import 'package:theme65/pages/detail_page.dart';
import 'package:theme65/services/http_service.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employees> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpList();
  }
  Future _openDetails(Employees item)async{
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
      return new DetailPage(
        input: item.id,
      );
    })
    );
  }
  void _apiEmpList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  void _showResponse(String response) {
    if (response != null) {
      EmpList empList = Network.parseEmpList(response);
      setState(() {
        items = empList.data;
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
          title: Text("Employee List"),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, i) {
            return itemOfList(items[i]);
          },
          itemCount: items.length,
        ));
  }

  Widget itemOfList(Employees emp) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10,),
          FlatButton(onPressed: () {

            _openDetails(emp);
          },
              child: Container(
                width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  emp.employee_name! +
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
          )),
        ],
      ),
    );
  }
}
