import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();


  void signUp(){
    var url =Uri.parse("http://10.0.2.2/mobile%20Programming/api/register.php");
    
    http.post(url, body: {
      "username": username.text,
      "email": email.text,
      "pass": pass.text
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Sign Up"),backgroundColor: Colors.teal,),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new TextField(
              controller: username,
              decoration: new InputDecoration(
                hintText: "Masukan Username",
                labelText: "Username",
              )
            ),
            new TextField(
              controller: email,
              decoration: new InputDecoration(
                hintText: "Masukan Email",
                labelText: "Email",
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
                  setState(() {
                         
                            signUp();
                            Navigator.pop(context);
                          
                        });
                },
                color: Colors.teal,
                child: new Text("Sign Up"),
                ),  

                 ],
          ),
          ],
        ),
        
        ),      
    );
  }
}