import 'package:progress_form/dashboard/infrastructure/sources/question_database/export.dart';

abstract class QuestionsDatabase {
  Future<List<QuestionModel>> fetch();
  Future<void> add(QuestionModel newQuestion);
  Future<void> cleanAnswers();
}
