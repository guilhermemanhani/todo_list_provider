import 'package:flutter_todolist_provider/app/core/modules/todo_list_module.dart';
import 'package:flutter_todolist_provider/app/modules/tasks/task_create_controller.dart';
import 'package:flutter_todolist_provider/app/modules/tasks/task_create_page.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class TasksModule extends TodoListModule {
  TasksModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => TaskCreateController(),
            )
          ],
          routers: {
            '/task/create': (context) => TaskCreatePage(
                  controller: context.read(),
                ),
          },
        );
}
