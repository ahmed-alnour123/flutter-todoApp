import 'dart:math';

import 'package:faker/faker.dart';
// todo: make sure there is no repition in [id]

class TodoItem {
  final int id;
  String title;
  String notes;
  bool isDone;
  int orderIndex;
  // TODO: add: date, orderIndex, alarm, deadLine

  TodoItem({
    this.title = 'No Title',
    this.notes = '',
    this.isDone = false,
    this.orderIndex = -1,
  }) : id = Random().nextInt(10000);

  void edit(TodoItem newItem) {
    title = newItem.title;
    notes = newItem.notes;
  }

  // TODO: remove
  TodoItem copy() => TodoItem(
        title: title,
        notes: notes,
        isDone: isDone,
      );

  @override
  String toString() {
    return '{id=$id, title=$title, description=$notes, isDone=$isDone}';
  }

  static TodoItem random() => TodoItem(
        title: faker.lorem.sentence(),
        notes: faker.lorem.sentence(),
        isDone: Random().nextBool(),
        orderIndex: 0,
      );
}
