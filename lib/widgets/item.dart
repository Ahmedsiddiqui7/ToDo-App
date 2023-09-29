import 'package:flutter/material.dart';
import 'package:to_do_listapp/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading:
            Icon(todo.isDone ? Icons.check_box : Icons.check_box_outline_blank),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,),
        ),
        trailing: ElevatedButton(
          onPressed: () {
            onDeleteItem(todo.id);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade600,
            side: const BorderSide(
              color: Colors.black,
            ),
         shape: const CircleBorder(),
          ),
          child: const Icon(Icons.delete,size: 20,),
        ),
      ),
    );
  }
}
