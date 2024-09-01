import 'package:dashboard/Core/utils/service_locator.dart';
import 'package:dashboard/Featuers/LOGIN/data/repos/login_repo_impl.dart';
import 'package:flutter/material.dart';

import 'Core/utils/app_router.dart';
import 'constants.dart';

void main() {
  setupServiceLocator(); 
  print('we are in the main');
  
  runApp(const DashBoard());
}

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
    );
  }
  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(kprimecolor),
              foregroundColor: MaterialStatePropertyAll(kprimecolor),
              shadowColor: MaterialStatePropertyAll(kprimecolor))),
      primaryColor: kprimecolor,
      scaffoldBackgroundColor: kPrimaryColor,
      inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: kprimecolor,
        fillColor: kprimecolor,
        iconColor: kprimecolor,
        focusColor: kprimecolor,
        hoverColor: kprimecolor,
        suffixIconColor: kprimecolor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  kprimecolor), // Color of the border when TextFormField is focused
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: kprimecolor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: kprimecolor, iconColor: kprimecolor)),
      iconTheme: const IconThemeData(
        color: kprimecolor, // setting the default icon color
      ),
      primaryIconTheme: const IconThemeData(
        color: kprimecolor, // setting the default primary icon color
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: kprimecolor, // Set your desired color here
      ),
    );
  }
}
