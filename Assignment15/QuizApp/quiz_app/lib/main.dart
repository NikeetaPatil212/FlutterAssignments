import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class SingleQueModel{
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQueModel({this.question,this.options,this.answerIndex}); 
}

class _QuizAppState extends State{

  List allQuestions = [
    const SingleQueModel(
      question : "Who is the founder of Microsoft?",
      options : ["Steve Jobs","Jeff Bezos","Bill Gates","Elon Musk"],
      answerIndex : 2,
    ),
    const SingleQueModel(
      question : "Who is the founder of Amazon?",
      options : ["Steve Jobs","Jeff Bezos","Bill Gates","Elon Musk"],
      answerIndex : 1,
    ),
    const SingleQueModel(
      question : "Who is the founder of Apple?",
      options : ["Steve Jobs","Jeff Bezos","Bill Gates","Elon Musk"],
      answerIndex : 0,
    ),
    const SingleQueModel(
      question : "Who is the founder of Tesla?",
      options : ["Steve Jobs","Jeff Bezos","Bill Gates","Elon Musk"],
      answerIndex : 3,
    ),
    const SingleQueModel(
      question : "Who is the founder of Google?",
      options : ["Steve Jobs","Lary Page","Jeff Bezos","Bill Gates"],
      answerIndex : 1,
    ),
  ];

  bool questionScree = true;
  int questionIndex = 0;
  int selectedAnsIndex = -1;
  int numOfCorrectAns = 0;

  MaterialStateProperty<Color?> checkAnswer(int buttonIndex){
    if(selectedAnsIndex != -1){
      if(buttonIndex == allQuestions[questionIndex].answerIndex){
        return const MaterialStatePropertyAll(Colors.green);
      }else if(buttonIndex == selectedAnsIndex){
         return const MaterialStatePropertyAll(Colors.red);
      }else{
        return const MaterialStatePropertyAll(null);
      }
    }else{
     return const MaterialStatePropertyAll(null);
  }
}

void validateCurrentPage(){
  if(selectedAnsIndex == -1){
    return;
  }
  if(selectedAnsIndex == allQuestions[questionIndex].answerIndex){
    numOfCorrectAns += 1;
  }

  if(selectedAnsIndex != -1){
    if( questionIndex == allQuestions.length - 1){
      setState(() {
        questionScree = false;
      });
    }
    selectedAnsIndex = -1;
    setState(() {
      questionIndex += 1;
    });
  }
}

Scaffold isQueScreen(){
    if(questionScree == true){
      return Scaffold(
        appBar: AppBar(
          title: const Text("QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.deepPurple,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 226, 168, 226),
        ),

      body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  const Text("Questions : ",
                    style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("${questionIndex+1} / ${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
           
                SizedBox(
                  width: 300,
                  height: 50,
                  child: Text(allQuestions[questionIndex].question,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),),
                ),
            
            const SizedBox(
              height: 30,
            ),
          

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(0),
              ),
              onPressed: (){
                if(selectedAnsIndex == -1){
                  setState(() {
                    selectedAnsIndex = 0;
                  });
                }
              },
              
              child: Text(
                "A.${allQuestions[questionIndex].options[0]}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              ),
              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(1),
              ),
              onPressed: (){
                if(selectedAnsIndex == -1){
                  setState(() {
                    selectedAnsIndex = 1;
                  });
                }
              },

              child: Text(
                "B.${allQuestions[questionIndex].options[1]}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              ),
              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(2),
              ),
              onPressed: (){
                if(selectedAnsIndex == -1){
                  setState(() {
                    selectedAnsIndex = 2;
                  });
                }
              },

              child: Text(
                "C.${allQuestions[questionIndex].options[2]}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              ),
              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(3),
              ),
              onPressed: (){
                if(selectedAnsIndex == -1){
                  setState(() {
                    selectedAnsIndex = 3;
                  });
                }
              },

              child: Text(
                "D.${allQuestions[questionIndex].options[3]}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              ),
              const SizedBox(
                height: 20,
              ),
          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          validateCurrentPage();
        },
        backgroundColor: const Color.fromARGB(255, 226, 168, 226),
        child: const Icon(Icons.forward,
        color: Colors.deepPurple,),
      ),
      );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: const Text("QuizApp",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.deepPurple,
          ),),
          centerTitle: true,
           backgroundColor: const Color.fromARGB(255, 226, 168, 226),
        ),
        body: 
        Center(
          child: Column(
          
          children: [
            const SizedBox(height: 30,),
            Image.network("https://cdn5.vectorstock.com/i/1000x1000/09/54/prize-cup-to-congratulation-happy-celebration-vector-23930954.jpg",
              height: 360,
              width: 240,
            ),
            const Text("Congratulations!!!",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),),

            const SizedBox(
              height: 20,
            ),
            const Text("Quiz completed",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),),
              const SizedBox(
              height: 20,
            ),
            Text("Score: $numOfCorrectAns/${allQuestions.length}"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 226, 168, 226),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                 
                ),
              ),
              onPressed: (){
                questionIndex = 0;
                questionScree = true;
                numOfCorrectAns = 0;
                selectedAnsIndex = -1;
               
                setState(() {
                  
                });
              },
      
              child: const Text("Reset", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.deepPurple,
              ),),
            ),
          ],
        ),
      ),  
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return isQueScreen();
  }
}