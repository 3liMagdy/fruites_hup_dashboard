import 'package:flutter/material.dart';
import '../../core/utils/app_strings/app_strings.dart';
import '../../core/utils/app_styles.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.addProduct,
          style: CustomTextStyles.Cairo700style19,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const AddProductViewBody(),
    );
  }
}
