import 'package:project2/core/themes/theme_helper.dart';
import 'package:project2/core/utils/exports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageBloc()..add(LoadLanguageEvent())),
        BlocProvider(create: (_) => SplashBloc()..add(SplashLoadingEvent())),
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => DetailBloc()),
        BlocProvider(create: (_) => SearchBloc()),
        // BlocProvider(create: (_) => SearchBloc()..add(LoadSearchData())),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_,child){
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'ANIME',
                theme: MyAppThemeHelper.darkTheme,
                themeMode: ThemeMode.light,
                home: SplashScreen(),
                routes: AppRouter.routes,
                initialRoute: AppRouter.initialRoute,
                locale: state.locale,
                supportedLocales: const [
                  Locale('en'), // English
                ],
                localizationsDelegates: localizationDelegates,
              );
            },
          );
        },
      ),
    );
  }
}
