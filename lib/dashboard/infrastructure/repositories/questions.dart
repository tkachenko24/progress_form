import 'package:progress_form/dashboard/domain/export.dart';
import 'package:progress_form/dashboard/infrastructure/sources/question_database/export.dart';

class QuestionsRepositoryImplementation implements QuestionsRepository {
  final QuestionsDatabase source;
  final QuestionConverter convert;

  QuestionsRepositoryImplementation({
    required this.source,
    required this.convert,
  });

  @override
  TryFuture<QuestionFailure, List<Question>> fetch() async {
    try {
      List<QuestionModel> response = await source.fetch();
      List<Question> unit = response
          .map(
            (model) => convert.toEntity(model),
          )
          .toList();

      return Try.success(unit);
    } catch (err) {
      return Try.failed(QuestionFailure(err));
    }
  }

  @override
  TryFuture<QuestionFailure, Unit> clean() async {
    try {
      await source.cleanAnswers();
      return Try.success(unit);
    } catch (err) {
      return Try.failed(QuestionFailure(err));
    }
  }

  @override
  TryFuture<QuestionFailure, Unit> answer({required Question newAnswer}) async {
    try {
      await source.add(convert.toModel(newAnswer));

      return Try.success(unit);
    } catch (err) {
      return Try.failed(QuestionFailure(err));
    }
  }
}
