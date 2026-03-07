

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
     title,
      style: CustomTextStyles.Cairo700style19,
      textAlign: TextAlign.center,
    );
  }
}