import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:url_launcher/url_launcher.dart';

final links = [
  'https://www.youtube.com/watch?v=IrGYUq1mklk&t=161s',
  'https://www.youtube.com/watch?v=IrGYUq1mklk&t=231s',
  'https://www.youtube.com/watch?v=IrGYUq1mklk&t=286s',
  'https://www.youtube.com/watch?v=IrGYUq1mklk&t=492s',
  'https://www.youtube.com/watch?v=IrGYUq1mklk&t=831s',
  'https://www.youtube.com/watch?v=IrGYUq1mklk&t=1088s',
];

class LiquidGlassFeaturesSlide extends FlutterDeckSlideWidget {
  const LiquidGlassFeaturesSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/liquid-glass-features',
            title: 'Liquid Glassの特徴',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Liquid Glassの特徴',
                  style: TextStyle(
                    fontSize: 58,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    childAspectRatio: 1.5,
                    children: [
                      _buildFeatureCard(
                        context,
                        '歪み（Distortion）',
                        'ガラス瓶越しに見ているかのような歪み',
                        Icons.lens_blur,
                        0,
                      ),
                      _buildFeatureCard(
                        context,
                        '揺らぎ（Wobbly）',
                        'ジェリーのように揺れ動く',
                        Icons.water_drop,
                        1,
                      ),
                      _buildFeatureCard(
                        context,
                        '分裂と再結合',
                        '水滴が割れて再び合わさる',
                        Icons.bubble_chart,
                        2,
                      ),
                      _buildFeatureCard(
                        context,
                        '色のにじみ',
                        '鮮やかな色がさりげなくにじみ出す',
                        Icons.gradient,
                        3,
                      ),
                      _buildFeatureCard(
                        context,
                        '2つのバリアント',
                        '通常版とクリア版',
                        Icons.layers,
                        4,
                      ),
                      _buildFeatureCard(
                        context,
                        'アクセシビリティ',
                        'エフェクトをオフにして視認性向上',
                        Icons.accessibility_new,
                        5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    int linkIndex,
  ) {
    return GestureDetector(
      onTap: () => _openWebView(context, linkIndex),
      child: GlassContainer(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.black87,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.play_circle_outline,
              size: 50,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  void _openWebView(BuildContext context, int linkIndex) {
    if (linkIndex >= 0 && linkIndex < links.length) {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => WebViewScreen(url: links[linkIndex]),
        ),
      );
    }
  }
}

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({required this.url, super.key});
  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;

  InAppWebViewSettings settings = InAppWebViewSettings(
    isInspectable: kDebugMode,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    iframeAllow: 'camera; microphone',
    iframeAllowFullscreen: true,
  );

  PullToRefreshController? pullToRefreshController;
  double progress = 0;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = kIsWeb ||
            ![TargetPlatform.iOS, TargetPlatform.android]
                .contains(defaultTargetPlatform)
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(
              color: Colors.blue,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                await webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                await webViewController?.loadUrl(
                  urlRequest:
                      URLRequest(url: await webViewController?.getUrl()),
                );
              }
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liquid Glass Demo', 
          style: TextStyle(
            fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
          ),
        ),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    initialUrlRequest: URLRequest(url: WebUri(widget.url)),
                    initialSettings: settings,
                    pullToRefreshController: pullToRefreshController,
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                    onLoadStart: (controller, url) {
                      setState(() {});
                    },
                    onPermissionRequest: (controller, request) async {
                      return PermissionResponse(
                        resources: request.resources,
                        action: PermissionResponseAction.GRANT,
                      );
                    },
                    shouldOverrideUrlLoading:
                        (controller, navigationAction) async {
                      final uri = navigationAction.request.url!;

                      if (![
                        'http',
                        'https',
                        'file',
                        'chrome',
                        'data',
                        'javascript',
                        'about',
                      ].contains(uri.scheme)) {
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                          return NavigationActionPolicy.CANCEL;
                        }
                      }

                      return NavigationActionPolicy.ALLOW;
                    },
                    onLoadStop: (controller, url) async {
                      await pullToRefreshController?.endRefreshing();
                      setState(() {});
                    },
                    onReceivedError: (controller, request, error) {
                      pullToRefreshController?.endRefreshing();
                    },
                    onProgressChanged: (controller, progress) {
                      if (progress == 100) {
                        pullToRefreshController?.endRefreshing();
                      }
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                    onConsoleMessage: (controller, consoleMessage) {
                      if (kDebugMode) {
                        print(consoleMessage);
                      }
                    },
                  ),
                  if (progress < 1.0)
                    LinearProgressIndicator(value: progress)
                  else
                    Container(),
                ],
              ),
            ),
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Icon(Icons.arrow_back),
                  onPressed: () {
                    webViewController?.goBack();
                  },
                ),
                ElevatedButton(
                  child: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    webViewController?.goForward();
                  },
                ),
                ElevatedButton(
                  child: const Icon(Icons.refresh),
                  onPressed: () {
                    webViewController?.reload();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
