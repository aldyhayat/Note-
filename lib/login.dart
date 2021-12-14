import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'main.dart';
class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}


class _LoginAppState extends State<LoginApp> {

  TextEditingController email= new TextEditingController();
  TextEditingController pass= new TextEditingController();
  
  String msg= '';
  
  void _Login() async {
    final response = await http.post(Uri.parse("http://10.0.2.2/mobile%20Programming/api/login.php"), body: {
      "email" : email.text,
      "pass" : pass.text,
    });
    
    var datauser= json.decode(response.body);
    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
      });
    }else {
      setState(() {
        Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new MyApp(),
                
              )
            );
      });
          
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("Login"),backgroundColor: Colors.teal,),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new TextField(
              controller: email,
              decoration: new InputDecoration(
                hintText: "Masukan Username",
                labelText: "Username",
              )
            ),
            new TextField(
              controller: pass,
              decoration: new InputDecoration(
                hintText: "Masukan Password",
                labelText: "Password",
              )
            ),
          
          new Padding(padding: const EdgeInsets.only(top: 30.0),),
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new RaisedButton(
                onPressed: (){
                  _Login();
                },
                color: Colors.teal,
                child: new Text("Login"),
                ),
                new Padding(padding: const EdgeInsets.only(left: 10.0),),
                new RaisedButton(
                  onPressed: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=> new SignUp(),
                  )
              ),
                  child: new Text("Sign up"),
                  color: Colors.green,
                  ),

                 ],
          ),
          new Text(msg,style: TextStyle(fontSize: 20.0, color:Colors.red,))
          ],
        ),
        
        ),
    );
  }
}