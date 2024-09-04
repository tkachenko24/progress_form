import 'package:progress_form/common/export.dart';
import 'package:progress_form/dashboard/export.dart';

part 'event.dart';
part 'state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuestionsRepository repo;

  QuestionsBloc({required this.repo}) : super(QuestionsState.empty()) {
    on<FetchQuestions>(_onFetch);
    on<ClearAnswers>(_onClear);
    on<SubmitAnswer>(_onSubmit);
    on<SaveAnswer>(_onSave);
    on<CancelAnswer>(_onCancel);
  }

  void _onFetch(
    FetchQuestions event,
    Emitter<QuestionsState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));
    final Try<QuestionFailure, List<Question>> response = await repo.fetch();

    response.fold(
      (failed) => emit(
        state.copyWith(
          status: Status.failed(failed),
        ),
      ),
      (success) => success.every((question) => question.answered)
          ? emit(
              state.copyWith(
                status: Status.success(success),
                questions: success,
                allAnswered: true,
              ),
            )
          : emit(
              state.copyWith(
                status: Status.success(success),
                questions: success,
                activeQuestion: success
                    .firstWhere((question) => question.answered == false),
                allAnswered: false,
              ),
            ),
    );
  }

  void _onClear(
    ClearAnswers event,
    Emitter<QuestionsState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));
    await repo.clean();
    add(const FetchQuestions());
  }

  void _onSubmit(
    SubmitAnswer event,
    Emitter<QuestionsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: Status.loading(),
      ),
    );
    await repo.answer(
      newAnswer: state.activeQuestion.copyWith(answered: true),
    );
    add(const FetchQuestions());
  }

  void _onSave(
    SaveAnswer event,
    Emitter<QuestionsState> emit,
  ) async {
    await repo.answer(
      newAnswer: state.activeQuestion.copyWith(answer: event.value),
    );
    add(const FetchQuestions());
  }

  void _onCancel(
    CancelAnswer event,
    Emitter<QuestionsState> emit,
  ) async {
    await repo.answer(
        newAnswer: state.questions[event.id].copyWith(answered: false));
    add(const FetchQuestions());
  }
}
