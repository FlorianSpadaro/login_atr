import 'package:flutter/material.dart';
import 'package:test_login/data/rest_ds.dart';
import 'package:test_login/models/user.dart';

class MyForm extends StatefulWidget{
  @override
  MyFormState createState(){
    return new MyFormState();
  }
}

// Define a corresponding State class. This class will hold the data related to 
// the form.
class MyFormState extends State<MyForm> {
  RestDatasource _dtSource = new RestDatasource();
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final loginController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LOGIN"),
      ),
      body: new Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                labelText: "Login"
              ),
              controller: loginController,
            ),
            new TextField(
              decoration: new InputDecoration(
                labelText: "Password"
              ),
              controller: passwordController,
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: new RaisedButton(
                onPressed: (){
                  if(_formKey.currentState.validate())
                  {
                    _dtSource.login(loginController.text, passwordController.text).then((User user){
                      if(user != null)
                      {
                        Navigator.of(context).pushReplacementNamed("/home");
                      }
                      else{
                        print("Identifiants incorrects");
                      }
                    });
                  }
                },
                child: new Text('Submit'),
              ),
            )
          ],
        )
      ),
    );

  }
}