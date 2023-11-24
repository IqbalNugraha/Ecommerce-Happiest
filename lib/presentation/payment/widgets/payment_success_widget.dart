import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce_final_task/presentation/bottom_navigation_page.dart';
import 'package:flutter/material.dart';

import '../../../common/constans/variables.dart';

class PaymentSuccessWidget extends StatefulWidget {
  const PaymentSuccessWidget({super.key});

  @override
  State<PaymentSuccessWidget> createState() => _PaymentSuccessWidgetState();
}

class _PaymentSuccessWidgetState extends State<PaymentSuccessWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: Variables.msgSuccessPayment,
        desc: Variables.msgDescSuccessPayment,
        btnOkOnPress: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const BottomNavigationPage();
          }));
        },
      ).show();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
