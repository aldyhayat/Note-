import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detail.dart';
import 'adddata.dart';
import 'login.dart';
void main() => {
      runApp(new MaterialApp(
        title: "Note",
        home: new MyApp(),
      ))
    };

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> { 

  Future<List> getData() async {
    final response = await http
        .get(Uri.parse("http://10.0.2.2/mobile%20Programming/api/list.php"));
    return json.decode(response.body);
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Note"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  '',
                  // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
            new ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.logout),
              onTap: ()=> Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new LoginApp()
              )
            ),
            )
          ],
        ),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data ?? [],
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed:()=>Navigator.of(context).push(
          new MaterialPageRoute(
            builder:(BuildContext context)=> new AddData(),
        ),),
        child: new Icon(Icons.add),
        backgroundColor: Colors.teal,
      
      )
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, int index) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child : GestureDetector(
            onTap: ()=> Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(list:list, index: index)
              )
            ),
            child: new Card(
            child: new ListTile(
              title: new Text(list[index]['Task']),
              // subtitle: new Text("Date : ${list[index]['Date']}"),
            ),
          ),
          )
           
        );
      },
    );
  }
}


