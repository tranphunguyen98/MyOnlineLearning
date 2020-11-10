import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_online_learning/presentation/screen/home_page.dart';
import 'package:my_online_learning/presentation/screen/router.dart';

import 'utils/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const bool isThemeLight = false;
    return
        // ValueListenableBuilder(
        // valueListenable: SettingsStore.of(context).theme,
        // builder: (context, ThemeData theme, child) =>
        MaterialApp(
            supportedLocales: const [
          Locale('en', 'US'),
          Locale('vi', 'VN'),
        ],
            localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (final supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode &&
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            title: 'Online Learning',
            // themeMode: ThemeMode.light,
            theme: isThemeLight ? themeLight : themeDark,
            initialRoute: MyRouter.HOME_PAGE,
            onGenerateRoute: MyRouter.generateRoute,
            home: HomePage());
    // );
  }

  ThemeData themeLight = ThemeData.light().copyWith(
    primaryColor: const Color(0xffe1f5fe),
    primaryColorDark: const Color(0xffafc2cb),
    accentColor: const Color(0xffffc107),
    backgroundColor: const Color(0xffffffff),
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText2: ThemeData.light().textTheme.bodyText2.copyWith(
                color: Colors.black54,
              ),
          caption: ThemeData.light().textTheme.caption.copyWith(
                color: Colors.black54,
              ),
        ),
  );

  ThemeData themeDark = ThemeData.dark().copyWith(
    primaryColor: const Color(0xff20252B),
    primaryColorDark: const Color(0xff181b20),
    primaryColorLight: const Color(0xff3e4247),
    accentColor: const Color(0xff2196f3),
    backgroundColor: const Color(0xff121212),
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyText2: ThemeData.dark().textTheme.bodyText2.copyWith(
                color: Colors.white60,
              ),
          caption: ThemeData.light().textTheme.caption.copyWith(
                color: Colors.white60,
              ),
        ),
  );
}
