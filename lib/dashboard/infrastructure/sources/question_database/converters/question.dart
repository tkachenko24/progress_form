import 'package:progress_form/dashboard/domain/entities/export.dart';
import 'package:progress_form/dashboard/infrastructure/sources/question_database/export.dart';

class QuestionConverter {
  QuestionModel toModel(Question input) {
    return QuestionModel(
      id: input.id,
      title: input.title,
      answer: input.answer,
      answered: input.answered,
    );
  }

  QuestionModel fromMap(Map map) {
    return QuestionModel(
      id: map['id'],
      title: map['title'],
      answer: map['answer'],
      answered: map['answered'],
    );
  }

  Map<dynamic, dynamic> toMap(QuestionModel model) {
    return {
      'id': model.id,
      'title': model.title,
      'answer': model.answer,
      'answered': model.answered,
    };
  }

  Question toEntity(QuestionModel output) {
    return Question(
      id: output.id,
      title: output.title,
      answer: output.answer,
      answered: output.answered,
    );
  }
}
