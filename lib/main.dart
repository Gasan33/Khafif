import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khafif/Languages/languages.dart';
import 'package:khafif/Views/item_details_screen.dart';

import 'package:khafif/Views/maps_screen.dart';
import 'package:khafif/Views/onBoarding_Screens.dart';
import 'package:khafif/Views/splash_screen.dart';
import 'package:khafif/Views/tracking_order_screen.dart';

void main() {
  // WidgetsFlutterBinding();
  runApp(const MyApp(
      // appRouter: AppRouter(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // const MyApp({super.key, required this.appRouter});

  // final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocale.delegete,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("ar"), Locale("en")],
      // onGenerateRoute: appRouter.genrateRoute,
      locale: Locale("en"),
      home: SplashScreen(),
    );
  }
}

class TestClass extends StatefulWidget {
  const TestClass({super.key});

  @override
  State<TestClass> createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("${AppLocale.of(context).getTranslated("loginLabel")}"),
            Text("${AppLocale.of(context).getTranslated("onBoardingTitle")}"),
            Text(
                "${AppLocale.of(context).getTranslated("onBoardingSubTitle")}"),
          ],
        ),
      ),
    );
  }
}
