import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
class EditData extends StatefulWidget {
  final List ?list;
  final int ?index;

  EditData({this.list,this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  
  
  late TextEditingController cTask;
  late TextEditingController cContent;

  void editData(){
    var url= Uri.parse("http://10.0.2.2/mobile%20Programming/api/editdata.php") ;
    http.post(url,body: {
      "id": widget.list?[widget.index!]['id'],
      "Task": cTask.text,
      "Content": cContent.text,
    });
  }

@override
  void initState() {
  cTask= new TextEditingController(text: widget.list?[widget.index!]['Task'] );
  cContent= new TextEditingController(text: widget.list?[widget.index!]['Content'] ); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Data"),backgroundColor: Colors.teal,),
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
                         
                            editData();
                             Navigator.of(context).push(
                              new MaterialPageRoute(
                        builder: (BuildContext context)=>new MyApp()
                      )
                    );
                          
                        });
             },
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
        )
   
    );
  }
}