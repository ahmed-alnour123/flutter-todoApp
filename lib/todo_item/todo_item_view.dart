import 'package:flutter/material.dart';
import 'package:todo_app/todo_bloc/todo_bloc.dart';
import 'package:todo_app/todo_bloc/todo_events.dart';
import 'package:todo_app/todo_item/todo_item.dart';

class TodoItemView extends StatelessWidget {
  TodoItemView({Key? key, required this.item, required this.bloc})
      : super(key: key);

  final TodoItem item;
  final _titleController = TextEditingController();
  final _notesController = TextEditingController();
  final TodoBloc bloc;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    _titleController.text = item.title;
    _notesController.text = item.notes;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey[100], // todo: replace with theme color
      floatingActionButton: _buildFAB(context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   item.title,
              //   style: textTheme.headline2,
              // ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[300], // todo: replace with theme color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(border: InputBorder.none),
                  style: textTheme.headline2,
                ),
              ),
              SizedBox(height: 8),
              // Text(
              //   item.description,
              //   style: textTheme.bodyText2,
              // ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // todo: replace with theme color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _notesController,
                    minLines: 5,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Notes',
                      border: InputBorder.none,
                    ),
                    style: textTheme.bodyText2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAB(context) {
    return FloatingActionButton(
      child: Icon(Icons.save),
      onPressed: () {
        var title = _titleController.text;
        var notes = _notesController.text;
        bloc.add(
          TodoEditEvent(
            item,
            TodoItem(
              title: title.isNotEmpty ? title : item.title,
              notes: notes.isNotEmpty ? notes : item.notes,
            ),
          ),
        );
        Navigator.pop(context);
      },
    );
  }
}
