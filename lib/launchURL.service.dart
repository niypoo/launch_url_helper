import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LaunchUrlHelper {
  static toUrl(String url) async {
    // Convert url to uri
    final uri = Uri.parse(url.trim().replaceAll('"', ''));

    await launchUrl(uri,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: false,
          enableDomStorage: false,
        ));
  }

  static toEmail({
    required String email,
    required String subject,
  }) async {
    // Convert  uri
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto', path: email, queryParameters: {'subject': subject});

    await launchUrl(emailLaunchUri);
  }

  static toCaller(String phone) async {
    final url = "tel:$phone";
    await launchUrlString(url);
  }

  static toWhatsapp(String phone) async {
    var whatsappUrl = "whatsapp://send?phone=$phone";
    await launchUrlString(whatsappUrl);
  }
}
