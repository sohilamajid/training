import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:selaty/selaty/category/model/CategoriesModel.dart';
import '../../helper/dio_helper.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  final DioHelper _dioHelper = DioHelper();
  final ScrollController scrollController = ScrollController();

  List<ProductData> allProducts = [];
  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;

  void initScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 300 &&
          !isLoadingMore &&
          currentPage < lastPage) {
        fetchMoreProducts();
      }
    });
  }

  void getProducts({bool isInitial = true}) async {
    if (isInitial) {
      emit(CategoriesLoadingState());
      currentPage = 1;
      allProducts.clear();
    }

    try {
      final response = await _dioHelper.getData(
        path: 'https://master-market.masool.net/api/product/get/ar?page=$currentPage',
      );

      final categoriesModel = CategoriesModel.fromJson(response.data);

      if (categoriesModel.status == true && categoriesModel.data != null) {
        lastPage = categoriesModel.data!.lastPage ?? 1;
        final newProducts = categoriesModel.data!.data ?? [];

        allProducts.addAll(newProducts);
        emit(CategoriesSuccessState());
      } else {
        Get.snackbar("Error", categoriesModel.message ?? "", backgroundColor: Colors.red);
        emit(CategoriesErrorState());
      }
    } catch (e, st) {
      debugPrint("Error fetching categories: $e");
      debugPrintStack(stackTrace: st);
      emit(CategoriesErrorState());
    }
  }

  void fetchMoreProducts() async {
    emit(CategoriesMoreLoadingState());
    if (currentPage >= lastPage) return;

    isLoadingMore = true;
    currentPage++;

    try {
      final response = await _dioHelper.getData(
        path: 'https://master-market.masool.net/api/product/get/ar?page=$currentPage',
      );

      final model = CategoriesModel.fromJson(response.data);

      if (model.status == true && model.data != null) {
        allProducts.addAll(model.data!.data ?? []);
        emit(CategoriesSuccessState());
      } else {
        emit(CategoriesErrorState());
      }
    } catch (e) {
      emit(CategoriesErrorState());
    } finally {
      isLoadingMore = false;
    }
  }
}



