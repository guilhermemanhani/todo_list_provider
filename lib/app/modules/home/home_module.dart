import 'package:flutter_todolist_provider/app/core/modules/todo_list_module.dart';
import 'package:flutter_todolist_provider/app/modules/home/home_page.dart';
import 'package:path/path.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(bindings: [], routers: {
          '/home': (context) => HomePage(),
        });
}
