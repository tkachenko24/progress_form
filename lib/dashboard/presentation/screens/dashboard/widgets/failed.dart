import 'package:progress_form/common/presentation/export.dart';
import 'package:progress_form/dashboard/presentation/states/answers/bloc.dart';

class Failed extends StatelessWidget {
  const Failed({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(flex: 7),
          ElevatedButton(
            onPressed: () =>
                context.read<QuestionsBloc>().add(const FetchQuestions()),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Try again',
                  style: Fonts.bodyLarge,
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.refresh,
                  size: 20,
                ),
              ],
            ),
          ),
          const Spacer(flex: 7),
        ],
      ),
    );
  }
}
