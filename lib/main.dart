import 'package:flutter/material.dart';
import 'package:hiremee/features/auth/screens/login_screen.dart';
import 'package:hiremee/features/auth/screens/login_with_email.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'routes/app_routes.dart'; // your router file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://gmsntcxruugieeoeuvjc.supabase.co', // replace with your URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdtc250Y3hydXVnaWVlb2V1dmpjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ0MTczNDksImV4cCI6MjA2OTk5MzM0OX0.4iGc6t3dGIMKfJnVlzB7Rcw8_IJi60c5zqrP4DKhs0M', // replace with your anon key
  );
  runApp(
    const MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
