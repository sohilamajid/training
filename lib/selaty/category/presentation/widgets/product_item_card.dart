import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:selaty/selaty/home/model/ProductsModel.dart';
import '../../../cart/presentation/views/cart_screen.dart';
import '../../../helper/api_url.dart';
import '../../../home/presentation/widgets/fruits_new/items_bottom_row.dart';
import '../../../home/presentation/widgets/fruits_new/items_center_column.dart';
import '../../../home/presentation/widgets/fruits_new/items_row.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.isPortrait,
    required this.product,
    required this.width,
  });

  final bool isPortrait;
  final Data product;
  final double width;

  @override
  Widget build(BuildContext context) {
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
}