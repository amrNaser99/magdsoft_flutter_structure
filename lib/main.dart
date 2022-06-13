import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:magdsoft_flutter_structure/business_logic/bloc_observer.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/componands/applocale.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/themes.dart';
import 'package:sizer/sizer.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () async {
      await DioHelper.init();
      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Intl.defaultLocale = delegate.currentLocale.languageCode;

    // delegate.onLocaleChanged = (Locale value) async {
    //   try {
    //     setState(() {
    //       Intl.defaultLocale = value.languageCode;
    //     });
    //   } catch (e) {
    //     showToast(e.toString());
    //   }
    // };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => GlobalCubit()),
        ),
      ],
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  AppLocale.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                locale: BlocProvider.of<GlobalCubit>(context).checked
                    ? const Locale('ar', "")
                    : const Locale('en', ""),
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('ar', ''),
                ],
                localeResolutionCallback: (currentLang, supportLang) {
                  if (currentLang != null) {
                    for (Locale locale in supportLang) {
                      if (locale.languageCode == currentLang.languageCode) {
                        return currentLang;
                      }
                    }
                  }
                  return supportLang.first;
                },
                title: 'Magdsoft Flutter InternShip ',
                onGenerateRoute: widget.appRouter.onGenerateRoute,
                theme: appTheme,
              );
            },
          );
        },
      ),
    );
  }
}

//
// LocalizedApp(
// delegate,
// LayoutBuilder(builder: (context, constraints) {
// return MaterialApp(
// debugShowCheckedModeBanner: false,
// title: 'Werash',
// localizationsDelegates: [
// GlobalCupertinoLocalizations.delegate,
// DefaultCupertinoLocalizations.delegate,
// GlobalMaterialLocalizations.delegate,
// GlobalWidgetsLocalizations.delegate,
// delegate,
// ],
// locale: delegate.currentLocale,
// supportedLocales: delegate.supportedLocales,
// onGenerateRoute: widget.appRouter.onGenerateRoute,
// theme: ThemeData(
// fontFamily: 'cairo',
// // scaffoldBackgroundColor: AppColor.primary,
// appBarTheme: const AppBarTheme(
// elevation: 0.0,
// systemOverlayStyle: SystemUiOverlayStyle(
// statusBarColor: Colors.transparent,
// statusBarIconBrightness: Brightness.dark,
// ),
// ),
// ),
// );
// }),
// );