import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_app/src/core/bpi/domain/models/bpi.dart';
import 'package:test_app/src/core/bpi/domain/models/range.dart';
import 'package:test_app/src/infrastructure/di/di.dart';
import 'package:test_app/src/ui/l10n/locale_extension.dart';
import 'package:test_app/src/ui/pages/main/widgets/bpi_input_form.dart';
import 'package:test_app/src/ui/state_management/bpi_cubit.dart';
import 'package:test_app/src/ui/state_management/range_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<BpiCubit>()),
        BlocProvider(create: (context) => getIt<RangeCubit>()),
      ],
      child: const _MainContent(),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<BpiCubit, Bpi?>(
            builder: (context, bpi) {
              return Text(bpi != null ? '${context.locale.bpi} ${bpi.formattedRate}' : '');
            },
          ),
        ),
        body: Center(
          child: BlocBuilder<RangeCubit, Range?>(
            builder: (context, range) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: BpiInputForm(initRange: range),
              );
            },
          ),
        ),
      ),
    );
  }
}
