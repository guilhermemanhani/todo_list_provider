import 'package:flutter_todolist_provider/app/core/modules/todo_list_module.dart';
import 'package:flutter_todolist_provider/app/modules/auth/login/login_controller.dart';
import 'package:flutter_todolist_provider/app/modules/auth/login/login_page.dart';
import 'package:flutter_todolist_provider/app/modules/auth/register/register_controller.dart';
import 'package:flutter_todolist_provider/app/modules/auth/register/register_page.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class AuthModule extends TodoListModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (_) => LoginController(),
            ),
            ChangeNotifierProvider(
              create: (_) => RegisterController(),
            ),
          ],
          routers: {
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
          },
        );
}
