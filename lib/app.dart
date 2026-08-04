import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:propertify/l10n/app_localizations.dart';
import 'features/home/bloc/home_bloc.dart';

import 'bloc_injectors.dart';
import 'core/app_theme.dart';
import 'utils/app_routing/app_navigations.dart';
import 'utils/screen_config.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await ScreenUtil.ensureScreenSize();
      ScreenUtil.init(context);
      ScreenConfig.initiaLize(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocInjectors,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'PROPERTIFY',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routerConfig: router,
            locale: state.locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('hi'), // Hindi
              Locale('te'), // Telugu
            ],
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
