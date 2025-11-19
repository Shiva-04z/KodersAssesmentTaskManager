import '../entities/task.dart';

abstract class TaskRepositoryInterface {
  Future<List<Task>> getTasks();
  Future<Task> getTask(String id);
  Future<Task> createTask(Task task);
  Future<Task> updateTask(Task task);
  Future<void> deleteTask(String id);
}