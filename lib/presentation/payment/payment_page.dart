import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  final String invoiceUrl, orderId;

  const PaymentPage({
    super.key,
    required this.invoiceUrl,
    required this.orderId,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  WebViewController? _controller;
  Timer? _timer;
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
