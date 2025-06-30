import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/selaty/helper/api_url.dart';
import '../../../cubit/products_cubit.dart';
import 'items_bottom_row.dart';
import 'items_center_column.dart';
import 'items_row.dart';

class FruitsItemsNew extends StatelessWidget {
  const FruitsItemsNew({super.key, required this.isPortrait});
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    String fruits = "assets/images/fruits.png";
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final productsCubit = context.read<ProductsCubit>();
        final products = productsCubit.productsModel.data ?? [];

        if (state is ProductsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsErrorState) {
          return const Center(child: Text("فشل تحميل المنتجات"));
        } else if (products.isEmpty) {
          return const Center(child: Text("لا توجد منتجات"));
        }
        return SizedBox(
          height: isPortrait ? height * .85 : height * 2,
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 1.5 / 1,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ItemsRow(isPortrait: isPortrait),
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
                  BottomRow(
                    width: width,
                    isPortrait: isPortrait,
                    price:
                        product.priceAfterDiscount?.toStringAsFixed(2) ??
                        product.price?.toStringAsFixed(2) ??
                        '0',
                  ),
                ],
              );
            },
            itemCount: products.length,
          ),
        );
      },
    );
  }
}
