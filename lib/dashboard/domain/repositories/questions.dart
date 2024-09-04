import 'package:progress_form/dashboard/domain/export.dart';

abstract class QuestionsRepository {
  TryFuture<QuestionFailure, List<Question>> fetch();
  TryFuture<QuestionFailure, Unit> clean();
  TryFuture<QuestionFailure, Unit> answer({required Question newAnswer});
}
