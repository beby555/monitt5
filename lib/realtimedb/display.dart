// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:monitt5/main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RealtimeDatabaseDisplayState extends StatefulWidget {
  const RealtimeDatabaseDisplayState({Key key}) : super(key: key);

  @override
  State<RealtimeDatabaseDisplayState> createState() =>
      _RealtimeDatabaseDisplayStateState();
}

class _RealtimeDatabaseDisplayStateState
    extends State<RealtimeDatabaseDisplayState>
    with SingleTickerProviderStateMixin {
  @override
  final databaseRef = FirebaseDatabase.instance.ref();

  bool value = false;
  Color color = Colors.grey;

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
            child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text("DRAWER HEADER.."),
              decoration: new BoxDecoration(color: Colors.orange),
            ),
            new ListTile(
              title: new Text("Room 1"),
              onTap: () {},
            ),
            new ListTile(
              title: new Text("Room 2"),
              onTap: () {},
            ),
          ],
        )),
        body: SafeArea(
          child: StreamBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data.snapshot.value != null) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState.openDrawer();
                              },

                              child: Icon(
                                Icons.clear_all,
                                color: !value ? Colors.green : Colors.white,
                              ),
                              // ),
                            ),
                            Text("SMART GARDEN",
                                style: TextStyle(
                                    color: !value ? Colors.green : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),

                            Icon(
                              Icons.settings,
                              color: !value ? Colors.green : Colors.white,
                            ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Temperature",
                                    style: TextStyle(
                                        color: !value
                                            ? Colors.green
                                            : Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              CircularPercentIndicator(
                                radius: 50.0,
                                lineWidth: 12.0,
                                animation: true,
                                backgroundColor: Colors.white,
                                percent: snapshot
                                        .data.snapshot.value["Temperatur_C"]
                                        .toDouble() /
                                    100,
                                center: Text(
                                    snapshot.data.snapshot.value["Temperatur_C"]
                                            .toString() +
                                        "°C",
                                    style: TextStyle(
                                        color: !value
                                            ? Colors.green
                                            : Colors.white,
                                        fontSize: 20)),
                                progressColor: Colors.green,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Kelembapan Udara",
                                style: TextStyle(
                                    color: !value ? Colors.green : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          CircularPercentIndicator(
                            radius: 50.0,
                            lineWidth: 12.0,
                            animation: true,
                            backgroundColor: Colors.white,
                            percent: snapshot
                                    .data.snapshot.value["Kelembapan_Udara"]
                                    .toDouble() /
                                100,
                            center: Text(
                                snapshot.data.snapshot.value["Kelembapan_Udara"]
                                        .toString() +
                                    "%",
                                style: TextStyle(
                                    color: !value ? Colors.green : Colors.white,
                                    fontSize: 20)),
                            progressColor: Colors.green,
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Kelembapan Tanah",
                                style: TextStyle(
                                    color: !value ? Colors.green : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          CircularPercentIndicator(
                            radius: 50.0,
                            lineWidth: 12.0,
                            animation: true,
                            backgroundColor: Colors.white,
                            percent: snapshot
                                    .data.snapshot.value["Kelembapan_Tanah"]
                                    .toDouble() /
                                100,
                            center: Text(
                                snapshot.data.snapshot.value["Kelembapan_Tanah"]
                                        .toString() +
                                    "%",
                                style: TextStyle(
                                    color: !value ? Colors.green : Colors.white,
                                    fontSize: 20)),
                            progressColor: Colors.green,
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Kondisi Tanah Saat ini ",
                                style: TextStyle(
                                    color: !value ? Colors.green : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                snapshot.data.snapshot.value["Kondisi"]
                                    .toString(),
                                style: TextStyle(
                                    color: !value ? Colors.green : Colors.white,
                                    fontSize: 20)),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Mode Penyiraman",
                                style: TextStyle(
                                    color: !value ? Colors.green : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: FloatingActionButton.extended(
                              icon: value
                                  ? Icon(Icons.adf_scanner_outlined)
                                  : Icon(Icons.sensors_rounded),
                              backgroundColor:
                                  value ? Colors.white : Colors.green,
                              label: value ? Text("Manual") : Text("Otomatis"),
                              elevation: 20.00,
                              onPressed: () {
                                onUpdate();
                                writeData();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {}
                return Container();
              },
              stream: databaseRef.child("Data").onValue),
        ),
      ),
    );
  }

  Future<void> writeData() async {
    databaseRef.child("LightState").set({"switch": !value});
  }

  Future<void> writeData1() async {
    databaseRef.child("Siram").set({"manual": !value});
  }

  Future<void> readData() async {
    databaseRef.child("Data").once().then((snapshot) {
      print(snapshot);
    });
  }

  final DatabaseReference _database = FirebaseDatabase().reference();
  FirebaseMessaging _fcm;
  String message;
  String token;

  @override
  void initState() {
    super.initState();
    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: android?.smallIcon,
              ),
            ));
      }
    });

    getToken();
  }

  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    setState(() {
      token = token;
    });
    final DatabaseReference _database = FirebaseDatabase().reference();
    _database.child('fcm-token/${token}').set({"token": token});
  }
}

void firebaseOnMessafe() {
  FirebaseMessaging.onMessage.listen((message) {
    RemoteNotification notification = message.notification;
    if (message != null) {
      final title = message.notification.title;
      final body = message.notification.body;
      showDialog(
        builder: (context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.all(18),
            children: [
              Text('Title: $title'),
              Text('Body: $body'),
            ],
          );
        },
      );
    }
  });
}
