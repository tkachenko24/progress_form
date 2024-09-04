import 'package:progress_form/common/presentation/export.dart';
import 'package:progress_form/dashboard/export.dart';

class QuestionStepper extends StatelessWidget {
  const QuestionStepper({
    super.key,
    required this.theme,
    required this.state,
  });
  final QuestionsState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.vertical,
      currentStep: state.questions.indexOf(state.activeQuestion),
      onStepContinue: () {
        state.activeQuestion.answer.trim().isNotEmpty
            ? {
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                context.read<QuestionsBloc>().add(const SubmitAnswer())
              }
            : {
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: theme.primaryColorLight,
                    duration: const Duration(seconds: 30),
                    content: Text(
                      'Enter answer',
                      style: Fonts.titleMedium.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                )
              };
      },
      onStepCancel: () {
        context
            .read<QuestionsBloc>()
            .add(CancelAnswer(state.activeQuestion.id - 2));
      },
      steps: state.questions.map((question) {
        return Step(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.title,
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: question.answered
                        ? Colors.green
                        : question.id == state.activeQuestion.id
                            ? theme.primaryColor
                            : theme.disabledColor,
                  ),
                ),
                if (question.answered)
                  Text(
                    question.answer,
                    style: theme.textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  )
              ],
            ),
          ),
          content: Column(
            children: [
              TextFormField(
                initialValue: question.answer,
                onChanged: (value) {
                  context.read<QuestionsBloc>().add(SaveAnswer(value: value));
                },
                decoration: const InputDecoration(
                  labelText: 'Your answer',
                ),
              ),
              const SizedBox(height: 20),
              if (question.answered)
                Text(
                  'Answer: ${question.answer}',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
            ],
          ),
          isActive: question == state.activeQuestion,
          state: question.answered ? StepState.complete : StepState.indexed,
        );
      }).toList(),
    );
  }
}
