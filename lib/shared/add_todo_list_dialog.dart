import 'package:flutter/material.dart';
import 'package:todo_app/todo_item/todo_item.dart';
import 'package:todo_app/todo_list/todo_list.dart';

class AddTodoListDialog extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _notesController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              focusNode: focusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'New Task',
                labelText: 'Task Title',
              ),
            ),
            // SizedBox(height: 8),
            // TextField(
            //   controller: _notesController,
            //   minLines: 2,
            //   maxLines: 5,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: 'Add Notes',
            //     labelText: 'Notes',
            //   ),
            // ),
            ButtonBar(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop<TodoList>(
                        context,
                        TodoList(
                          name: _nameController.text,
                          // notes: _notesController.text,
                        ),
                      );
                    },
                    child: Text('Add')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
