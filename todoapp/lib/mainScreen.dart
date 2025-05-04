import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/addToDo.dart';
import 'package:todoapp/widgets/todoList.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];

  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Already Exists!"),
            content: Text("This Todo Data is already existed... "),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text("close"),
              ),
            ],
          );
        },
      );

      return;
    }

    setState(() {
      todoList.insert(0, todoText);
    });
    UpdateLocalData();
    Navigator.pop(context);
  }

  void UpdateLocalData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save an list of strings to 'items' key.
    await prefs.setStringList('todoList', todoList);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    todoList = (prefs.getStringList("todoList") ?? []).toList();

    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void showAddToDoBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: EdgeInsets.all(20),
            height: 200,
            child: AddToDo(addTodo: addTodo),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blueGrey[900],
        child: Icon(Icons.add, color: Colors.white),
        onPressed: showAddToDoBottomSheet,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey[900],
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  "ToDo App",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                launchUrl(Uri.parse(""));
              },
              leading: Icon(Icons.person),
              title: Text(
                "About Me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                launchUrl(Uri.parse("mailto:yegireddylokesh123@gmail.com"));
              },
              leading: Icon(Icons.email),
              title: Text(
                "Contact Me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text("ToDo App"), centerTitle: true),

      body: todoListBuilder(
        todoList: todoList,
        UpdateLocalData: UpdateLocalData,
      ),
    );
  }
}
