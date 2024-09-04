import 'package:foundation/domain/export.dart';

class QuestionFailure extends Failure {
  final Object error;
  const QuestionFailure(this.error);
}
