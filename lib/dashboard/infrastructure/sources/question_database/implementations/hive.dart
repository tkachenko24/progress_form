import 'package:hive/hive.dart';
import 'package:progress_form/dashboard/infrastructure/sources/question_database/export.dart';

class QuestionsDatabaseHiveImplementation extends QuestionsDatabase {
  final Box<dynamic> storage;
  final QuestionConverter convert;

  QuestionsDatabaseHiveImplementation({
    required this.storage,
    required this.convert,
  });

  static const String key = 'questions';

  @override
  Future<void> add(QuestionModel newQuestion) async {
    try {
      List<QuestionModel> storageData = await fetch();
      int indexOfAnswer = storageData
          .indexWhere((oldQuestion) => oldQuestion.id == newQuestion.id);

      if (indexOfAnswer != -1) {
        storageData[indexOfAnswer] = newQuestion;
      } else {
        storageData.add(newQuestion);
      }

      await storage.put(key, storageData.map(convert.toMap).toList());
    } catch (error) {
      throw StorageException(error);
    }
  }

  @override
  Future<void> cleanAnswers() async {
    try {
      List<QuestionModel> storageData = await fetch();
      List<QuestionModel> updatedModels = storageData
          .map((model) => model.copyWith(
                answer: '',
                answered: false,
              ))
          .toList();

      await storage.put(key, updatedModels.map(convert.toMap).toList());
    } catch (error) {
      throw StorageException(error);
    }
  }

  @override
  Future<List<QuestionModel>> fetch() async {
    try {
      List<dynamic> responseFromStorage = await storage.get(
        key,
        defaultValue: [
          {
            'id': 1,
            'title': 'What is your favorite color?',
            'answer': '',
            'answered': false,
          },
          {
            'id': 2,
            'title': 'What is your hometown?',
            'answer': '',
            'answered': false,
          },
          {
            'id': 3,
            'title': 'What is your favorite food?',
            'answer': '',
            'answered': false,
          },
          {
            'id': 4,
            'title': 'What is your favorite hobby?',
            'answer': '',
            'answered': false,
          },
          {
            'id': 5,
            'title': 'What is your dream job?',
            'answer': '',
            'answered': false,
          },
        ],
      );
      return responseFromStorage
          .map((map) => convert.fromMap(Map<String, dynamic>.from(map)))
          .toList();
    } catch (error) {
      throw StorageException(error);
    }
  }
}
