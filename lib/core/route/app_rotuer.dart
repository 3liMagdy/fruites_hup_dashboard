
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fruits_hub_dashboard/features/dashboard_views/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/view/dashbordview.dart';

class AppRouter {

  static const String kAddProductView = '/addProductView';
  static const String kDashbordView = '/dashbordView';

  static final GoRouter router = GoRouter(
    initialLocation: kDashbordView,
    routes: [
      GoRoute(
        path: kAddProductView,
        builder: (context, state) => const AddProductView(),
      ),
      GoRoute(
        path: kDashbordView,
        builder: (context, state) => const DashbordView(),
      ),
    ],
  );
}