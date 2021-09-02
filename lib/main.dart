import 'package:flutter/material.dart';
import 'dart:io';

import 'package:tarefas_app/views/android/android.app.dart';
import 'package:tarefas_app/views/ios/ios.app.dart';

void main() {
  // runApp(Platform.isIOS ? IosApp() : AndroidApp());
  runApp(AndroidApp());
}
