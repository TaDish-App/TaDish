import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/ratings/domain/rating.dart';
import 'firebase_options.dart';
import 'app.dart';


// Check that Freezed data models and json data files are compatible.
Future<bool> verifyInitialData() async {
  await Rating.checkInitialData();

  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await verifyInitialData();
  runApp(const ProviderScope(child: MyApp()));
}

