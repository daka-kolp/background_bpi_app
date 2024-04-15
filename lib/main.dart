import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:test_app/src/infrastructure/di/di.dart';
import 'package:test_app/src/ui/l10n/generated/l10n.dart';
import 'package:test_app/src/ui/pages/main/main_page.dart';
import 'package:test_app/src/ui/utils/background_task_service.dart';

const _appName = 'Coindesk Test';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  await initializeBackgroundTask();

  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      home: const MainPage(),
    );
  }
}
