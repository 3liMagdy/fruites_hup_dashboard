import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/service_locator.dart';
import 'package:fruits_hub_dashboard/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub_dashboard/core/utils/app_styles.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/presentation/mangers/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/presentation/view/widgets/add_product_view_body.dart';

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
      // We provide the Cubit here because it's only used within the AddProduct flow.
      // This ensures the Cubit is closed and its resources are freed when the view is popped.
      body: BlocProvider(
        create: (context) => getIt<AddProductCubit>(),
        child: const AddProductViewBody(),
      ),
    );
  }
}
