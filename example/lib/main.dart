import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:cupertino_fullscreen_modal/cupertino_fullscreen_modal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CupertinoFullscreenModal(
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String fromModal = 'Nothing';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino Fullscreen Modal example app'),
      ),
      body: GestureDetector(
        onTap: () {
          CupertinoFullscreenModal.of(context).showModal(Modal(), onClose: (value) {
            setState(() {
              fromModal = value;
            });
          });
        },
        child: Center(
          child: Text('Open modal: Data $fromModal'),
        ),
      ),
    );
  }
}

class Modal extends StatelessWidget {
  const Modal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop('Awesome data');
        },
        child: Center(
          child: Text('Hello modal!'),
        ),
      ),
    );
  }
}
