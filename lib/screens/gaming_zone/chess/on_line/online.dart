import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnlineChess extends StatefulWidget {
  const OnlineChess({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OnlineChess> {

  @override
  Widget build(BuildContext context) {

    WebViewController controller = WebViewController()
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
          onNavigationRequest: (NavigationRequest request)
          {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.chess.com/play'));

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          toolbarHeight:35 ,
          // context: context,
          title: const Text("Online Chess",style: TextStyle(fontSize: 17),
          ),centerTitle: true
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}