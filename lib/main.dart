import 'package:flutter/material.dart';
import 'package:flutter_assignment/app.dart';
import 'package:flutter_assignment/injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}
