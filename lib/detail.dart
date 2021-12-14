import 'package:flutter/material.dart';
import 'editdata.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({required this.list,required this.index});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData(){
    var url=Uri.parse("http://10.0.2.2/mobile%20Programming/api/deletedata.php");
    http.post(url, body: {
    'id': widget.list[widget.index]['id']
  });
  }

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are u sure want delete? '${widget.list[widget.index]['Task']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Ok Delete!", style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: ()=> {
            setState(() {
               deleteData();
            Navigator.of(context).push(
              new MaterialPageRoute(builder: 
              (BuildContext context)=> new MyApp())
            );
            })
            },
          ),
          new RaisedButton(
          child: new Text("Cancel", style: new TextStyle(color: Colors.black),),
          color: Colors.green,
          onPressed: ()=>Navigator.pop(context)
          ),
      ],
    );
  showDialog(context: context, builder: (_)=> alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['Task']}"),
      backgroundColor: Colors.teal,
      ),
      body: new Container(
        child: new Card(
          child : new Center(
          child : new Column(
            children: <Widget>[
              new Padding(padding: const EdgeInsets.only(top: 30.0)),
              new Text(widget.list[widget.index]['Task'],style: new TextStyle(fontSize: 40.0),),
              new Padding(padding: const EdgeInsets.only(top: 30.0)),              
              new Text("Isi : ${widget.list[widget.index]['Content']}",style: new TextStyle(fontSize: 20.0),),
            ],
          ),
          )
        ),
 
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=> new EditData(list: widget.list,index: widget.index),
                  )
              ),
              child: Icon(Icons.edit),
              backgroundColor: Colors.teal,
            ),
            FloatingActionButton(
              onPressed: ()=>confirm(),
              child: Icon(Icons.remove),
              backgroundColor: Colors.red,
            ),
           
          ],
        ),
      ),
    );
  }
}