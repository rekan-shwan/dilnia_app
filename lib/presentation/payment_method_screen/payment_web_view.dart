import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String paymentUrl;

  const PaymentWebView({super.key, required this.paymentUrl});

  @override
  PaymentWebViewState createState() => PaymentWebViewState();
}

class PaymentWebViewState extends State<PaymentWebView> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment ")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
