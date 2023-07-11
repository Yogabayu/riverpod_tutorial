import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/themes.dart';
import 'utils/routers.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod',
      theme: themeData(Themes.lightTheme),
      onGenerateRoute: Routers.generateRoute,
      initialRoute: '/',
    );
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }
}
