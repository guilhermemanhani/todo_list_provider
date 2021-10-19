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
    return Expanded(
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
          // ListView.builder(itemBuilder: (context, i){
          //   return context
          //       .select<HomeController, List<TaskModel>>(
          //           (controller) => controller.filteredTasks)
          //           Dismissible(
          //     onDismissed: (left) {
          //       context.read<HomeController>().deleteItem()
          //     },
          //   );
          // })
          Column(
            children: context
                .select<HomeController, List<TaskModel>>(
                    (controller) => controller.filteredTasks)
                .map(
                  (t) => Taks(
                    model: t,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
