import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:workmanager/workmanager.dart';

import 'package:test_app/src/core/bpi/domain/bpi_service.dart';
import 'package:test_app/src/core/bpi/domain/range_service.dart';
import 'package:test_app/src/infrastructure/di/di.dart';
import 'package:test_app/src/ui/utils/local_notification_service.dart';

const _appName = 'Coindesk Test';

final _workmanager = Workmanager();

Future<void> initializeBackgroundTask() async {
  await _workmanager.initialize(_callbackDispatcher, isInDebugMode: kDebugMode);

  if (Platform.isAndroid) {
    await _workmanager.registerPeriodicTask('bpiID', 'bpiID');
  } else if (Platform.isIOS) {
    await _workmanager.registerProcessingTask('bpiID', 'bpiID');
  }
}

@pragma('vm:entry-point')
void _callbackDispatcher() {
  _workmanager.executeTask((task, inputData) async {
    final ns = NotificationService();
    await configureDependencies();
    final bpi = await getIt<BpiService>().getCurrentBpiInUsd();
    final range = await getIt<RangeService>().getRange();

    if (range != null) {
      if (bpi.rate < range.min) {
        ns.showNotification(title: _appName, body: 'BPI < ${range.min}');
      } else if (bpi.rate > range.max) {
        ns.showNotification(title: _appName, body: 'BPI > ${range.max}');
      } else {
        ns.showNotification(title: _appName, body: 'Range is (min: ${range.min}, max: ${range.max}), BPI: ${bpi.rate}');
      }
    } else {
      ns.showNotification(title: _appName, body: 'Range is NULL, BPI: ${bpi.rate}');
    }
    return Future.value(true);
  });
}
