import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var flp = FlutterLocalNotificationsPlugin();

  Future<void> setup() async {

    var androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosSettings = IOSInitializationSettings();

    var setupSettings = InitializationSettings(android: androidSettings,iOS: iosSettings);

    await flp.initialize(
        setupSettings,
        onSelectNotification: notificationSelect);
  }


  Future<void> notificationSelect(String? payLoad) async {

    if(payLoad!=null){
      print('Notification selected : ${payLoad}');
    }
  }

  Future<void> notificationShow() async {
    
    var androidNotificationDetails = AndroidNotificationDetails('channelId','channelName',
        priority: Priority.high,
        importance: Importance.max,
        channelDescription:'channelDescription',
    );

    var iosNotificationDetails = IOSNotificationDetails();
    var notificationDetail = NotificationDetails(android: androidNotificationDetails,iOS: iosNotificationDetails);

    await flp.show(0,'title','context', notificationDetail,payload:'payLoad context');
    
  }

  Future<void> notificationShowWithDelay() async {
    var androidNotificationDetails = AndroidNotificationDetails('channelId','channelName',
      priority: Priority.high,
      importance: Importance.max,
      channelDescription:'channelDescription',
    );

    var iosNotificationDetails = IOSNotificationDetails();
    var notificationDetail = NotificationDetails(android: androidNotificationDetails,iOS: iosNotificationDetails);

    tz.initializeTimeZones();
    var delay = tz.TZDateTime.now(tz.local).add(Duration(seconds: 10));

    await flp.zonedSchedule(0, 'title','context', delay, notificationDetail,
        payload: 'payload context',
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }




  @override
  void initState() {
    super.initState();
    setup();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
                onPressed: (){
                  notificationShow();
                },
                child: Text('Create a notification'),
            ),

            ElevatedButton(
              onPressed: (){
                notificationShowWithDelay();

              },
              child: Text('Create a notification with delay'),
            ),

          ],
        ),
      ),

    );
  }
}
