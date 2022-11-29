import 'package:flutter/material.dart';
import 'package:mis/store/app_store.dart';
import 'package:mis/utils/persist_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api_config.dart';
import 'navigation/navigation_observer.dart';
import 'navigation/router.dart';
import 'utils/configuration.dart';

class Bootstrap extends StatelessWidget {
  final Widget child;
  final SharedPreferences prefs;
  const Bootstrap({Key? key, required this.child, required this.prefs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return MultiProvider(
      providers: [     
        // Хранилище shared preferences
        Provider<PersistStore>(create: (_) => PersistStore(prefs)),
        // Кастомный роутер
        Provider<CustomRouter>(
            create: (_) => CustomRouter(NavigationObserver())),
        // Конфиг для работы с бекендом
        ChangeNotifierProvider<ApiConfig>(
            create: (_) => ApiConfig(defaultServerUrl)),
        // Формы:
      ],
      child: AppStore(child: child),
    );
  }
}
