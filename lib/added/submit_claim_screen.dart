import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SubmitClaimScreen extends StatefulWidget {
  const SubmitClaimScreen({super.key});

  @override
  State<SubmitClaimScreen> createState() => _SubmitClaimScreenState();
}

class _SubmitClaimScreenState extends State<SubmitClaimScreen> {
  static const Map<String, String> _claimUrls = {
    'Health':
        'https://forms.zohopublic.eu/muhammadnadhim/form/MedicalClaim/formperma/9xP5SpCMtbkcde7RJl6uUkAkuwDUeVnaRuXpEiO14zY',
    'Motor':
        'https://forms.zohopublic.eu/muhammadnadhim/form/MotorClaimSubmissionForm/formperma/nXVjfsaKDxhY47qlF2bXq1V9apz_ETPR2XRwjL_tFHo',
    'Other':
        'https://forms.zohopublic.eu/muhammadnadhim/form/InsuranceClaimSubmissionForm/formperma/h99MHR6XPDvUYvNJA8QOQI3WnyLQAVtTGtkUSYJsAV0',
  };

  void _navigateToWebView(String title, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ClaimWebViewScreen(
          title: '$title Claim',
          url: url,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Submit a Claim'.tr,
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF1A1A1A)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Select Claim Type'.tr,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose the type of claim you want to submit'.tr,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF6B7280),
                    ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView(
                  children: [
                    ClaimCard(
                        title: 'Health Insurance'.tr,
                        subtitle: 'Medical expenses & treatments'.tr,
                        icon: Icons.health_and_safety_rounded,
                        color: const Color(0xFFEF4444),
                        backgroundColor: const Color(0xFFFEF2F2),
                        onTap: () async {
                          //_navigateToWebView('Health', _claimUrls['Health']!);

                          await launchUrl(Uri.parse('${_claimUrls['Health']}'),
                              mode: LaunchMode.externalApplication);
                        }),
                    const SizedBox(height: 16),
                    ClaimCard(
                        title: 'Motor Insurance'.tr,
                        subtitle: 'Vehicle accidents & damages'.tr,
                        icon: Icons.directions_car_rounded,
                        color: const Color(0xFF3B82F6),
                        backgroundColor: const Color(0xFFEFF6FF),
                        onTap: () async {
                          await launchUrl(Uri.parse('${_claimUrls['Motor']}'),
                              mode: LaunchMode.externalApplication);
                        }
                        // _navigateToWebView('Motor', _claimUrls['Motor']!),
                        ),
                    const SizedBox(height: 16),
                    ClaimCard(
                        title: 'Other Claims'.tr,
                        subtitle: 'Property, travel & other insurance'.tr,
                        icon: Icons.category_rounded,
                        color: const Color(0xFF10B981),
                        backgroundColor: const Color(0xFFF0FDF4),
                        onTap: () {
                          launchUrl(Uri.parse('${_claimUrls['Other']}'),
                              mode: LaunchMode.externalApplication);
                        }
                        // _navigateToWebView('Other', _claimUrls['Other']!),
                        ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.blue[600],
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Have all required documents ready before submitting your claim'
                            .tr,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color(0xFF374151),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClaimCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onTap;

  const ClaimCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE5E7EB)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF6B7280),
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClaimWebViewScreen extends StatefulWidget {
  final String title;
  final String url;

  const ClaimWebViewScreen({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<ClaimWebViewScreen> createState() => _ClaimWebViewScreenState();
}

class _ClaimWebViewScreenState extends State<ClaimWebViewScreen> {
  bool _isLoading = true;
  InAppWebViewController? _webViewController;

  static const String _viewportScript = """
    (function() {
      var existingMeta = document.querySelector('meta[name=viewport]');
      if (existingMeta) existingMeta.remove();
      var meta = document.createElement('meta');
      meta.name = 'viewport';
      meta.content = 'width=device-width, initial-scale=1, maximum-scale=1, user-scalable=yes, shrink-to-fit=no';
      document.head.appendChild(meta);

      var body = document.body;
      var html = document.documentElement;
      body.style.transform = 'scale(1)';
      body.style.transformOrigin = 'top left';
      body.style.width = '100%';
      if (!CSS.supports('transform', 'scale(1)')) {
        body.style.zoom = '1';
        body.style.width = 'auto';
      }
      body.style.margin = '0';
      body.style.padding = '0';
      body.style.overflowX = 'hidden';
      html.style.overflowX = 'hidden';
      html.style.margin = '0';
      html.style.padding = '0';
    })();
  """;

  static const String _scaleScript = """
    (function() {
      if (!document.body.style.transform && !document.body.style.zoom) {
        document.body.style.transform = 'scale(1)';
        document.body.style.transformOrigin = 'top left';
        document.body.style.width = '100%';
        document.body.style.overflowX = 'hidden';
        document.documentElement.style.overflowX = 'hidden';
      }
    })();
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF1A1A1A)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => _webViewController?.reload(),
          ),
        ],
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                javaScriptEnabled: true,
                mediaPlaybackRequiresUserGesture: false,
                useOnLoadResource: true,
                useShouldOverrideUrlLoading: true,
              ),
              android: AndroidInAppWebViewOptions(
                useHybridComposition: true,
                domStorageEnabled: true,
                databaseEnabled: true,
              ),
              ios: IOSInAppWebViewOptions(
                allowsInlineMediaPlayback: true,
              ),
            ),
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onLoadStart: (controller, url) {
              setState(() {
                _isLoading = true;
              });
            },
            onLoadStop: (controller, url) async {
              setState(() {
                _isLoading = false;
              });

              try {
                await controller.evaluateJavascript(source: _viewportScript);

                await Future.delayed(const Duration(milliseconds: 500));
                await controller.evaluateJavascript(source: _scaleScript);
              } catch (e) {
                debugPrint('JavaScript execution error: $e');
              }
            },
            onLoadError: (controller, url, code, message) {
              setState(() {
                _isLoading = false;
              });
              debugPrint('WebView load error: $message');
            },
            androidOnPermissionRequest: (controller, origin, resources) async {
              return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT,
              );
            },
          ),
          if (_isLoading)
            Container(
              color: Colors.white,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF3B82F6)),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Loading claim form...',
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
