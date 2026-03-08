import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruits_hub_dashboard/core/utils/app_strings/app_strings.dart';
import 'package:fruits_hub_dashboard/core/utils/app_styles.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/presentation/mangers/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/presentation/mangers/add_product_cubit/add_product_state.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/presentation/view/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/presentation/view/widgets/image_picker_container.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  
  bool isFeaturedItem = false;
  File? image;

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    codeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void createProduct() {
    if (image == null) {
      Fluttertoast.showToast(msg: "Please select an image");
      return;
    }
    if (_formKey.currentState!.validate()) {
      final product = ProductEntity(
        name: nameController.text,
        price: num.tryParse(priceController.text) ?? 0,
        code: codeController.text,
        description: descriptionController.text,
        isFeatured: isFeaturedItem,
        imageUrl: '', // Will be updated by Cubit
      );
      context.read<AddProductCubit>().addProduct(product, image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          Fluttertoast.showToast(msg: "Product added successfully");
          Navigator.pop(context);
        }
        if (state is AddProductFailure) {
          Fluttertoast.showToast(msg: state.errMessage);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      CustomTextField(
                        hintText: AppStrings.productName,
                        controller: nameController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: AppStrings.productPrice,
                        textInputType: TextInputType.number,
                        controller: priceController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: AppStrings.productCode,
                        textInputType: TextInputType.number,
                        controller: codeController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: AppStrings.productDescription,
                        maxLines: 5,
                        controller: descriptionController,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: isFeaturedItem,
                            onChanged: (value) {
                              setState(() {
                                isFeaturedItem = value ?? false;
                              });
                            },
                          ),
                          Text(
                            AppStrings.isFeaturedItem,
                            style: CustomTextStyles.Cairo600style13.copyWith(
                              color: AppColors.lightGrey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ImagePickerContainer(
                        onImageSelected: (selectedImage) {
                          image = selectedImage;
                        },
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: state is AddProductLoading ? null : createProduct,
                          child: Text(
                            AppStrings.addProduct,
                            style: CustomTextStyles.Cairo700style16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
            if (state is AddProductLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
    );
  }
}
