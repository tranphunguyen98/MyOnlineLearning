import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_online_learning/data/model/courses_bookmark.dart';
import 'package:my_online_learning/data/model/courses_download.dart';
import 'package:my_online_learning/data/model/my_courses.dart';
import 'package:my_online_learning/data/model/search_history.dart';
import 'package:my_online_learning/data/model/theme_setting.dart';
import 'package:my_online_learning/data/repository/authentication/authentication_data_source.dart';
import 'package:my_online_learning/data/repository/authentication/authentication_repository_impl.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/presentation/screen/others/splash/sc_splash.dart';
import 'package:my_online_learning/presentation/screen/router.dart';
import 'package:provider/provider.dart';

import 'data/model/search_result_model.dart';
import 'data/model/user_model.dart';
import 'data/repository/authentication/i_authentication_repository.dart';
import 'data/repository/user/i_user_repository.dart';
import 'utils/app_localizations.dart';

void main() async {
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const bool isThemeLight = false;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeSetting>(create: (_) => ThemeSetting()),
        ChangeNotifierProvider<UserModel>(create: (_) => UserModel()),
        ChangeNotifierProvider<CoursesDownload>(
            create: (_) => CoursesDownload()),
        ChangeNotifierProvider<CoursesBookmark>(
            create: (_) => CoursesBookmark()),
        ChangeNotifierProvider<MyCourses>(create: (_) => MyCourses()),
        ChangeNotifierProvider<SearchHistory>(create: (_) => SearchHistory()),
        ChangeNotifierProvider<SearchResultModel>(
            create: (_) => SearchResultModel()),
        Provider<AuthenticationDataSource>(
          create: (_) => getIt<AuthenticationDataSource>(),
        ),
        ProxyProvider<AuthenticationDataSource, IAuthenticationRepository>(
            update: (_, _authenticationDataSource, __) =>
                AuthenticationRepositoryImplement(_authenticationDataSource)),
        Provider<IUserRepository>(
          create: (_) => getIt<IUserRepository>(),
        ),
      ],
      child: Consumer<ThemeSetting>(
        builder: (context, themeSetting, child) => MaterialApp(
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
          theme: themeSetting.isLightTheme ? themeLight : themeDark,
          //initialRoute: MyRouter.SPLASH,
          onGenerateRoute: MyRouter.generateRoute,
          home: SplashScreen(),
        ),
      ),
    );
  }

  ThemeData themeLight = ThemeData.light().copyWith(
    primaryColor: const Color(0xff42a5f5),
    primaryColorDark: const Color(0xffafc2cb),
    primaryColorLight: const Color(0xffffffff),
    cardColor: const Color(0xffafc2cb),
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
    cardColor: const Color(0xff20252B),
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
