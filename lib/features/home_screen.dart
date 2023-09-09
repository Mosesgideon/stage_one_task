import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
                child: Text(
              'Chukwuezuwom Gideon Moses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                  borderRadius: BorderRadius.circular(75),
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/image.jpg',
                      ),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(

                  onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const WebViewImplementation())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Text('Open GitHub')),
            ),
          ],
        ),
      ),
    );
  }
}

class WebViewImplementation extends StatefulWidget {
  const WebViewImplementation({
    super.key,
  });

  @override
  State<WebViewImplementation> createState() => _WebViewImplementationState();
}

class _WebViewImplementationState extends State<WebViewImplementation> {
  final controller = WebViewController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: WebViewWidget(
              controller: controller
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..loadRequest(Uri.parse('https://github.com/Mosesgideon')),)),
    );
  }
}
