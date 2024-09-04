import 'package:progress_form/common/presentation/export.dart';
import 'package:progress_form/dashboard/export.dart';

class AllAnswered extends StatelessWidget {
  const AllAnswered({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/giphy.gif', height: 200),
          const SizedBox(height: 20),
          Text(
            'Well Done!',
            style: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'You have answered all the questions.',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () =>
                context.read<QuestionsBloc>().add(const ClearAnswers()),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: theme.primaryColor,
            ),
            child: Text(
              'Answer again',
              style: theme.textTheme.titleMedium!
                  .copyWith(color: theme.scaffoldBackgroundColor),
            ),
          ),
        ],
      ),
    );
  }
}
