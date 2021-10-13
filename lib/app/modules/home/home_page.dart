import 'package:flutter/material.dart';
import 'package:flutter_todolist_provider/app/core/auth/auth_provider.dart';
import 'package:flutter_todolist_provider/app/core/ui/theme_extensions.dart';
import 'package:flutter_todolist_provider/app/core/ui/todo_list_icons_icons.dart';
import 'package:flutter_todolist_provider/app/modules/home/widgets/home_drawer.dart';
import 'package:flutter_todolist_provider/app/modules/home/widgets/home_filters.dart';
import 'package:flutter_todolist_provider/app/modules/home/widgets/home_header.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: Colors.transparent,
        // title: const Text('Home'),
        elevation: 0,
        actions: [
          PopupMenuButton(
            icon: Icon(TodoListIcons.filter),
            itemBuilder: (_) => [
              PopupMenuItem<bool>(
                child: Text('Mostrar tarefas concluidas'),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color(0xFFFAFBFE),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(),
                    HomeFilters(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
