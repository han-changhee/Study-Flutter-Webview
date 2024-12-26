import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatefulWidget{
  // HomeScreen({super.key});
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<HomeScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(homeUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Code Factory'),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {
              if (_controller != null) {
                _controller!.loadRequest(homeUrl);
              }
            },
            icon: Icon(
              Icons.home,
            ),
          ),
        ],
      ),

      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}