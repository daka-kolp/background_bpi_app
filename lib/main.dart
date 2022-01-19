import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data/api/coindesk_api.dart';
import 'package:test_app/device/localization/generated/l10n.dart';
import 'package:test_app/device/store_interactor.dart';
import 'package:test_app/domain/api_contracts/bpi_api.dart';
import 'package:test_app/ui/home/home_cubit.dart';
import 'package:test_app/ui/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I
    ..registerSingleton<StoreInteractor>(StoreInteractor())
    ..registerSingleton<BpiApi>(CoindeskApi());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coindesk Test',
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
