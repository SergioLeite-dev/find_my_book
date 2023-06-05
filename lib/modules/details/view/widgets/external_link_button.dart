import 'package:find_my_book/services/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExternalLinkButton extends StatelessWidget {
  const ExternalLinkButton(
    this.id, {
    super.key,
  });

  final String id;
  static const double height = 50;
  static const double radius = 30;
  static const double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {
          UrlLauncher.launch(id);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)?.purchase ?? "Purchase from Google Books",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.arrow_outward,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
