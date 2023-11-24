import 'dart:async';

import 'package:ecommerce_final_task/presentation/payment/bloc/order_detail/order_detail_bloc.dart';
import 'package:ecommerce_final_task/presentation/payment/widgets/payment_failed_widget.dart';
import 'package:ecommerce_final_task/presentation/payment/widgets/payment_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../common/constans/navigation.dart';

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
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.invoiceUrl));
    const oneSec = Duration(seconds: 5);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      //do check payment status here
      //if status is success, navigate to success page
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      //   return const SuccessPage();
      // }));
      context
          .read<OrderDetailBloc>()
          .add(OrderDetailEvent.getOrderDetail(widget.orderId));
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OrderDetailBloc, OrderDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (order) {
              if (order.data!.attributes!.status == 'packaging') {
                Navigations.pushAndRemoveNavigation(
                  context,
                  const PaymentSuccessWidget(),
                );
              } else if (order.data!.attributes!.status == 'failed') {
                Navigations.pushAndRemoveNavigation(
                  context,
                  const PaymentFailedWidget(),
                );
              }
            },
          );
        },
        child: WebViewWidget(controller: _controller!),
      ),
    );
  }
}
