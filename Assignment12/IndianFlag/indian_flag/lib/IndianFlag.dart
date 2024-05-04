import 'package:flutter/material.dart';

class IndianFlag extends StatefulWidget{
  const IndianFlag({super.key});
  
  @override
  State<StatefulWidget> createState() => _IndianFlagState();
}

class _IndianFlagState extends State<IndianFlag>{
  int counter = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 156, 247),   //if used SizedBox
        appBar: AppBar(
          title: const Text("counter App"),
          backgroundColor: Colors.deepPurple,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: const Text("Add"),
        ),
        body: SizedBox(
        
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              (counter >= 0)
                  ? Container(
                      height: 600,
                      width: 15,
                      color: const Color.fromARGB(255, 99, 35, 12),
                    )
                  : Container(),
              Column(
                children: [
                  (counter >= 1)
                      ? Container(height: 80, width: 300, color: Color.fromARGB(255, 255, 153, 0))
                      : Container(),
                  (counter >= 2)
                      ? Container(
                          color: Colors.white,
                          height: 80,
                          width: 300,
                          child: (counter >= 3)
                              ? Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY9eJ9gWX3Xm2H-Rg74iCt1ehfPe7jRwXEbw&usqp=CAU",
                                )
                              : Container(),
                        )
                      : Container(),
                  (counter >= 4)
                      ? Container(height: 80, width: 300, color: Color.fromARGB(255, 13, 184, 19))
                      : Container(),
                ],
              )
            ],
          ),
        ));
  }

}