import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project2/core/api_config/client/api_client.dart';
import 'package:project2/core/constants/app_constants.dart';
import 'package:project2/core/routes/app_router.dart';
import 'package:project2/repository/home_repository.dart';
import 'package:project2/viewmodel/detail_bloc/detail_bloc.dart';
import 'package:project2/viewmodel/language_bloc/language_bloc.dart';
import 'package:project2/viewmodel/language_bloc/language_event.dart';
import 'package:project2/viewmodel/language_bloc/language_state.dart';
import 'package:project2/viewmodel/splash_bloc/splash_bloc.dart';
import 'package:project2/viewmodel/splash_bloc/splash_event.dart';
import 'package:project2/views/home_view/home_screen.dart';
import 'package:project2/views/splash_view/splash_screen.dart';

import '../../viewmodel/hoem_bloc/home_bloc.dart';
import '../../viewmodel/hoem_bloc/home_event.dart';
import '../l10n/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageBloc()..add(loadLanguage())),
        BlocProvider(create: (_) => HomeBloc()..add(loadHomePageData())),
        BlocProvider(create: (_) => SplashBloc()..add(splashLoading())),
        BlocProvider(create: (_) => DetailBloc()),
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
                title: 'Anime World',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: SplashScreen(),
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: AppConstants.splashRoute,
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
