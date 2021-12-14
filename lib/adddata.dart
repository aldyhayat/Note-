import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {  

  TextEditingController cTask = new TextEditingController();
  TextEditingController cContent = new TextEditingController();

  void addData(){
    var url =Uri.parse("http://10.0.2.2/mobile%20Programming/api/adddata.php");
    
    http.post(url, body: {
      "Task": cTask.text,
      "Content": cContent.text,
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add Data"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new TextField(
              controller: cTask,
              decoration: new InputDecoration(
                hintText: "Task",
                labelText: "Task",
              )
            ),
            new TextField(
              controller: cContent,
              decoration: new InputDecoration(
                hintText: "Content",
                labelText: "Content",
              )
            ),
          ],
        )
        ),
        
        floatingActionButton: FloatingActionButton(
             onPressed: (){
               setState(() {
                         
                            addData();
                            Navigator.pop(context);
                          
                        });
             },
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
        )
    );
  }
}
