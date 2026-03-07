

import 'package:fruits_hub_dashboard/core/route/app_rotuer.dart';
import 'package:fruits_hub_dashboard/core/functions/navigation.dart';
import 'package:fruits_hub_dashboard/core/widgets/CustonBtn.dart';
import 'package:flutter/material.dart';

class DashboradViewBody extends StatelessWidget {
  const DashboradViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustonBtn(
            onpressed: () {
            customNavigate(context, AppRouter.kAddProductView);
          }, text: 'Add Product')
          ]
    );
  }
}