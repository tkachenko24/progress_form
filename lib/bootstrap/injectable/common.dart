import 'dart:io';

import 'package:get_it/get_it.dart';
import 'injectable.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class CommonInjectable extends Injectable {
  @override
  Future<void> register(
    GetIt it,
  ) async {
    it.registerSingletonAsync<Box<dynamic>>(() async {
      Directory dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      return Hive.openBox('D_B');
    });
    await it.allReady();
  }
}
