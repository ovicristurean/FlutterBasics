import 'package:flutter/material.dart';
import 'package:flutter_basics/model/todo.dart';

class TodoDetails extends StatefulWidget {
  final Todo todo;

  TodoDetails(this.todo);

  @override
  State<StatefulWidget> createState() {
    return TodoDetailsState(todo);
  }
}

class TodoDetailsState extends State {
  Todo todo;

  TodoDetailsState(this.todo);

  final _priorities = ["High", "Medium", "Low"];
  String _priority = "Low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(todo.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: titleController,
            style: textStyle,
            decoration: InputDecoration(
                labelText: "Title",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
          TextField(
            controller: descriptionController,
            style: textStyle,
            decoration: InputDecoration(
                labelText: "Description",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
          DropdownButton<String>(
            items: _priorities.map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),

            )).toList(),
            style: textStyle,
            value:"Low",
            onChanged: null,
          ),
        ],
      ),
    );
  }


}
