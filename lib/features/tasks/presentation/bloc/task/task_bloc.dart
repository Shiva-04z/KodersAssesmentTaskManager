import 'package:bloc/bloc.dart';

import '../../../domain/entities/task.dart';
import '../../../domain/repositiories/task_repository_interface.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepositoryInterface taskRepository;

  TaskBloc({required this.taskRepository}) : super(const TaskState()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final tasks = await taskRepository.getTasks();
      emit(state.copyWith(tasks: tasks, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final newTask = Task(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: event.title,
        description: event.description,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await taskRepository.createTask(newTask);
      final tasks = await taskRepository.getTasks();
      emit(state.copyWith(tasks: tasks, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      await taskRepository.updateTask(event.task);
      final tasks = await taskRepository.getTasks();
      emit(state.copyWith(tasks: tasks, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      await taskRepository.deleteTask(event.taskId);
      final tasks = await taskRepository.getTasks();
      emit(state.copyWith(tasks: tasks, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}