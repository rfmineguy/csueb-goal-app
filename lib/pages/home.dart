import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), body: body());
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Goals Daily',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      actions: const [IconButton(onPressed: null, icon: Icon(Icons.search))],
      backgroundColor: Colors.blueGrey,
      elevation: 0.0,
      centerTitle: true,
    );
  }

  Widget body() {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Text('This is where the prompt would go',
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
