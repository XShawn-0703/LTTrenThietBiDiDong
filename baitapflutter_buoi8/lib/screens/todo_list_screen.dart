import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../database/database_helper.dart';

// Tạo counter Provider model
class TodoProvider extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final TextEditingController _controller = TextEditingController();
  List<Todo> _todos = [];

  void initState() {
    _loadTodos();
    notifyListeners();
  }

  Future<void> _loadTodos() async {
    final todos = await _databaseHelper.getTodos();
    _todos = todos;
    notifyListeners();
  }

  Future<void> _addTodo() async {
    if (_controller.text.isEmpty) return;

    final todo = Todo(title: _controller.text);
    await _databaseHelper.insertTodo(todo);
    _controller.clear();
    _loadTodos();
    notifyListeners();
  }

  Future<void> _toggleTodo(Todo todo) async {
    final updatedTodo = Todo(
      id: todo.id,
      title: todo.title,
      isCompleted: !todo.isCompleted,
    );
    await _databaseHelper.updateTodo(updatedTodo);
    _loadTodos();
    notifyListeners();
  }

  Future<void> _deleteTodo(int id) async {
    await _databaseHelper.deleteTodo(id);
    _loadTodos();
    notifyListeners();
  }
}


class TodoListScreen extends StatelessWidget {

  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, todoProvider,child) {
      return Scaffold(
        appBar: AppBar(
            title: const Text('Todo List')
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoProvider._controller,
                      decoration: const InputDecoration(
                        hintText: 'Add a new todo',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: todoProvider._addTodo,
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todoProvider._todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoProvider._todos[index];
                    return ListTile(
                      leading: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (bool? value) => todoProvider._toggleTodo(todo),
                      ),
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => todoProvider._deleteTodo(todo.id!),
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}

