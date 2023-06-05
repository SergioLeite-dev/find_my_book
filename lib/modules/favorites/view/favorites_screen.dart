import 'package:find_my_book/modules/shared/widgets/items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  static const routeName = "/favorites";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)?.yfavorites ?? "Your Favorites")),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: ItemsListView.favorites(),
      ),
    );
  }
}
