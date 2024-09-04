class QuestionModel {
  final int id;
  final String title;
  final String answer;
  final bool answered;

  const QuestionModel({
    required this.id,
    required this.title,
    required this.answer,
    required this.answered,
  });

  QuestionModel copyWith({
    int? id,
    String? title,
    String? answer,
    bool? answered,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      answer: answer ?? this.answer,
      answered: answered ?? this.answered,
    );
  }

  factory QuestionModel.empty() {
    return const QuestionModel(
      id: 0,
      title: '',
      answer: '',
      answered: false,
    );
  }
}
