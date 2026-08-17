import 'package:test/test.dart';
import 'package:todo/todo_logic.dart';
import 'package:todo/todo_model.dart';

void main() {
  late Todo todo;

  setUp(() {
    todo = Todo();
  });

  group('addTask', () {
    test('Should start with empty todo list', () {
      expect(todo.todos, isEmpty);
    });

    test('Should add a new task with correct title and initial false status', () {
      todo.addTask('Cook');
      expect(todo.todos.length, equals(1));
      expect(todo.todos[0].title, equals('Cook'));
      expect(todo.todos[0].complete, isFalse);
    });

    test('Should add multiple tasks correctly', () {
      todo.addTask('Cook');
      todo.addTask('Play');
      expect(todo.todos.length, equals(2));
    });
  });

  group('deleteTask', () {
    test('Should delete an existing task successfully', () {
      todo.addTask('Cook');
      bool result = todo.deleteTask(1);
      expect(result, isTrue);
      expect(todo.todos, isEmpty);
    });

    test('Should return false if delete task with invalid index', () {
      todo.addTask('Cook');
      expect(todo.deleteTask(0), isFalse);
      expect(todo.deleteTask(2), isFalse);
    });
  });

  group('toggleTask', () {
    test('Should toggle task status successfully', () {
      todo.addTask('Cook');
      bool result = todo.toggleTask(1);
      expect(result, isTrue);
      expect(todo.todos[0].complete, isTrue);
    });

    test('Should return false if toggle task status failed', () {
      todo.addTask('Cook');
      bool result = todo.toggleTask(2);
      expect(result, isFalse);
    });
  });

  group('clearAll', () {
    test('Should clear all tasks successfully', () {
      todo.addTask('Cook');
      todo.addTask('Play');
      todo.clearAll();
      expect(todo.todos, isEmpty);
    });
  });

  group('editTask', () {
    test('Should edit task title successfully with valid index', () {
      todo.addTask('Cook');
      bool result = todo.editTask(1, 'Cook Dinner');
      expect(result, isTrue);
      expect(todo.todos[0].title, equals('Cook Dinner'));
    });

    test('Should return false if edit task with invalid index or empty title', () {
      todo.addTask('Cook');
      expect(todo.editTask(0, 'Cook Dinner'), isFalse);
      expect(todo.editTask(2, 'Cook Dinner'), isFalse);
      expect(todo.editTask(1, '  '), isFalse);
      expect(todo.todos[0].title, equals('Cook'));
    });
  });

  group('searchTasks', () {
    test('Should return matching tasks by title substring', () {
      todo.addTask('Buy milk');
      todo.addTask('Buy coffee');
      todo.addTask('Cook dinner');

      List<Task> results = todo.searchTasks('Buy');
      expect(results.length, equals(2));
      expect(results[0].title, equals('Buy milk'));
      expect(results[1].title, equals('Buy coffee'));
    });

    test('Should search case-insensitively', () {
      todo.addTask('Buy milk');
      List<Task> results = todo.searchTasks('MILK');
      expect(results.length, equals(1));
      expect(results[0].title, equals('Buy milk'));
    });

    test('Should return empty list when no tasks match query', () {
      todo.addTask('Buy milk');
      List<Task> results = todo.searchTasks('Sleep');
      expect(results, isEmpty);
    });
  });
}