import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'dart:convert';
import 'package:goal_app/src/goal.dart';
import 'package:goal_app/src/logger.dart';

class HomePageState extends State<HomePage> {
  late Future<Goal> goal;
  Logger logger = createLogger("HomePageState");

  @override
  void initState() {
    super.initState();
    goal = fetchRandomGoal();
  }

  Future<Goal> fetchRandomGoal() async {
    String s = await rootBundle.loadString('assets/goals.json');
    try {
      final json = jsonDecode(s) as Map<String, dynamic>;
      final goals = json['goals'];
      var randomItem = (goals..shuffle()).first;
      return Goal(goalString: randomItem);
    } catch (e) {
      logger.e(e);
      return Goal.makeDefault();
    }
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
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Text(snapshot.data!.goalString,
                    style: const TextStyle(
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
