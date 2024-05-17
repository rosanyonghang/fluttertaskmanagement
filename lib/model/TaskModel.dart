// Creating task model since, we need multiple values for the same task
class TaskModel {
  num id;
  String title;
  String description;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
  });
}