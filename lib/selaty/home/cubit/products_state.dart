part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class ProductsLoadingState extends ProductsState {}
final class ProductsSuccessState extends ProductsState {}
final class ProductsErrorState extends ProductsState {}
