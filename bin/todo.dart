import 'dart:io';

void main() {
  List <Map<String,dynamic>> tasks = [
    {'title': 'Cook','complete': false},
    {'title': 'Sleep','complete': false},
    {'title': 'Buy coffee','complete': false}
  ];
  // List<String> tasks = [];
  // start
 String? choice;
  do {
    showMenu();
    stdout.write("Select an option (1-6): ");
    choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // view tasks
        if (tasks.isEmpty) {
          print('No tasks');
          break ;
        // use a loop to show all tasks
        }else{
        for (int i = 0; i < tasks.length; i++) {
          String status = tasks[i]['complete'] == false ? '[⭕]' : '[✅]';
          print("${i + 1}. ${status} ${tasks[i]['title']}");
        }
      }
        break;
      case '2':
        // Add Task
        // get user input (task)
        String? task = stdin.readLineSync();
        if (task == null || task.isEmpty) {
          print('Error: invalid input');
          break;
        }
        // add the tasks to  list
        tasks.add({'title': task,'complete': false});
        break;
      case '3':
        // print('Delete Task')
        // check the list
        if (tasks.isEmpty) {
          print('No tasks');
          break;
        }
        // ask for task ID
        stdout.write('Enter task ID: ');
        String? id = stdin.readLineSync();
        // convert the ID to int 
        if (id == null || id.isEmpty) {
          print('Error: invalid input');
          break;
        }
        int? index = int.tryParse(id);
        if(index == null || index < 1 || index > tasks.length) {
          print('Error: invalid index');
          break;
        }
        // Remove the task .removeAT(index)
        tasks.removeAt(index - 1);
        break;
      case '4':
        // print("Toggle Task Status");
        // check the list
        if (tasks.isEmpty) {
          print('No tasks');
          break;
        }
        // ask for task ID
        stdout.write('Enter task ID: ');
        String? id = stdin.readLineSync();
        // convert the ID to int 
        if (id == null || id.isEmpty) {
          print('Error: invalid input');
          break;
        }
        int? index = int.tryParse(id);
        if(index == null || index < 1 || index > tasks.length) {
          print('Error: invalid index');
          break;
        }
        // toggle
        tasks[index -1]['complete'] = !tasks[index -1]['complete'];
        break;
      case '5':
        // print("Clear All Tasks");
        // check the list
        if (tasks.isEmpty) {
          print('No tasks');
          break;
        }
        // clear the list
        tasks.clear();
        stdout.write("All tasks cleared");
        break;
      case '6':
        print("Exiting program...");
        break;
      default:
        print("Please select 1-6");
    }
  } while (choice !='6');
}

void showMenu() {
  print("\n========== TODO app ==========");
  print("1. View Tasks");
  print("2. Add Task");
  print("3. Delete Task");
  print("4. Toggle Task Status");
  print("5. Clear All Tasks");
  print("6. Exit");
  print("=============================");
}
