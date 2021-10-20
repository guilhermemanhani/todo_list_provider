import 'package:flutter/material.dart';
import 'package:flutter_todolist_provider/app/core/ui/theme_extensions.dart';
import 'package:flutter_todolist_provider/app/models/task_filter_enum.dart';
import 'package:flutter_todolist_provider/app/models/task_model.dart';
import 'package:flutter_todolist_provider/app/modules/home/home_controller.dart';
import 'package:flutter_todolist_provider/app/modules/home/widgets/taks.dart';
import 'package:provider/provider.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Selector<HomeController, String>(
                selector: (context, controller) {
                  return controller.filterSelected.description;
                },
                builder: (context, value, child) {
                  return Text(
                    'TASK\'S DE $value',
                    style: context.titleStyle,
                  );
                },
              ),
              Column(
                children: [
                  Selector<HomeController, List<TaskModel>>(
                    selector: (context, controller) {
                      return controller.filteredTasks;
                    },
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: value.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = value[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Dismissible(
                              onDismissed: (val) {
                                context
                                    .read<HomeController>()
                                    .deleteItem(value[index]);
                              },
                              key: Key(item.description),
                              child: Taks(model: value[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
