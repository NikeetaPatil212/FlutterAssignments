import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget{
  const ToDoApp({super.key});
  
  @override
  State createState() => _ToDoAppState();
}

class ToDoModelClass{
  String title;
  String description;
  String date;

  ToDoModelClass({
    required this.title,
    required this.description,
    required this.date,
  });
}

class _ToDoAppState extends State<ToDoApp>{

  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void showBottomSheet(bool doEdit, [ToDoModelClass? toDoModelClassObj]){
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        isDismissible: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10,),
                Text("Create Task",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),),
                const SizedBox(height: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Title",
                      style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color:const Color.fromRGBO(0,139,148,1),
                    ),),
                     const SizedBox(height: 3,),
                     TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 139, 148, 1),
                            ),   
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                            color: Colors.purpleAccent,
                            ),   
                        ),  
                      ),                     
                     ),
                     const SizedBox(height: 12,),

                      Text("Description",
                      style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: const Color.fromRGBO(0,139,148,1),
                    ),),
                     const SizedBox(height: 3,),

                     TextField(
                      controller: descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 139, 148, 1),
                            ),   
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                            color: Colors.purpleAccent,
                            ),   
                        ),  
                      ),                     
                     ),
                     const SizedBox(height: 12,),

                      Text("Date",
                      style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: const Color.fromRGBO(0,139,148,1),
                    ),),
                     const SizedBox(height: 3,),

                      TextField(
                      controller: dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 139, 148, 1),
                            ),   
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                            color: Colors.purpleAccent,
                            ),   
                        ),  
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context, 
                          initialDate: DateTime.now(), 
                          firstDate: DateTime(2024), 
                          lastDate: DateTime(2025),
                          );
                          String formateDate = DateFormat.yMMMd().format(pickedDate!);

                          setState(() {
                            dateController.text = formateDate;
                          });
                      },                     
                     ),
                  ],
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromRGBO(0, 139,148, 1),
                    ),
                    onPressed: () {
                      doEdit ? submit(doEdit,toDoModelClassObj) : submit(doEdit);
                      Navigator.of(context).pop();
                    },
                    child:   Text("Submit",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white,
                            ),),
                  ),
                ),
                const SizedBox(height: 30,)
              ],
            ),
            );
        },
    );
  }

   var listOfColors = [
      const Color.fromRGBO(250, 232, 232,1),
      const Color.fromRGBO(232, 237, 250,1),
      const Color.fromRGBO(250, 249, 232,1),
      const Color.fromRGBO(250, 232, 250,1),
     ];


  List<ToDoModelClass> todoList = [
    ToDoModelClass(
      title: "Take notes", 
      description: "Take nots of every app you write",
      date: "10 July 2023",),
  ];

  void submit(bool doEdit,[ToDoModelClass? toDoModelObj]){
    if(titleController.text.trim().isNotEmpty && 
    descriptionController.text.trim().isNotEmpty &&
    dateController.text.trim().isNotEmpty){
      if(!doEdit){
        setState((){
          todoList.add(
            ToDoModelClass(title: titleController.text.trim(), 
            description: descriptionController.text.trim(), 
            date: dateController.text.trim(),
            ),
          );
        });
      }else{
        setState(() {
          toDoModelObj!.date = dateController.text.trim();
          toDoModelObj.title = titleController.text.trim();
          toDoModelObj.description = descriptionController.text.trim();
        });
      }
    }
    clearController();
  }

  void clearController(){
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  //Remove notes
  void removeTasks(ToDoModelClass toDoModelClassObj){
    setState(() {
      todoList.remove(toDoModelClassObj);
    });
  }

  void editTask(ToDoModelClass todoModelObj){
    titleController.text = todoModelObj.title;
    descriptionController.text = todoModelObj.description;
    dateController.text = todoModelObj.date;

    showBottomSheet(true,todoModelObj);
  }

  @override
  void dispose(){
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
        centerTitle: true,
        title: Text(
          "TODO APP",
          style: GoogleFonts.quicksand(fontWeight: FontWeight.w700,
          fontSize: 25,),
        ),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context,index){
            return Padding(padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 16,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: listOfColors[index % listOfColors.length],
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 10),
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.network("https://cdn.pixabay.com/photo/2017/06/06/00/33/edit-icon-2375785_640.png"),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(child: 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(todoList[index].title,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: const Color.fromRGBO(0, 0, 0,1),
                            ),),
                            const SizedBox(height: 10,),
                             Text(todoList[index].description,
                            style: 
                            GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: const Color.fromRGBO(84, 84, 84,1),
                            ),),
                          ],
                        ),),
                      ],
                    ),
                
                    const SizedBox(height: 14.0,),

                    //2 
                    Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [
                      Text(todoList[index].date,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color.fromRGBO(132, 132, 132,1),
                            ),),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    editTask(todoList[index]);
                                  },
                                  child: const Icon(
                                    Icons.edit_outlined,
                                    color: Color.fromRGBO(0, 139, 148,1),
                                  ),
                                ),
                                const SizedBox(width: 10,),

                                GestureDetector(
                                  onTap: () {
                                    removeTasks(todoList[index]);
                                  },
                                  child: const Icon(
                                    Icons.delete_outlined,
                                    color: Color.fromRGBO(0, 139, 148,1),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                              ],
                            )
                    ],),
                    )
                  ],
                )
                ),
              ),
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
          onPressed: () {
            clearController();
            showBottomSheet(false);
          },
          child: const Icon(
            size: 50,
            Icons.add,
            color: Colors.white,
          ),
        ),
    );
  }
}