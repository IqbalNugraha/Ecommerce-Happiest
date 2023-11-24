import 'package:flutter/material.dart';

import '../../../common/constans/variables.dart';

class PaymentFailedWidget extends StatelessWidget {
  const PaymentFailedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(Variables.msgFailedPayment),
      ),
    );
  }
}
