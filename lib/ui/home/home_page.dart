import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_app/device/localization/generated/l10n.dart';
import 'package:test_app/domain/models/bpi.dart';
import 'package:test_app/domain/models/range.dart';
import 'package:test_app/ui/home/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<HomeCubit, Bpi?>(
          builder: (context, state) {
            return Text(
              state != null ? 'BPI ${state.formattedRate}' : '',
            );
          },
        ),
      ),
      body: Center(
        child: FutureBuilder<Range?>(
          future: context.read<HomeCubit>().getRange(),
          builder: (context, snapshot) {
            return BpiInputForm(initRange: snapshot.data);
          }
        ),
      ),
    );
  }
}

class BpiInputForm extends StatefulWidget {
  final Range? initRange;

  const BpiInputForm({
    super.key,
    required this.initRange,
  });

  @override
  _BpiInputFormState createState() => _BpiInputFormState();
}

class _BpiInputFormState extends State<BpiInputForm> {
  final _formKey = GlobalKey<FormState>();
  final _minKey = GlobalKey<FormFieldState>();
  final _maxKey = GlobalKey<FormFieldState>();

  S get _localization => S.of(context);
  HomeCubit get _homeCubit => context.read<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          CustomTextFormField(
            key: _minKey,
            hintText: widget.initRange != null ? '${_localization.minValue}: ${widget.initRange?.min}' : _localization.minValue,
            validator: (value) {
              if (_toDouble(value) > _toDouble(_maxKey.currentState?.value)) {
                return _localization.minValueIsGreaterThenMax;
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          CustomTextFormField(
            key: _maxKey,
            hintText: widget.initRange != null ? '${_localization.maxValue}: ${widget.initRange?.max}' : _localization.maxValue,
            validator: (value) {
              if (_toDouble(value) < _toDouble(_minKey.currentState?.value)) {
                return _localization.maxValueIsLessThenMin;
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            child: Text(_localization.saveRange),
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _homeCubit.saveRange(
                  Range(
                    _toDouble(_minKey.currentState?.value),
                    _toDouble(_maxKey.currentState?.value),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _localization.rangeSaved,
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }

  double _toDouble(String? value) {
    return double.tryParse(value ?? '0') ?? 0.0;
  }
}

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    super.key,
    required String hintText,
    required FormFieldValidator<String> validator,
  }) : super(
          textAlign: TextAlign.center,
          decoration: InputDecoration(hintText: hintText),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return S.current.cannotBeEmpty;
            }
            return validator(value);
          },
        );
}
