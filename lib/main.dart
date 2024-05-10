import 'package:flutter/material.dart';
import 'package:dtree/screens/registration_screen.dart';
import 'package:dtree/screens/home_screen.dart';
import 'package:dtree/screens/login_screen.dart';
import 'package:dtree/screens/chat_screen.dart';
import 'package:flutter/services.dart';
import 'package:dtree/widgets/app_drawer.dart';
import 'package:dtree/widgets/exit_confirmation_dialog.dart';

const Color primaryColor = Color(0xFFD83A3E);
const Color secondaryColor = Color(0xFFFDEDEE);
const Color fastColor = Color(0xFF1E2023);
const Color thirdColor = Color(0xFFFF9021);

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dtree',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomeScreen(),
        '/register': (context) => RegistrationScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Use WillPopScope to handle back button press
      onWillPop: () async {
        // Show the ExitConfirmationDialog when back button is pressed
        bool exitConfirmed = await showDialog(
          context: context,
          builder: (context) => ExitConfirmationDialog(),
        );

        return exitConfirmed; 
      },
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: AppDrawer(scaffoldKey: _scaffoldKey),
        body: HomeScreen(),
      ),
    );
  }
}
