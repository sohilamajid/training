import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:selaty/selaty/home/model/ProductsModel.dart';
import '../../helper/api_url.dart';
import '../../helper/dio_helper.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  DioHelper _dioHelper = DioHelper();
  ProductsModel productsModel = ProductsModel();

  void getProducts() async {
    emit(ProductsLoadingState());

    try {
      final response = await _dioHelper.getData(path: ApiUrl.products);
      debugPrint("Products API Response-------------------------: ${response.data}");

      productsModel = ProductsModel.fromJson(response.data);
      if (productsModel.status == true) {
        emit(ProductsSuccessState());
      } else {
        Get.snackbar("Error", productsModel.message??"",backgroundColor: Colors.red);
        emit(ProductsErrorState());
      }
    } catch (e, st) {
      debugPrint("Error fetching products-------------------: $e");
      debugPrintStack(stackTrace: st);
      emit(ProductsErrorState());
    }
  }
}
