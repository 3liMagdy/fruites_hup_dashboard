


import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_styles.dart';

class CustonBtn extends StatelessWidget {
  const CustonBtn({super.key, required this.onpressed, required this.text});
 final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          
        ),
        onPressed: onpressed,
        child: Text(text, style: CustomTextStyles.Cairo700style16),
      ),
    );
  }
}


