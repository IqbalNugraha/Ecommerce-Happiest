import 'package:ecommerce_final_task/presentation/home/bloc/product/product_bloc.dart';
import 'package:ecommerce_final_task/presentation/home/bloc/promotion/promotion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoryBloc {
  static void initBloc(BuildContext context) {
    context.read<ProductBloc>().add(const ProductEvent.getAllProducts());
    context.read<PromotionBloc>().add(const PromotionEvent.getAllPromotions());
  }
}
