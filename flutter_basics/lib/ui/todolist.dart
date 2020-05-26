import 'package:flutter/material.dart';
import 'package:flutter_basics/model/todo.dart';
import 'package:flutter_basics/ui/tododetail.dart';
import 'package:flutter_basics/util/db.dart';

class TodoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todos",
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Todos"),
          ),
          body: DetailsContent(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print("tapped on the fab");
              //navigateToDetail(Todo("", 3, ""));
            },
            tooltip: "Add new todo",
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class DetailsContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailsContentState();
  }
}

class DetailsContentState extends State<DetailsContent> {
  DbHelper dbHelper = DbHelper();
  List<Todo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = List<Todo>();
      getData();
    }
    return todoListItems();
  }

  ListView todoListItems() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: getColor(this.todos[position].priority),
                child: Text(this.todos[position].id.toString()),
              ),
              title: Text(this.todos[position].title),
              subtitle: Text(this.todos[position].date),
              onTap: () {
                debugPrint(
                    "Tapped on the card" + this.todos[position].id.toString());
                navigateToDetail(this.todos[position]);
              },
            ),
          );
        });
  }

  void getData() {
    final dbFuture = dbHelper.initializeDb();
    dbFuture.then((db) {
      final todosFuture = dbHelper.getTodos();
      todosFuture.then((value) {
        List<Todo> todoList = List<Todo>();
        count = value.length;
        for (int i = 0; i < count; i++) {
          todoList.add(Todo.fromObject(value[i]));
          debugPrint(todoList[i].title);
        }
        setState(() {
          todos = todoList;
          count = count;
        });
      });
    });
  }

  Color getColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.orange;
        break;
      case 3:
        return Colors.green;
        break;
      default:
        return Colors.green;
    }
  }

  void navigateToDetail(Todo todo) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TodoDetails(todo)));
  }
}
