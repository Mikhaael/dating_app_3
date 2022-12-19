import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dating_app_3/utils/designs/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/designs/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const DatingApp());
}

class DatingApp extends StatelessWidget {
  const DatingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: kPrimaryColor,
            secondary: kButtonColor,
          ),
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme.apply(
              displayColor: kTextColor1,
              bodyColor: kTextColor1,
            ).copyWith(
              button: GoogleFonts.openSans(),
            ),
          ),
        ),
        routes: Routes.routes,
      ),
    );
  }
}
