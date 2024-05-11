/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_first_app/auth/welcome.dart';
import 'package:my_first_app/sizeconfig.dart';

import 'home.dart';
import 'package:http/http.dart' as http;
import 'auth/welcome.dart';
import 'package:wifi_scan/wifi_scan.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

String getDeviceType() {
  String device_type = "";
  Orientation currentOrientation =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).orientation;
  if (currentOrientation == Orientation.portrait) {
    var width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

    if (width > 510) {
      device_type = "tablet";
    } else {
      device_type = "phone";
    }
  } else {
    var height =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

    if (height > 510) {
      device_type = "tablet";
    } else {
      device_type = "phone";
    }
  }
  return device_type;
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> registerUser() async {
    print('pressed');
    try {
      var url = Uri.parse('http://192.168.100.31:5000/api/auth/register');
      print('pressed11');
      var data = jsonEncode({
        "username": "anilkolgir",
        "email": "anilkolgir@gmail.com",
        "phone": "9876432557",
        "password": "123456"
      });
      print('pressed222${data.runtimeType}');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: data,
      );
      print('pressed33');
      if (response.statusCode == 200) {
        print('Registration successful: ${jsonDecode(response.body)}');
      } else {
        print('Registration failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }
  void signup() async {
    try {
      var url = Uri.parse('http://192.168.100.31:5000/api/auth/login');

      // JSON data
      var data = {
        "email": "anilkolgir@gmail.com",
        "password": "123456",

      };

      // Convert data to JSON string
      var jsonData = jsonEncode(data);

      // HTTP request headers
      var headers = {
        'Content-Type': 'application/json',
            };

      // HTTP POST request
      var response = await http.post(
        url,
        headers: headers,
        body: jsonData,
      );

      // Check the response status code
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: _buildTextTheme(),
      ),
      home: HomePage(),
      );
  }
}
TextTheme _buildTextTheme() {
  return TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontFamily: 'Workbench-Regular',
      // Add any other properties you want to apply globally
    ),
    headline2: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontFamily: 'Oxygen-Regular',
      // Add any other properties you want to apply globally
    ),
    headline3: TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontFamily: 'Satisfy-Regular',
      // Add any other properties you want to apply globally
    ),
    // Add more text styles as needed
  );
}

class WifiListScreen extends StatefulWidget {
  @override
  _WifiListScreenState createState() => _WifiListScreenState();
}

class _WifiListScreenState extends State<WifiListScreen> {
var _wifiList = [];

  @override
  void initState() {
    super.initState();
    _getWifiList();
  }

  Future<void> _getWifiList() async {
    try {
      var wifiList =  await WiFiScan.instance.getScannedResults();
      setState(() {
        _wifiList = wifiList;
      });
    } catch (e) {
      print("Failed to get Wi-Fi list: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wi-Fi Networks'),
      ),
      body:Welcome()
      */
/* ListView.builder(
        itemCount: _wifiList.length,
        itemBuilder: (context, index) {
          WifiResult wifi = _wifiList[index];
          return ListTile(
            title: Text(wifi.ssid),
            subtitle: Text('Signal Strength: ${wifi.level}'),
          );
        },
      ),*//*

    );
  }
}

*/
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Phone Launcher Demo')),
        body: Center(
          child: HomeNew()
        ),
      ),
    );
  }
}
class HomeNew extends StatefulWidget{
  @override
  State<HomeNew> createState() {
   return _HomeNewState();
  }

}
class _HomeNewState extends  State<HomeNew>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchEmailApp(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
           'Email',
            style: const TextStyle(color: Colors.blue),
          ),
          const SizedBox(width: 4),
          Text(
            'unkeshwarhande@gmail.com',
            style: const TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
/*  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _callNumber(context),
      child: Text(
        '9168169432',
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }*/
/*  Future<void> _callNumber(BuildContext context) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '9168169432',
    );
    await canLaunchUrl(launchUri)
        ? await launchUrl(launchUri)
        : throw 'Could not launch $launchUri';
  }*/
  Future<void> _launchEmailApp(BuildContext context) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: 'mailto:unkeshwarhande@gmail.com?subject=subject'
    );
    await canLaunchUrl(launchUri)
        ? await launchUrl(launchUri)
        : throw 'Could not launch email app';
  }
}

