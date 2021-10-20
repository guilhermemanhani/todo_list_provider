import 'package:flutter/material.dart';
import 'package:flutter_todolist_provider/app/core/ui/theme_extensions.dart';
import 'package:flutter_todolist_provider/app/models/task_filter_enum.dart';
import 'package:flutter_todolist_provider/app/models/total_tasks_model.dart';
import 'package:flutter_todolist_provider/app/modules/home/home_controller.dart';
import 'package:flutter_todolist_provider/app/modules/home/widgets/todo_card_filter.dart';
import 'package:provider/provider.dart';

class HomeFilters extends StatelessWidget {
  const HomeFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'FILTROS',
            style: context.titleStyle,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                TodoCardFilter(
                  label: 'HOJE',
                  taskFilter: TaskFilterEnum.today,
                  totalTasksModel:
                      context.select<HomeController, TotalTasksModel?>(
                          (controller) => controller.todayTotalTasks),
                  selected: context.select<HomeController, TaskFilterEnum>(
                          (value) => value.filterSelected) ==
                      TaskFilterEnum.today,
                ),
                TodoCardFilter(
                  label: 'AMANHÃ',
                  taskFilter: TaskFilterEnum.tomorrow,
                  totalTasksModel:
                      context.select<HomeController, TotalTasksModel?>(
                          (controller) => controller.tomorrowTotalTasks),
                  selected: context.select<HomeController, TaskFilterEnum>(
                          (value) => value.filterSelected) ==
                      TaskFilterEnum.tomorrow,
                ),
                TodoCardFilter(
                  label: 'SEMANA',
                  taskFilter: TaskFilterEnum.week,
                  totalTasksModel:
                      context.select<HomeController, TotalTasksModel?>(
                          (controller) => controller.weekTotalTasks),
                  selected: context.select<HomeController, TaskFilterEnum>(
                          (value) => value.filterSelected) ==
                      TaskFilterEnum.week,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
