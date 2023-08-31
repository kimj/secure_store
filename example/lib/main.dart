import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secure_store/secure_store_method_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _result = "";
  final _secureStore = SecureStore();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String result = "";
    try {
      String key = "testKey";
      String value = "testValue";

      _secureStore.write(key: key, value: value);
    } on PlatformException {
      result = 'Secure Store Failure';
    }

    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Secure Store Plugin example app'),
          ),
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a key',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a value',
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Row(
                    children: [
/*                  OutlinedButton(onPressed: () {
                    _secureStore.write(key: , value: value)
                  }, child: Text('Write'),),
                  OutlinedButton(onPressed: () {  }, child: Text('Read'),),
                  OutlinedButton(onPressed: () {  }, child: Text('Contains'),),
                  OutlinedButton(onPressed: () {  }, child: Text('Delete'),),
                */
                    ],
                  )),
            ],
          )),
    );
  }
}