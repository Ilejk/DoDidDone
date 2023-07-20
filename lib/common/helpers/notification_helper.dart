import 'package:flutter/cupertino.dart';
import 'package:todo_app/common/export/export.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationsHelper {
  final WidgetRef ref;

  NotificationsHelper({required this.ref});

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  String? selectedNotificationPayload;

  final BehaviorSubject<String?> selectNotificationSubject =
      BehaviorSubject<String?>();

  Future<void> initializeNotifications() async {
    _configureSelectNotificationSubject();
    await _configureLocalTiemZone();
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("tasklist");
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) async {
        selectNotificationSubject.add(details.payload);
      },
    );
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> _configureLocalTiemZone() async {
    tz.initializeTimeZones();
    const String timeZoneName = 'Poland/Warsaw';
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen(
      (String? payload) async {
        String title = payload!.split('|')[0];
        String body = payload.split('|')[1];
        showNotificationDialog(
          payload,
          ReusableTextWidget(text: title),
          ReusableTextWidget(
            text: body,
            textAlign: TextAlign.justify,
            maxLines: 4,
          ),
        );
      },
    );
  }

  Future onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    showNotificationDialog(
      payload,
      ReusableTextWidget(text: title ?? AppConsts.empty),
      ReusableTextWidget(text: body ?? AppConsts.empty),
    );
  }

  Future<dynamic> showNotificationDialog(
      String? payload, Widget? title, Widget? body) {
    return showDialog(
      context: ref.context,
      builder: (context) => CupertinoAlertDialog(
        title: title,
        content: body,
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => GBM.pop(context: context),
            child: const ReusableTextWidget(
              text: 'Close',
            ),
          ),
        ],
      ),
    );
  }

  Future<void> scheduledNotifications(
    int days,
    int hours,
    int minutes,
    int seconds,
    TaskModel taskModel,
  ) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        taskModel.id ?? 0,
        taskModel.title,
        taskModel.description,
        tz.TZDateTime.now(tz.local).add(
          Duration(
            days: days,
            hours: hours,
            minutes: minutes,
            seconds: seconds,
          ),
        ),
        const NotificationDetails(
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentSound: true,
            presentBadge: true,
            presentBanner: true,
          ),
          android: AndroidNotificationDetails(
            'your channel id',
            'your channel name',
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload:
            "${taskModel.title}|${taskModel.description}|${taskModel.date}|${taskModel.startTime}|${taskModel.endTime}");
  }
}
