import 'package:find_my_book/modules/favorites/controller/favorites_controller.dart';
import 'package:find_my_book/modules/shared/controllers/search_controller.dart';
import 'package:find_my_book/l10n/l10n.dart';
import 'package:find_my_book/services/http_client.dart';
import 'package:find_my_book/modules/favorites/view/favorites_screen.dart';
import 'package:find_my_book/modules/home/view/home_screen.dart';
import 'package:find_my_book/modules/details/view/item_details_screen.dart';
import 'package:find_my_book/modules/results/view/search_results_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(const FindMyBookApp());

class FindMyBookApp extends StatelessWidget {
  const FindMyBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ClientHttp()),
        ChangeNotifierProvider(create: (context) => SearchController(context.read())),
        ChangeNotifierProvider(create: (context) => FavoritesController())
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.teal),
        debugShowCheckedModeBanner: false,
        title: "Find My Book App",
        initialRoute: "/",
        routes: {
          "/": (context) => const HomeScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          SearchResultsScreen.routeName: (context) => const SearchResultsScreen(),
          FavoritesScreen.routeName: (context) => const FavoritesScreen(),
          ItemDetailsScreen.routeName: (context) => const ItemDetailsScreen(),
        },
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
