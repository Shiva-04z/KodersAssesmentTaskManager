import '../../domain/entities/task.dart';
import '../../domain/repositiories/task_repository_interface.dart';
import '../datasources/task_datasource.dart';
import '../models/task_model.dart';

class TaskRepository implements TaskRepositoryInterface {
  final TaskDataSource dataSource;

  TaskRepository({required this.dataSource});

  @override
  Future<List<Task>> getTasks() async {
    final tasks = await dataSource.getTasks();
    return tasks.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Task> getTask(String id) async {
    final task = await dataSource.getTask(id);
    return task.toEntity();
  }

  @override
  Future<Task> createTask(Task task) async {
    final taskModel = TaskModel.fromEntity(task);
    final createdTask = await dataSource.createTask(taskModel);
    return createdTask.toEntity();
  }

  @override
  Future<Task> updateTask(Task task) async {
    final taskModel = TaskModel.fromEntity(task);
    final updatedTask = await dataSource.updateTask(taskModel);
    return updatedTask.toEntity();
  }

  @override
  Future<void> deleteTask(String id) async {
    await dataSource.deleteTask(id);
  }
}