import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

import 'package:test_app/data/api/coindesk_api.dart';
import 'package:test_app/device/localization/generated/l10n.dart';
import 'package:test_app/device/store_interactor.dart';
import 'package:test_app/domain/api_contracts/bpi_api.dart';
import 'package:test_app/ui/home/home_cubit.dart';
import 'package:test_app/ui/home/home_page.dart';

const _appName = 'Coindesk Test';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I
    ..registerSingleton<StoreInteractor>(StoreInteractor())
    ..registerSingleton<BpiApi>(CoindeskApi());

  final wm = Workmanager();
  await wm.initialize(callbackDispatcher, isInDebugMode: true);
  await wm.registerPeriodicTask(
    'bpiID',
    'bpiTask',
    frequency: const Duration(minutes: 1), // Android will automatically change it to 15 min
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomePage(),
      ),
    );
  }
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final flnp = FlutterLocalNotificationsPlugin();

    flnp.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );

    const notificationDetails =  NotificationDetails(
      android: AndroidNotificationDetails(
        'channel bpi',
        'channel BPI',
        priority: Priority.high,
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );

    final _storeInteractor = StoreInteractor();
    final _api = CoindeskApi();

    final bpi = await _api.getCurrentBpiInUsd();
    final range = await _storeInteractor.getRange();

    if (range != null) {
      if (bpi.rate < range.min) {
        flnp.show(0, _appName, 'BPI < ${range.min}', notificationDetails);
      } else if (bpi.rate > range.max) {
        flnp.show(0, _appName, 'BPI > ${range.max}', notificationDetails);
      }
    }
    return Future.value(true);
  });
}