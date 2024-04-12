import 'package:flutter/widgets.dart';

import 'package:test_app/src/ui/l10n/generated/l10n.dart';

extension LocaleExtension on BuildContext {
  S get locale => S.of(this);
}
