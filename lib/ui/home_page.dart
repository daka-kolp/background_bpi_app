import 'package:flutter/material.dart';
import 'package:test_app/localization/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VALUE')),
      body: const Center(
        child: BpiInputForm(),
      ),
    );
  }
}

class BpiInputForm extends StatefulWidget {
  const BpiInputForm({Key? key}) : super(key: key);

  @override
  _BpiInputFormState createState() => _BpiInputFormState();
}

class _BpiInputFormState extends State<BpiInputForm> {
  final formKey = GlobalKey<FormState>();
  final minKey = GlobalKey<FormFieldState>();
  final maxKey = GlobalKey<FormFieldState>();

  S get localization => S.of(context);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          CustomTextFormField(
            key: minKey,
            initialValue: '0',
            hintText: localization.minValue,
            validator: (value) {
              if(_toDouble(value) > _toDouble(maxKey.currentState?.value)) {
                return localization.minValueIsGreaterThenMax;
              }
            },
          ),
          const SizedBox(height: 16.0),
          CustomTextFormField(
            key: maxKey,
            initialValue: '1000',
            hintText: localization.maxValue,
            validator: (value) {
              if(_toDouble(value) < _toDouble(minKey.currentState?.value)) {
                return localization.maxValueIsLessThenMin;
              }
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            child: Text(localization.saveRange),
            onPressed: () {
              formKey.currentState?.validate();
            },
          )
        ],
      ),
    );
  }

  double _toDouble(String? value){
    return double.tryParse(value ?? '0') ?? 0.0;
  }
}

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    Key? key,
    required String initialValue,
    required String hintText,
    required FormFieldValidator<String> validator,
  }) : super(
          key: key,
          initialValue: initialValue,
          textAlign: TextAlign.center,
          decoration: InputDecoration(hintText: hintText),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return S.current.cannotBeEmpty;
            }
            return validator(value);
          },
        );
}
