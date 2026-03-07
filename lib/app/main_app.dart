

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/route/app_rotuer.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp.router(
              debugShowCheckedModeBanner: false,
             routerConfig: AppRouter.router,
             
            );
  }
}