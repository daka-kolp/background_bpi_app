import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_app/src/core/bpi/domain/models/range.dart';
import 'package:test_app/src/ui/l10n/generated/l10n.dart';
import 'package:test_app/src/ui/l10n/locale_extension.dart';
import 'package:test_app/src/ui/state_management/range_cubit.dart';

class BpiInputForm extends StatefulWidget {
  final Range? initRange;

  const BpiInputForm({
    super.key,
    required this.initRange,
  });

  @override
  State<BpiInputForm> createState() => _BpiInputFormState();
}

class _BpiInputFormState extends State<BpiInputForm> {
  final _formKey = GlobalKey<FormState>();
  final _minKey = GlobalKey<FormFieldState>();
  final _maxKey = GlobalKey<FormFieldState>();

  RangeCubit get _rangeCubit => context.read<RangeCubit>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _CustomTextFormField(
            key: _minKey,
            hintText: widget.initRange != null
                ? '${context.locale.minValue}: ${widget.initRange?.min}'
                : context.locale.minValue,
            validator: _minValidator,
          ),
          const SizedBox(height: 16.0),
          _CustomTextFormField(
            key: _maxKey,
            hintText: widget.initRange != null
                ? '${context.locale.maxValue}: ${widget.initRange?.max}'
                : context.locale.maxValue,
            validator: _maxValidator,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _saveRange,
            child: Text(context.locale.saveRange),
          )
        ],
      ),
    );
  }

  String? _minValidator(String? value) {
    if (_toDouble(value) > _toDouble(_maxKey.currentState?.value)) {
      return context.locale.minValueIsGreaterThenMax;
    }
    return null;
  }

  String? _maxValidator(String? value) {
    if (_toDouble(value) < _toDouble(_minKey.currentState?.value)) {
      return context.locale.maxValueIsLessThenMin;
    }
    return null;
  }

  void _saveRange() {
    if (_formKey.currentState?.validate() ?? false) {
      final range = Range(_toDouble(_minKey.currentState?.value), _toDouble(_maxKey.currentState?.value));
      _rangeCubit.saveRange(range);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.locale.rangeSaved)));
    }
  }

  double _toDouble(String? value) {
    return double.tryParse(value ?? '0') ?? 0.0;
  }
}

class _CustomTextFormField extends TextFormField {
  _CustomTextFormField({
    super.key,
    required String hintText,
    required FormFieldValidator<String> validator,
  }) : super(
          textAlign: TextAlign.center,
          decoration: InputDecoration(hintText: hintText),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value?.isEmpty ?? true) return S.current.cannotBeEmpty;
            return validator(value);
          },
        );
}
