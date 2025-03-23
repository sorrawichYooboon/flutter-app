import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/navbar_widget.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todoItems = [];
  final TextEditingController _textFieldController = TextEditingController();

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todoItems.add(task);
      });
      _textFieldController.clear();
    }
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  void _promptAddTodoItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New task'),
          content: TextField(controller: _textFieldController, autofocus: true),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                _textFieldController.clear();
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                _addTodoItem(_textFieldController.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        return _buildTodoItem(_todoItems[index], index);
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return ListTile(title: Text(todoText), onTap: () => _removeTodoItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _promptAddTodoItem,
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
