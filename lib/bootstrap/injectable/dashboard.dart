import 'package:get_it/get_it.dart';
import 'package:progress_form/dashboard/export.dart';
import '../../dashboard/infrastructure/repositories/export.dart';
import 'injectable.dart';

class DashboardInjectable extends Injectable {
  @override
  Future<void> register(GetIt it) async {
    it.registerLazySingleton<QuestionsDatabase>(
      () => QuestionsDatabaseHiveImplementation(
        storage: it.get(),
        convert: QuestionConverter(),
      ),
    );

    it.registerLazySingleton<QuestionsRepository>(
      () => QuestionsRepositoryImplementation(
        source: it.get(),
        convert: QuestionConverter(),
      ),
    );
  }
}
