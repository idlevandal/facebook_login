import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('test')
              .add({'Name': 'Dave'});
        },
      ),
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.facebook, size: 150.0,),
          ElevatedButton(
            onPressed: () async {
              print('test');
              try {
                final LoginResult result = await FacebookAuth.instance.login();
                print(result.status);
                if (result.status == LoginStatus.success) {
                  // you are logged
                  final AccessToken accessToken = result.accessToken!;
                  print(accessToken);
                }
                if (result.status == LoginStatus.cancelled) {
                  print('Login cancelled');
                }
              } catch (err) {
                print(err.toString());
              }
            },
            child: Text('Login'),
          ),
          ElevatedButton(
            onPressed: () async {
              await FacebookAuth.instance.logOut();
            },
            child: Text('Logout'),
          )
        ]
      ),
    );
  }
}

