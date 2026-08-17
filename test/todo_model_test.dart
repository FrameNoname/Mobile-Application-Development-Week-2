import 'package:todo/todo_model.dart';
import 'package:test/test.dart';

void main() {
  test('1. Create task should have a task title', () {
    Task task = Task('Cook');
    expect(task.title,  'Cook');
  });
  test('2.Create task should have a false task status', () {
    Task task = Task('Cook');
    expect(task.complete, isFalse);
  });
  test('3. Toggle tas should chang task status', () {
    Task task = Task('Cook');
    task.toggleTask();
    expect(task.complete, isTrue);
    task.toggleTask();
    expect(task.complete, isFalse);
  });
  test('4. Show task should get formatted task', () {
    Task task = Task('Cook');
    expect(task.showTask(), '[⭕] Cook');
  });
}
