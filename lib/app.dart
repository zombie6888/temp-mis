import 'package:flutter/material.dart';
import 'package:mis/ui_utils.dart';
import 'package:mis/utils/screen_utils.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'api/api_config.dart';
import 'bootstrap.dart';
import 'navigation/router.dart';
import 'navigation/routes.dart';
import 'utils/logger.dart';

class App extends StatelessWidget {
  final SharedPreferences prefs;
  const App({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bootstrap(
      prefs: prefs,
      child: Builder(builder: (context) {
        final router = Provider.of<CustomRouter>(context);
        return MaterialApp.router(
          color: Colors.white,
          themeMode: ThemeMode.light,
          builder: (ctx, child) {
           // final builder =
            // FlutterI18n.rootAppBuilder();
            //final chatUserLogged = Provider.of<bool>(context);
            return UiUtils(child: child);
          },
          localizationsDelegates: [
            FlutterI18nDelegate(
              translationLoader: FileTranslationLoader(
                  basePath: 'assets/locales',
                  fallbackFile: 'ru',
                  forcedLocale: const Locale('ru', 'RU')),
              missingTranslationHandler: (key, locale) {
                logger.w(
                    "--- Missing Key: $key, languageCode: ${locale?.languageCode}");
              },
            ),
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const [Locale('en', 'EN'), Locale('ru', 'RU')],
          routerDelegate: CustomRouterDelegate(
              router: router,
              // transitionDelegate: const AlwaysAnimatedTransitionDelegate(),
              observers: [Provider.of<CustomRouter>(context).observer],
              routesBuilder: (context) {
                final config = Provider.of<ApiConfig>(context);//context.read<ApiConfig>();
                //if(config.isAuthorized()) {
                  return routes(context);
                //} else {
                //  return loggedOutMap;
                //}                
              }),
          routeInformationParser: const RoutemasterParser(),
        );
      }),
    );
  }
}