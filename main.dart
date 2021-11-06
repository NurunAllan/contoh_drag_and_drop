// Program : contoh_drag_and_drop.dart
// Oleh    : Erico Darmawan Handoyo

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyAppState(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyAppState extends StatefulWidget {
  const MyAppState({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyAppState> createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  Color color1 = Colors.red;
  Color color2 = Colors.grey;
  Color color3 = Colors.yellow;
  Color targetColor=Colors.black26;
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Contoh Drag and Drop")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Draggable<Color>(
                        data: color1,
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: Material(
                            color: color1,
                            shape: StadiumBorder(),
                            elevation: 3,
                          ),
                        ),
                        childWhenDragging: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: Material(
                            color: Colors.grey,
                            shape: StadiumBorder(),
                            elevation: 3,
                          ),
                        ),
                        feedback: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: Material(
                            color: color1.withOpacity(0.5),
                            shape: StadiumBorder(),
                            elevation: 3,
                          ),
                        )),
                    Draggable<Color>(
                        data: color3,
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: Material(
                            color: color3,
                            shape: StadiumBorder(),
                            elevation: 3,
                          ),
                        ),
                        childWhenDragging: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: Material(
                            color: Colors.grey,
                            shape: StadiumBorder(),
                            elevation: 3,
                          ),
                        ),
                        feedback: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: Material(
                            color: color3.withOpacity(0.5),
                            shape: StadiumBorder(),
                            elevation: 3,
                          ),
                        )),
                  ]
              ),
              DragTarget<Color>(
                  onWillAccept: (value) => true,
                  onAccept: (value) {
                    isAccepted=true;
                    targetColor=value;
                  },
                  builder: (context, candidates, rejected) {
                    return (isAccepted) ? SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Material(
                        color: targetColor,
                        shape: StadiumBorder(),
                      ),
                    ) : SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Material(
                        color: Colors.black26,
                        shape: StadiumBorder(),
                      ),
                    );
                  }
              ),
            ],
          ),
        )

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
