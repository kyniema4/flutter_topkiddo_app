import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:provider/provider.dart';
import 'package:topkiddo/screens/home/designed-courses/flashcard_store.dart';
import 'package:topkiddo/screens/new_game/login_screen.dart';
import 'package:topkiddo/data_local/favorite_sentence_model.dart';
import 'package:topkiddo/data_local/lesson/unit_data_model.dart';
import 'package:topkiddo/data_local/lesson/lesson_data_model.dart';
import 'screens/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/home/modal_language.dart';
import 'screens/home/home_screen.dart';
import 'screens/home/designed-courses/flash_card_screen.dart';
import 'screens/home/designed-courses/animation_screen.dart';
import 'screens/home/designed-courses/library_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  // Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  await Hive.initFlutter();
  Hive.registerAdapter(UnitDataModelAdapter(), override: true);
  Hive.registerAdapter(LessonDataModelAdapter(), override: true);
  Hive.registerAdapter(FavoriteSentenceModelAdapter(), override: true);

  runApp(EasyLocalization(
      supportedLocales: [Locale('vi', 'VN'), Locale('en', 'US')],
      path: 'assets/translations',
      saveLocale: true,
      //startLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  //translate
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //translate
  Locale _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return ScreenUtilInit(
        designSize: Size(375, 812),
        allowFontScaling: false,
        builder: () {
          return MultiProvider(
            providers: [
              Provider(
                create: (context) => FlashCardStore(),
              )
            ],
            child: MaterialApp(
              title: 'Topkiddo App',
              debugShowCheckedModeBanner: false,

              routes: {
                // '/': (BuildContext context) => SplashScreen(),
                '/': (BuildContext context) => HomeScreen(),
                // '/': (BuildContext context) => FlashCardScreen(),
                // '/': (BuildContext context) => AnimationScreen(),
                // '/': (BuildContext context) => ModalLanguage(),
                // '/': (BuildContext context) => LibraryScreen(),
                //'/': (BuildContext context) => LoginScreen(),
              },
              //translate
              // locale: _locale,
              // supportedLocales: [Locale('en', 'US'), Locale('vi', 'VI')],
              // localizationsDelegates: [
              //   AppLocalizationsDelegate(),
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              //   GlobalCupertinoLocalizations.delegate,
              // ],
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
            ),
          );
        });
  }
}
