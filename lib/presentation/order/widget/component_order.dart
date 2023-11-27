import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/data/models/responses/order/order_buyer_response_model.dart';
import 'package:flutter/material.dart';

class ComponentOrder extends StatelessWidget {
  final DataOrder data;
  const ComponentOrder({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: BorderRadius.circular(10),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      widget: Column(),
    );
  }
}
