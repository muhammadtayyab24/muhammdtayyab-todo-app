import 'dart:html';

import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  List<dynamic> lst = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
              itemCount: lst.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.amber,
                  height: 50,
                  child: Text("${lst[index]}"),
                );
              })
        ],
      ),
    );
  }
}
