import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todolist_provider/app/core/notifier/default_listener_notifier.dart';
import 'package:flutter_todolist_provider/app/core/ui/theme_extensions.dart';
import 'package:flutter_todolist_provider/app/core/ui/todo_list_icons_icons.dart';
import 'package:flutter_todolist_provider/app/models/task_filter_enum.dart';
import 'package:flutter_todolist_provider/app/modules/home/home_controller.dart';
import 'package:flutter_todolist_provider/app/modules/home/widgets/home_drawer.dart';
import 'package:flutter_todolist_provider/app/modules/home/widgets/home_filters.dart';
import 'package:flutter_todolist_provider/app/modules/home/widgets/home_header.dart';
import 'package:flutter_todolist_provider/app/modules/home/widgets/home_tasks.dart';
import 'package:flutter_todolist_provider/app/modules/home/widgets/home_week_filter.dart';
import 'package:flutter_todolist_provider/app/modules/tasks/tasks_module.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController;
  const HomePage({Key? key, required HomeController homeController})
      : _homeController = homeController,
        super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    DefaultListenerNotifier(changeNotifier: widget._homeController).listener(
      context: context,
      successCallback: (notifier, listenerInstance) {
        listenerInstance.dispose();
      },
    );
    WidgetsBinding.instance?.addPostFrameCallback(
      (timeStamp) {
        widget._homeController.loadTotalTasks();
        widget._homeController.findTasks(filter: TaskFilterEnum.today);
      },
    );
  }

  Future<void> _goToCreateTask(BuildContext context) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation =
              CurvedAnimation(parent: animation, curve: Curves.easeInQuad);
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return TasksModule().getPage('/task/create', context);
        },
      ),
    );
    widget._homeController.refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: Colors.white,
        // title: const Text('Home'),
        elevation: 0,
        actions: [
          PopupMenuButton(
            icon: const Icon(TodoListIcons.filter),
            itemBuilder: (_) => [
              PopupMenuItem<bool>(
                value: true,
                child: Text(
                    '${widget._homeController.showFinishingTasks ? 'Esconder' : 'Mostrar'} tarefas concluidas'),
              ),
            ],
            onSelected: (value) {
              widget._homeController.showOrHideFinishingTasks();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.primaryColor,
        onPressed: () => _goToCreateTask(context),
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color(0xFFFAFBFE),
      body: Container(
        color: Colors.white,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Container(
                color: Colors.white,
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      HomeHeader(),
                      HomeFilters(),
                      HomeWeekFilter(),
                      SizedBox(
                        height: 16,
                      ),
                      HomeTasks(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
