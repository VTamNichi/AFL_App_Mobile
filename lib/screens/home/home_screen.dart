import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/notification_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/auth_api.dart';
import 'package:amateur_football_league_mobile/screens/home/components/body.dart';
import 'package:amateur_football_league_mobile/screens/notification/notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final storage = const FlutterSecureStorage();
  final userController = Get.put(UserController());
  final notificationController = Get.put(NotificationController());
  //List<News>? listNews;
  //var statisticCovid;
  NumberFormat formatter = NumberFormat('###,000');

  @override
  void initState() {
    super.initState();
    _fireBaseConfig();
  }

  void _fireBaseConfig() {
    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _firebaseMessaging.subscribeToTopic('all');
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      // accountController.countNotificationUnread.value =
      //     accountController.countNotificationUnread.value + 1;
      showNotification(
          event.notification!.title ?? "", event.notification!.body ?? "");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data['page'] != null) {
        // listDoctorController.getTokenHealthCheck(
        //     patientProfileController.nearestHealthCheck.value.id);
      }
    });
    _firebaseMessaging
        .getToken()
        .then((token) {
          storage.write(key: "tokenFCM", value: token);
        })
        .then((value) => {AuthAPI.makeConnection()});
//        .then((value) => {FetchAPI.getCountUnreadNotification()});
  }

  void showNotification(String title, String body) async {
    await _demoNotification(title, body);
  }

  Future<void> _demoNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'channel_ID', 'channel name',
        importance: Importance.max,
        playSound: true,
        showProgress: true,
        priority: Priority.high,
        ticker: 'test ticker');
    var iOSChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSChannelSpecifics);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: 'test');
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Trang chủ"),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: kBlueBlack,
            actions: [
              SizedBox(
                width: 60,
                child: Stack(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        size: 34,
                      ),
                      onPressed: () async {
                        Get.to(NotificationScreen());
                      },
                    ), ],
                ),
              )
            ],
          ),
        body: SingleChildScrollView(child: Body()),
        backgroundColor: kBlueBlack,
      )
    );
  }
}