part of 'bloc.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object?> get props => [];
}

class FetchQuestions extends QuestionsEvent {
  const FetchQuestions();

  @override
  List<Object?> get props => [];
}

class SaveAnswer extends QuestionsEvent {
  final String value;
  const SaveAnswer({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}

class SubmitAnswer extends QuestionsEvent {
  const SubmitAnswer();

  @override
  List<Object?> get props => [];
}

class ClearAnswers extends QuestionsEvent {
  const ClearAnswers();

  @override
  List<Object?> get props => [];
}

class CancelAnswer extends QuestionsEvent {
  final int id;
  const CancelAnswer(this.id);

  @override
  List<Object?> get props => [id];
}
