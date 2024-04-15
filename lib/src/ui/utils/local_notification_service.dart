import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flnp;
  final NotificationDetails _details;

  NotificationService()
      : _flnp = FlutterLocalNotificationsPlugin(),
        _details = const NotificationDetails(
          android: AndroidNotificationDetails(
            'channel bpi',
            'channel BPI',
            priority: Priority.high,
            importance: Importance.max,
          ),
          iOS: DarwinNotificationDetails(),
        ) {
    _init();
  }

  void _init() {
    _flnp.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );
  }

  Future<void> showNotification({required String title, required String body}) async {
    await _flnp.show(0, title, body, _details);
  }
}

