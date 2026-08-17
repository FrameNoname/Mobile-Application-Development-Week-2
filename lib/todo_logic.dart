import 'package:todo/todo_model.dart';

class Todo {
  List<Task> todos = [];

  // add task
  void addTask(String title) {
    // create a new task
    Task task = Task(title);
    // add the task to todo list
    todos.add(task);
  }
   // Delete Task
  bool deleteTask(int index) {
    if (index < 1 || index > todos.length) return false;
    todos.removeAt(index - 1);
    return true;
  }
  // Toggle Task
  bool toggleTask(int index) {
    if (index < 1 || index > todos.length) return false;
    todos[index - 1].toggleTask();
    return true;
  }
  // Edit Task
  bool editTask(int index, String newTitle) {
    if (index < 1 || index > todos.length) return false;
    if (newTitle.trim().isEmpty) return false;
    todos[index - 1].title = newTitle;
    return true;
  }

  // Search Tasks
  List<Task> searchTasks(String query) {
    if (query.trim().isEmpty) return [];
    final lowerQuery = query.toLowerCase();
    return todos
        .where((task) => task.title.toLowerCase().contains(lowerQuery))
        .toList();
  }

  // Clear All
  void clearAll() {
    todos.clear();
  }
}


