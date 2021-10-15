class TaskModel {
  final int id;
  final String description;
  final DateTime dateTime;
  final bool finished;
  TaskModel({
    required this.id,
    required this.description,
    required this.dateTime,
    required this.finished,
  });
}
