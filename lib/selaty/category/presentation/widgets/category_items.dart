import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../cart/presentation/views/cart_screen.dart';
import '../../../helper/api_url.dart';
import '../../../home/cubit/products_cubit.dart';
import '../../../home/presentation/widgets/fruits_new/items_bottom_row.dart';
import '../../../home/presentation/widgets/fruits_new/items_center_column.dart';
import '../../../home/presentation/widgets/fruits_new/items_row.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.height,
    required this.fruits,
    required this.width,
    required this.isPortrait,
  });

  final double height;
  final String fruits;
  final double width;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state)
    {
      final productsCubit = context.read<ProductsCubit>();
      final products = productsCubit.productsModel.data ?? [];

      if (state is ProductsLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is ProductsErrorState) {
        return const Center(child: Text("فشل تحميل المنتجات"));
      } else if (products.isEmpty) {
        return const Center(child: Text("لا توجد منتجات"));
      }
      return Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
        child: SizedBox(
          height: isPortrait ? height * .55 : height * 4,
          child: GridView.builder(
            physics: isPortrait
                ? BouncingScrollPhysics()
                : NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isPortrait ? 2 : 3,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: isPortrait ? (1 / 2.1) : (1 / 1.4),
            ),
            itemCount: isPortrait ? 10 : 12,
            itemBuilder: (context, index) {
              final product = products[index];
              return InkWell(
                onTap: () => Get.to(const CartScreen()),
                child: Stack(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(bottom: 40.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ItemsRow(isPortrait: isPortrait,),
                              Center(
                                child: SizedBox(
                                  height: 120.h,
                                  width: 120.h,
                                  child: Image.network(
                                    '${ApiUrl.imageBaseUrl}${product.img}',
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              CenterColumn(
                                isPortrait: isPortrait,
                                title: product.name ?? '',
                                unit: product.unit ?? '',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BottomRow(
                      width: width,
                      isPortrait: isPortrait,
                      price:
                      product.priceAfterDiscount?.toStringAsFixed(2) ??
                          product.price?.toStringAsFixed(2) ??
                          '0',
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      );
    }
    );
    }
  }