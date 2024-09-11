import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goal_app/src/goal.dart';

class HomePageState extends State<HomePage> {
  late Future<Goal> goal;

  @override
  void initState() {
    super.initState();
    goal = fetchRandomGoal();
  }

  Future<Goal> fetchRandomGoal() async {
    String s = await rootBundle.loadString('assets/goals.json');
    print(s);
    return const Goal(goalString: "temp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), body: body());
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Goals Daily',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      // actions: const [IconButton(onPressed: null, icon: Icon(Icons.search))],
      backgroundColor: Colors.blueGrey,
      elevation: 0.0,
      centerTitle: true,
    );
  }

  Widget body() {
    return FutureBuilder<Goal>(
        future: goal,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("An error has occurred"));
          } else if (snapshot.hasData) {
            return const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text('This is where the prompt would go',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}
