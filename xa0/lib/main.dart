import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X and 0 App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const MyHomePage(title: 'X AND O'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var table = [[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]];
  int flag = 0,loop=1;
  String t = "X has Won!";

  //function to reset the game
  void reset(){
    for(int i=0; i<3; i++){
      for(int j=0; j<3; j++){
        table[i][j]=-1;
      }
    }
    flag=0;
    loop=1;
  }

  void fill(){
    for(int i=0; i<3; i++){
      for(int j=0; j<3; j++){
        if(table[i][j]==-1){
          return;
        }
      }
    }
    t = "Draw!";
    loop=0;
    return;
  }

  void match(int f,int row,int col){
    int b = 1;
    //horizontal check
    for(int i=0; i<3; i++){
      if(table[row][i] != f){
        b = 0;
        break;
      }
    }
    if(b == 1){
      if(f == 1){
        t = "X has Won!";
      }
      else{
        t = "O has Won!";
      }
      loop=0;
      return;
    }
    //vertical check
    b = 1;
    for(int i=0; i<3; i++){
      if(table[i][col] != f){
        b = 0;
        break;
      }
    }
    if(b == 1){
      if(f == 1){
        t = "X has Won!";
      }
      else{
        t = "O has Won!";
      }
      loop=0;
      return;
    }
    //Diagonal check
    if((row == 0 && col == 0) || (row == 0 && col == 2) || (row == 1 && col == 1) 
    || (row == 2 && col == 0) || (row == 2 && col == 2)){
      if((table[0][0] == f)&&(table[1][1] == f)&&(table[2][2] == f)){
        if(f == 1){
          t = "X has Won!";
        }
        else{
          t = "O has Won!";
        }
        loop=0;
        return;
      }
      else if((table[0][2] == f)&&(table[1][1] == f)&&(table[2][0] == f)){
        if(f == 1){
          t = "X has Won!";
        }
        else{
          t = "O has Won!";
        }
        loop=0;
        return;
      }
    }
  }

  void _reset(){
    setState((){
      reset();
    });
  }

  void _incrementCounter(int row, int col, int input_flag) {
    setState(() {
      if(input_flag == 0 && table[row][col] == -1 && loop==1){
        //array location updated to show X
        table[row][col] = 1;
        flag = 1;
        match(flag, row, col);
        if(loop == 1){
          fill();
        }
      }
      else if(input_flag == 1 && table[row][col] == -1 && loop==1){
        //array location updated to show 0
        table[row][col] = 0;
        flag = 0;
        match(flag, row, col);
        if(loop == 1){
          fill();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        title: Center(child: Text(widget.title, style: TextStyle(color: const Color.fromARGB(255, 196, 196, 196), fontWeight: FontWeight.bold),),),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: GridView.count(
                shrinkWrap: true, 
                
                physics: const NeverScrollableScrollPhysics(), 

                crossAxisCount: 3,
                padding: const EdgeInsets.all(16.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: List.generate(9, (index) {
                  int row = index ~/ 3;
                  int col = index % 3;

                  String buttonText;
                  if (table[row][col] == 1) {
                    buttonText = 'X';
                  } else if (table[row][col] == 0) {
                    buttonText = 'O';
                  } else {
                    buttonText = '';
                  }

                  return ElevatedButton(
                    onPressed: () {
                      _incrementCounter(row, col,flag);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      padding: const EdgeInsets.all(32.0),
                      side: BorderSide(color: const Color.fromARGB(255, 95, 95, 95), width: 1),
                      backgroundColor: const Color.fromARGB(255, 33, 33, 33),
                    ),
                    child: Text(
                      buttonText,
                      style: buttonText=='O' ? TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blue):TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  );
                }),
              ),
            ),
          ),
          loop==0 ? Text(t, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)) : Text(""),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: BorderSide(color: const Color.fromARGB(255, 95, 95, 95), width: 1),
                backgroundColor: const Color.fromARGB(255, 33, 33, 33),
              ),
              onPressed: () {_reset();},
              child: const Text("Reset Game", style: TextStyle(color:Color.fromARGB(255, 196, 196, 196))),
            ),
          ),
        ],
      ),
    );
  }
}
