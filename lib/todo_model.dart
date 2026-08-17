// keep test
class Task {
  String title = '';
  bool complete = false;

  //constructor
  // Task(String title) {
  //   this.title = title;
  // }
  // เหมือนกัน
  Task(this.title);

  // toggle
  void toggleTask() {
    complete = !complete;
  }

  String showTask() {
    String status = !complete ? '[⭕]' : '[✅]';
    return "$status $title";
  }
}
