import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddToDo extends StatefulWidget {
  void Function({required String todoText}) addTodo;

  AddToDo({super.key, required this.addTodo});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  TextEditingController todotext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add ToDo"),
        TextField(
          onSubmitted: (value) {
            if (todotext.text.isNotEmpty) {
              widget.addTodo(todoText: todotext.text);
            }
            todotext.text = "";
          },
          autofocus: true,
          controller: todotext,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            hintText: "Write your todo here...",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (todotext.text.isNotEmpty) {
              widget.addTodo(todoText: todotext.text);
              todotext.text = "";
            }
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
