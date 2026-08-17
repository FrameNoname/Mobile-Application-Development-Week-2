import 'dart:io';
import 'package:todo/todo_logic.dart';
import 'package:todo/todo_model.dart';

void main() {
  Todo todo = Todo();

  // start
 String? choice;
  do {
    showMenu();
    stdout.write("Select an option (1-8): ");
    choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // view tasks
        if (todo.todos.isEmpty) {
          print('No tasks');
          break;
        } else {
          for (int i = 0; i < todo.todos.length; i++) {
            String task = todo.todos[i].showTask();
            print('${i + 1}. $task');
          }
        }
        break;
      case '2':
        // Add Task
        stdout.write('Enter task: ');
        String? task = stdin.readLineSync();
        if (task == null || task.trim().isEmpty) {
          print('Error: invalid input');
          break;
        }
        todo.addTask(task);
        print('Task added.');
        break;
      case '3':
        // Edit Task
        if (todo.todos.isEmpty) {
          print('No tasks');
          break;
        }
        stdout.write('Enter task ID: ');
        String? id = stdin.readLineSync();
        int? index = int.tryParse(id ?? '');
        if (index == null || index < 1 || index > todo.todos.length) {
          print('Error: invalid index');
          break;
        }
        stdout.write('Enter new title: ');
        String? newTitle = stdin.readLineSync();
        if (newTitle == null || newTitle.trim().isEmpty) {
          print('Error: invalid title');
          break;
        }
        if (todo.editTask(index, newTitle)) {
          print('Task updated.');
        } else {
          print('Error updating task.');
        }
        break;
      case '4':
        // Delete Task
        if (todo.todos.isEmpty) {
          print('No tasks');
          break;
        }
        stdout.write('Enter task ID: ');
        String? id = stdin.readLineSync();
        int? index = int.tryParse(id ?? '');
        if (index == null || !todo.deleteTask(index)) {
          print('Error: invalid index');
        } else {
          print('Task deleted.');
        }
        break;
      case '5':
        // Toggle Task Status
        if (todo.todos.isEmpty) {
          print('No tasks');
          break;
        }
        stdout.write('Enter task ID: ');
        String? id = stdin.readLineSync();
        int? index = int.tryParse(id ?? '');
        if (index == null || !todo.toggleTask(index)) {
          print('Error: invalid index');
        } else {
          print('Task status updated.');
        }
        break;
      case '6':
        // Search Tasks
        if (todo.todos.isEmpty) {
          print('No tasks');
          break;
        }
        stdout.write('Enter search keyword: ');
        String? query = stdin.readLineSync();
        if (query == null || query.trim().isEmpty) {
          print('Error: invalid search query');
          break;
        }
        List<Task> results = todo.searchTasks(query);
        if (results.isEmpty) {
          print('No matching tasks found.');
        } else {
          print('Found ${results.length} task(s):');
          for (int i = 0; i < todo.todos.length; i++) {
            if (results.contains(todo.todos[i])) {
              print('${i + 1}. ${todo.todos[i].showTask()}');
            }
          }
        }
        break;
      case '7':
        // Clear All Tasks
        if (todo.todos.isEmpty) {
          print('No tasks');
          break;
        }
        todo.clearAll();
        print("All tasks cleared");
        break;
      case '8':
        print("Exiting program...");
        break;
      default:
        print("Please select 1-8");
    }
  } while (choice != '8');
}

void showMenu() {
  print("\n========== TODO app ==========");
  print("1. View Tasks");
  print("2. Add Task");
  print("3. Edit Task");
  print("4. Delete Task");
  print("5. Toggle Task Status");
  print("6. Search Tasks");
  print("7. Clear All Tasks");
  print("8. Exit");
  print("=============================");
}

