import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo/screen1.dart';
import 'package:todo/screen2.dart';
import 'package:todo/screen3.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = "";

  List<dynamic> lst = ["add"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Todo App")),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                color: Color(0xFFf0ebeb),
                margin: EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text(
                    "${lst[index]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  trailing: Container(
                    width: 82,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("edit item"),
                                      content: TextField(onChanged: (value) {
                                        output = value;
                                      }),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {output});
                                            });
                                          },
                                          child: Text("edit"),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Icon(
                              Icons.edit,
                              color: Color(0xFF120554),
                            )),
                        SizedBox(width: 5),
                        GestureDetector(
                            child: Icon(
                          Icons.mark_as_unread,
                          color: Color(0xFF000000),
                        )),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              lst.removeAt(index);
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("add item"),
                  content: TextField(onChanged: (value) {
                    output = value;
                  }),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            lst.add(output);
                          });
                        },
                        child: Text("add"))
                  ],
                );
              });
        },
        child: Text("Add"),
      ),
    );
  }
}
