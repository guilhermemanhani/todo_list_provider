import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todolist_provider/app/core/ui/theme_extensions.dart';
import 'package:flutter_todolist_provider/app/models/task_filter_enum.dart';
import 'package:flutter_todolist_provider/app/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomeWeekFilter extends StatelessWidget {
  const HomeWeekFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.select<HomeController, bool>(
          (value) => value.filterSelected == TaskFilterEnum.week),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'DIA DA SEMANA',
              style: context.titleStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 95,
            child: Selector<HomeController, DateTime>(
              selector: (context, controller) =>
                  controller.initialDateOfWeek ?? DateTime.now(),
              builder: (_, value, __) {
                return DatePicker(
                  value,
                  locale: 'pt_BR',
                  selectionColor: context.primaryColor,
                  selectedTextColor: Colors.white,
                  initialSelectedDate: value,
                  daysCount: 7,
                  monthTextStyle: const TextStyle(fontSize: 8),
                  dayTextStyle: const TextStyle(fontSize: 13),
                  dateTextStyle: const TextStyle(fontSize: 13),
                  onDateChange: (date) {
                    context.read<HomeController>().filterByDay(date);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
