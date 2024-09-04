import 'package:progress_form/common/presentation/export.dart';
import 'package:progress_form/dashboard/export.dart';

class DashboardScreen extends StatelessWidget {
  final ThemeData theme;

  const DashboardScreen({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<QuestionsBloc, QuestionsState>(
          buildWhen: (previous, current) =>
              previous.questions != current.questions,
          builder: (context, state) {
            return Text(
              state.allAnswered
                  ? 'Congratulations !!!'
                  : 'Please answer the questions',
              style: theme.textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: theme.primaryColor,
      ),
      body: BlocBuilder<QuestionsBloc, QuestionsState>(
        buildWhen: (previous, current) =>
            previous.questions != current.questions,
        builder: (context, state) {
          if (state.status.isLoading() || state.questions.isEmpty) {
            return Loading(theme: theme);
          }

          if (state.status.isFailed()) {
            return Failed(theme: theme);
          }

          if (state.allAnswered) {
            return AllAnswered(theme: theme);
          }

          return QuestionStepper(
            theme: theme,
            state: state,
          );
        },
      ),
    );
  }
}
