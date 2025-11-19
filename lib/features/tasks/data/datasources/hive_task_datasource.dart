import 'package:hive/hive.dart';
import '../models/task_model.dart';
import 'task_datasource.dart';

class HiveTaskDataSource implements TaskDataSource {
  static const String _boxName = 'tasks';
  late Box<TaskModel> _box;

  Future<void> init() async {
    _box = await Hive.openBox<TaskModel>(_boxName);
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    await Future.delayed(const Duration(milliseconds: 300)); // Simulate delay
    return _box.values.toList();
  }

  @override
  Future<TaskModel> getTask(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final task = _box.values.firstWhere((task) => task.id == id);
    return task;
  }

  @override
  Future<TaskModel> createTask(TaskModel task) async {
    await Future.delayed(const Duration(milliseconds: 400));
    await _box.put(task.id, task);
    return task;
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) async {
    await Future.delayed(const Duration(milliseconds: 400));
    await _box.put(task.id, task);
    return task;
  }

  @override
  Future<void> deleteTask(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    await _box.delete(id);
  }
}