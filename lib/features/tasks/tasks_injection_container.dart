import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:taskmanager/features/tasks/presentation/bloc/task/task_bloc.dart';
import 'data/datasources/hive_task_datasource.dart';
import 'data/datasources/task_datasource.dart';
import 'data/models/task_model.dart';
import 'data/repositiories/task_repositiory.dart';
import 'domain/repositiories/task_repository_interface.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskModelAdapter());
  final hiveDataSource = HiveTaskDataSource();
  await hiveDataSource.init();
  sl.registerLazySingleton<TaskDataSource>(() => hiveDataSource);
  sl.registerLazySingleton<TaskRepositoryInterface>(
        () => TaskRepository(dataSource: sl()),
  );

  sl.registerFactory(() => TaskBloc(taskRepository: sl()));
}