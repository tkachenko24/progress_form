import 'package:progress_form/common/presentation/export.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: theme.primaryColor,
      ),
    );
  }
}
