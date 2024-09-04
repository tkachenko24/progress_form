part of 'bloc.dart';

class QuestionsState extends Equatable {
  final Status<QuestionFailure, List<Question>> status;
  final List<Question> questions;
  final Question activeQuestion;
  final bool allAnswered;
  final bool isAnswerValid;

  const QuestionsState({
    required this.status,
    required this.questions,
    required this.activeQuestion,
    required this.allAnswered,
    required this.isAnswerValid,
  });

  factory QuestionsState.empty() => QuestionsState(
        status: Status.empty(),
        questions: const [],
        activeQuestion: Question.empty(),
        allAnswered: false,
        isAnswerValid: true,
      );

  QuestionsState copyWith({
    Status<QuestionFailure, List<Question>>? status,
    List<Question>? questions,
    Question? activeQuestion,
    bool? allAnswered,
    bool? isAnswerValid,
  }) {
    return QuestionsState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
      activeQuestion: activeQuestion ?? this.activeQuestion,
      allAnswered: allAnswered ?? this.allAnswered,
      isAnswerValid: isAnswerValid ?? this.isAnswerValid,
    );
  }

  @override
  List<Object?> get props => [
        status,
        questions,
        activeQuestion,
        allAnswered,
        isAnswerValid,
      ];
}
