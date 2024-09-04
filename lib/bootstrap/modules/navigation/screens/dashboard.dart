// ignore_for_file: implicit_call_tearoffs

import 'package:go_router/go_router.dart';
import 'package:progress_form/bootstrap/injectable/export.dart';
import 'package:progress_form/common/export.dart';
import 'package:progress_form/dashboard/export.dart';

import '../guards/export.dart';
import 'screens.dart';

class DashboardScreens extends Screens {
  static Screen dashboard = Screen(path: '/dashboard');

  @override
  List<RouteBase> routes = [
    GoRoute(
      path: dashboard.path,
      name: dashboard.name,
      redirect: ScreenGuards([BootstrapGuard()]),
      builder: (
        BuildContext context,
        GoRouterState state,
      ) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => QuestionsBloc(repo: locator.get())
                ..add(const FetchQuestions()),
            ),
          ],
          child: DashboardScreen(
            theme: Theme.of(context),
          ),
        );
      },
    ),
  ];
}
