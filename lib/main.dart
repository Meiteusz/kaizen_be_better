import 'package:flutter/material.dart';
import 'package:kaizen_be_better/utils/app_routes.dart';

import 'layout/kaizen_theme.dart';

void main() {
  runApp(const AppKaizenBeBetter());
}

class AppKaizenBeBetter extends StatelessWidget {
  const AppKaizenBeBetter({super.key});

  @override
  Widget build(BuildContext context) {
    return Localizations(locale: const Locale('pt', 'BR'), delegates: const <LocalizationsDelegate<dynamic>>[
      DefaultWidgetsLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaizen: Be Better',
      theme: KaizenTheme.theme(),
      onGenerateRoute: AppRoutes.OnGenerateRoute,
    ));
  }
}