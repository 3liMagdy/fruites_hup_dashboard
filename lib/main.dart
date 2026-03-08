import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/app/main_app.dart';
import 'package:fruits_hub_dashboard/core/services/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Supabase.initialize(
    url: 'https://bgbkmucjgslsasavahiv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJnYmttdWNqZ3Nsc2FzYXZhaGl2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzI5OTA0ODAsImV4cCI6MjA4ODU2NjQ4MH0.bCoLY4mKe6cOnDpPpBBxL69w1RnIg0MoSq_Co1X8eVc',
  );
  setupGetIt();
  runApp(const MainApp());
}
