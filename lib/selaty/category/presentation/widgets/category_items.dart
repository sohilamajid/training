import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../cart/presentation/views/cart_screen.dart';
import '../../../home/presentation/widgets/fruits_new/items_bottom_row.dart';
import '../../../home/presentation/widgets/fruits_new/items_center_column.dart';
import '../../../home/presentation/widgets/fruits_new/items_row.dart';
import '../../cubit/categories_cubit.dart';
import '../../model/CategoriesModel.dart';

class CategoryItems extends StatefulWidget {
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
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  late final CategoriesCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<CategoriesCubit>();
    cubit.getProducts(isInitial: true);
    cubit.initScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final products = cubit.allProducts;

        if (state is CategoriesLoadingState && products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoriesErrorState && products.isEmpty) {
          return const Center(child: Text("فشل تحميل المنتجات"));
        } else if (products.isEmpty) {
          return const Center(child: Text("لا توجد منتجات"));
        }

        return Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
          child: GridView.builder(
            controller: cubit.scrollController,
            physics:
                widget.isPortrait
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.isPortrait ? 2 : 3,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: widget.isPortrait ? (1 / 2) : (1 / 1.4),
            ),
            itemCount:
                state is CategoriesMoreLoadingState
                    ? products.length + 1
                    : products.length,
            itemBuilder: (context, index) {

              if (index == products.length) {
                // Show loading indicator at the end
                return const Center(child: CircularProgressIndicator());
              }
              final ProductData product = products[index];
                {
                return InkWell(
                  onTap: () => Get.to(const CartScreen()),
                  child: Stack(
                    children: [
                      Container(
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
                                ItemsRow(isPortrait: widget.isPortrait),
                                Center(
                                  child: SizedBox(
                                    height: 120.h,
                                    width: 120.h,
                                    child: productImageWidget(product),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                CenterColumn(
                                  isPortrait: widget.isPortrait,
                                  title: product.name ?? '',
                                  unit: '',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      BottomRow(
                        width: widget.width,
                        isPortrait: widget.isPortrait,
                        price: product.price ?? '0',
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget productImageWidget(ProductData product) {
    // Adjust this if you have an image field in your new ProductData model
    // Assuming no image field, return placeholder icon

    return const Icon(Icons.image_not_supported, size: 60);

    // If you add image url later, replace with:
    // return Image.network(
    //   '${ApiUrl.imageBaseUrl}${product.img}',
    //   errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
    //   fit: BoxFit.contain,
    // );
  }
}
