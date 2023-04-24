import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future launch(String id) async {
    final Uri uri = Uri.https("play.google.com", "/store/books/details", {"id": id});
    //print(uri);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw UnsupportedError("Cannot launch url");
    }
  }
}
