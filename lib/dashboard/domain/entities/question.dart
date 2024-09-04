import 'package:progress_form/common/export.dart';

class Question extends Entity {
  final int id;
  final String title;
  final String answer;
  final bool answered;

  const Question({
    required this.id,
    required this.title,
    required this.answer,
    required this.answered,
  });

  Question copyWith({
    int? id,
    String? title,
    String? answer,
    bool? answered,
  }) {
    return Question(
        id: id ?? this.id,
        title: title ?? this.title,
        answer: answer ?? this.answer,
        answered: answered ?? this.answered);
  }

  factory Question.empty() {
    return const Question(
      id: 0,
      title: '',
      answer: '',
      answered: false,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        answer,
        answered,
      ];
}
