import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyApp",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Three Containers"),
        ),
        body: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, 
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(height: 100, width: 100, color: Colors.red),
            Container(height: 100, width: 100, color: Colors.green),
            Container(height: 100, width: 100, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
