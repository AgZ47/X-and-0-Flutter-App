import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X and 0 App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const MyHomePage(title: 'X and O'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    print("Draw!");
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
      print("$f has won");
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
      print("$f has won");
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
        print("$f has won");
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
        print("$f has won");
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
        fill();
      }
      else if(input_flag == 1 && table[row][col] == -1 && loop==1){
        //array location updated to show 0
        table[row][col] = 0;
        flag = 0;
        match(flag, row, col);
        fill();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 33, 33),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        title: Center(child: Text(widget.title, style: TextStyle(color: Colors.white),)),
      ),
      // 1. We use a Column to stack the grid and the button vertically.
      body: Column(
        children: [
          // 2. This Expanded widget takes up all available space,
          //    pushing the button (which is after it) to the bottom.
          Expanded(
            // 3. We center the GridView within the expanded space.
            child: Center(
              child: GridView.count(
                // 4. IMPORTANT: This tells the grid to only take up
                //    as much space as its children need. It's
                //    necessary when a GridView is inside a Column.
                shrinkWrap: true, 
                
                // Optional: Disables scrolling on the grid itself
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
                      // 5. FIXED: Called the function without the 'flag'
                      //    parameter, as we discussed previously.
                      _incrementCounter(row, col,flag);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      padding: const EdgeInsets.all(32.0), // Adjust size
                      side: BorderSide(color: Colors.white, width: 2),
                      backgroundColor: const Color.fromARGB(255, 33, 33, 33),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                  );
                }),
              ),
            ),
          ),
          loop==0 ? Text(t, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)) : Text(""),
          // 6. This is your new button at the bottom.
          //    It's outside the 'Expanded' widget.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                // Make the button stretch wide
                minimumSize: const Size(double.infinity, 50),
                side: BorderSide(color: Colors.white, width: 2),
                backgroundColor: const Color.fromARGB(255, 33, 33, 33),
              ),
              onPressed: () {_reset();},
              child: const Text("Reset Game"),
            ),
          ),
        ],
      ),
    );
  }
}
