import 'package:flutter/material.dart';
import 'package:flutter_todolist_provider/app/models/task_model.dart';
import 'package:flutter_todolist_provider/app/modules/home/home_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Taks extends StatelessWidget {
  final TaskModel model;
  final dateFormat = DateFormat('dd/MM/y');
  Taks({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicHeight(
        child: ListTile(
          leading: Checkbox(
            value: model.finished,
            onChanged: (value) =>
                context.read<HomeController>().checkOrUncheckTask(model),
          ),
          title: Text(
            model.description,
            style: TextStyle(
              decoration: model.finished ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            dateFormat.format(model.dateTime),
            style: TextStyle(
              decoration: model.finished ? TextDecoration.lineThrough : null,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(width: 1),
          ),
          trailing: IconButton(
            onPressed: () => context.read<HomeController>().deleteItem(model),
            icon: const Icon(Icons.delete_forever_outlined),
          ),
        ),
      ),
    );
  }
}
