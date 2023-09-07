import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frozen_food/app/app.dart';
import 'package:frozen_food/app/injecton_container.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  
  configureDependencies();

  runApp(const MyApp());
}
