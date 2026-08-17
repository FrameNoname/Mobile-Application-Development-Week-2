# Mobile Application Development

## Week 1 - Introduction to Dart

### 1. Start a Dart Project

📄 Terminal

1. Create Dart Project
```bash
dart create hello_dart
cd hello_dart
dart run
```

Output

```text
Hello world!
```

2. Clone the Dart Project
```bash
git clone https://github.com/Meawdam/Mobile-Application-Development-Week-1
cd Mobile-Application-Development-Week-1
dart pub get
dart run
```

---

### 2. Compile a Dart Program

📄 Terminal

```bash
dart compile exe main.dart
```

Creates

```text
main.exe
```

Run it

```bash
./main
```

or

```bash
.\main
```

You can also compile to a kernel file.

```bash
dart compile kernel main.dart
dart run main.dill
```

---

### 3. Project Structure

```text
hello_dart/
├── bin/
│   └── hello_dart.dart
├── lib/
├── test/
├── pubspec.yaml
└── README.md
```

---

### 4. Hello World

📄 `bin/hello_dart.dart`

```dart
void main() {
  print("Hello World");
}
```

---

### 5. Variables

- int
- double
- String
- bool
- var

📄 `bin/hello_dart.dart`

```dart
void main() {
  int age = 20;
  double pi = 3.14;
  String name = "John";
  bool student = true;

  var score = 90;

  print("My name is $name");
}
```

---

### 6. User Input

📄 `bin/hello_dart.dart`

```dart
import 'dart:io';

void main() {
  stdout.write("Name: ");
  String? name = stdin.readLineSync();

  print("Hello $name");
}
```

---

### 7. Operators

Arithmetic

```dart
print(1 + 2);
print(1 - 2);
print(1 * 2);
print(1 / 2);
print(1 ~/ 2);
print(1 % 2);
```

Comparison

```dart
==
!=
<
>
<=
>=
```

Logical

```dart
&&
||
!
```

---

### 8. Null Safety

```dart
String? name;

print(name ?? "Unknown");

name ??= "John";
```

---

### 9. Loops

For

```dart
for (int i = 1; i <= 5; i++) {
  print(i);
}
```

While

```dart
while (...) {}
```

Do While

```dart
do {

} while (...);
```

---

### 10. Collections

#### List

```dart
List<int> numbers = [1, 2, 3];
```

#### Set

```dart
Set<String> names = {"Tom", "Sara"};
```

#### Map

```dart
Map<String, int> student = {
  "Tom": 20
};
```

#### List of Map

```dart
var products = [
  {"name": "Book", "price": 80},
  {"name": "Pen", "price": 55},
];
```

---

### 11. Functions

```dart
int add(int a, int b) {
  return a + b;
}
```

Named parameter

```dart
double multiply({
  required double first,
  required double second,
}) {
  return first * second;
}
```

Arrow function

```dart
double divide(int a, int b) => a / b;
```

Optional parameter

```dart
double minus(double a, [double b = 0]) {
  return a - b;
}
```

---

### 12. Classes

```dart
class Point {
  double x;
  double y;

  Point(this.x, this.y);
}
```

Object

```dart
void main() {
  var point = Point(2, 5);

  print(point.x);
}
```

---

### 13. Getter & Setter

```dart
class Student {
  String _name;

  Student(this._name);

  String get name => _name;

  set name(String value) => _name = value;
}
```

---

## Exercises

- Exercise 1 — Hello World
- Exercise 2 — Variables
- Exercise 3 — Console Input
- Exercise 4 — Operators
- Exercise 5 — Null Checking
- Exercise 6 — Loops
- Exercise 7 — List
- Exercise 8 — List Iteration
- Exercise 9 — Set
- Exercise 10 — Map
- Exercise 11 — List of Map
- Exercise 12 — Functions
- Exercise 13 — Optional Parameters
- Exercise 14 — Classes

---

## Assignments

1. Sum all digits in your student ID.
2. Read a user's name and age from the console and validate the input.
3. Build a simple login system using a list of user accounts.
