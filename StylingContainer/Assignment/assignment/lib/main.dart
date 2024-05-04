import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Styling"),
        ),
        body: 
       Container(
         //     padding: const EdgeInsets.symmetric(
          //    padding: const EdgeInsets.all(20),
             padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
              height: 300,
              width: 300,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black,width: 5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.purple,offset: Offset(30,30),blurRadius: 8),
                  BoxShadow(
                    color: Colors.red,offset: Offset(20,20),blurRadius: 8),  
                  BoxShadow(
                    color: Colors.green,offset: Offset(10,10),blurRadius: 8),
                ],

                // gradient: const LinearGradient(
                //   stops: [0.3,0.5],
                //   colors: [Colors.red,Colors.green],
                // )
              ),
            )
      ),
    );
  }
}
