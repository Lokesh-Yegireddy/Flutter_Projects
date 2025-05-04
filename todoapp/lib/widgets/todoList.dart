import 'package:flutter/material.dart';

// ignore: must_be_immutable
class todoListBuilder extends StatefulWidget {
  List<String> todoList;
  void Function() UpdateLocalData;

  todoListBuilder({
    super.key,
    required this.todoList,
    required this.UpdateLocalData,
  });

  @override
  State<todoListBuilder> createState() => _todoListBuilderState();
}

// ignore: camel_case_types
class _todoListBuilderState extends State<todoListBuilder> {
  //This func is triggered when list item is clicked
  void onItemClicked({required int index}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                widget.todoList.removeAt(index);
              });
              widget.UpdateLocalData();
              Navigator.pop(context);
            },
            child: Text("Mark as Done!"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (widget.todoList.isEmpty)
        ? Center(child: Text("No Items on your todo list...!"))
        : ListView.builder(
          itemCount: widget.todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.startToEnd,
              background: Container(
                color: Colors.green[300],
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.check),
                    ),
                  ],
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  widget.todoList.removeAt(index);
                });
                widget.UpdateLocalData();
              },
              child: ListTile(
                onTap: () {
                  onItemClicked(index: index);
                },
                title: Text(widget.todoList[index]),
              ),
            );
          },
        );
  }
}
