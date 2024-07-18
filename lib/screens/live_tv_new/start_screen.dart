import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

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
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://toffeelive.com/'));

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          toolbarHeight:35 ,
          // context: context,
          title: const Text("LIVE TV SERVER",style: TextStyle(fontSize: 17),
          ),centerTitle: true
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          toolbarHeight:35 ,
          // context: context,
          title: const Text("LIVE TV SERVER",style: TextStyle(fontSize: 17),
          ),centerTitle: true
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            )
        {
          final bool connected = connectivity != ConnectivityResult.none;
          return Stack(
            fit: StackFit.expand,
            children: [

           connected? const WebviewScaffold(
            url: "https://toffeelive.com/",
            initialChild: Center(
              child: CircularProgressIndicator(),
            ))

              :Center(
                child: Image.asset(
                  "assets/icons/n1.png",fit: BoxFit.cover,
                ),
              ),

            ],
          );
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'There are no buttons to push :)',
            ),
             Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
 */