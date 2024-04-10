import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import '../../../resources/constants/color.dart';
import '../../../resources/constants/constants.dart';
import '../../../resources/constants/theming.dart';
import '../../../routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoutes _routes = AppRoutes();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.transparent,
    ));
    return MaterialApp(
      localizationsDelegates:  const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: S.delegate.supportedLocales,
      //themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      locale: const Locale("en"),
      title: Constants.appName,
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: AppColor.primarySwatch,
        inputDecorationTheme: Theming.inputDecorationTheming,
      ),
      onGenerateRoute: _routes.onGeneratedRoutes,
      initialRoute:"/",
      navigatorKey: GlobalKey<NavigatorState>(),
    );
  }
}
