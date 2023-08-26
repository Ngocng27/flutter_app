// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Add this import for localization support
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'translations.dart';

class LoginScreen extends StatefulWidget{
  // Add a property to receive the supported locales from MyApp
  final List<Locale> supportedLocales;

  // Constructor to receive the supported locales
  LoginScreen({required this.supportedLocales});
  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
  void _changeLanguage(BuildContext context, Locale locale) {
    MyApp.setLocale(context, locale);
  }

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

}


class _LoginScreenState extends State<LoginScreen> {
  bool? isRememberMe = false;

   final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  String? _validateEmail(String? value) {
  final appLocalizations = AppLocalizations.of(context);
  if (appLocalizations != null) {
    if (value == null || value.isEmpty) {
      return appLocalizations.translate('Email is required');
    } else if (!value.endsWith('gmail.com')) {
      return appLocalizations.translate('Invalid email format (Gmail account required)');
    }
  }
  return null;
}
    

  Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        AppLocalizations.of(context)?.translate('email') ?? 'Email',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
        height: 60,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff5ac18e),
            ),
            hintText: AppLocalizations.of(context)?.translate('email')?? 'Email',
            hintStyle: TextStyle(
              color: Colors.black38
            ),
          ),
          validator: _validateEmail,
        ),
      )
    ],
  );
}

  Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        AppLocalizations.of(context)?.translate('password') ?? 'Password',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon:  Icon(
              Icons.lock,
              color: Color(0xff5ac18e)
            ),
            hintText: AppLocalizations.of(context)?.translate('password')?? 'Password',

            hintStyle: TextStyle(
              color: Colors.black38
            )
           ),
        ),
      )
    ],
  );
}


  Widget buildForgotPassBtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () => print("Forgot Password pressed"),
      style: TextButton.styleFrom(padding: EdgeInsets.only(right: 0)),
      child: Text(
        AppLocalizations.of(context)?.translate('forgot_password') ?? 'Forgot Password',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

  Widget buildRememberCb(){
  return Container(
    height: 20,
    child: Row(
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: isRememberMe,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                isRememberMe = value;
              });
            },
          ),
        ),
        Text(
            AppLocalizations.of(context)?.translate('remember_me') ?? 'Remember me',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    ),
  );
}


  Widget buildLoginBtn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        primary: Colors.white,
      ),
      onPressed: () => print('Login Pressed'),
      child: Text(
        AppLocalizations.of(context)?.translate('login') ?? 'LOGIN',
        style: TextStyle(
          color: Color(0xff5ac18e),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

/*
  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => print("Sign Up Pressed"),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500
              )
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold
              )
            )
          ]
        ),
      ),
    );
  }
*/

  
  Widget buildSignUpBtn(BuildContext context) {
  return Column(
    children: [
      Text(
        AppLocalizations.of(context)?.translate('dont_have_account') ?? 'Do not have an account?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            primary: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
          child: Text(
            AppLocalizations.of(context)!.translate('sign_up'),
            style: TextStyle(
              color: Color(0xff5ac18e),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}

 

  @override
  void _launchGmailLogin() async {
    final String gmailUrl = 'https://www.gmail.com'; // Replace with your Gmail login URL
    await launchURL(gmailUrl);
  }
   void _launchFacebookLogin() async {
  final String facebookUrl = 'https://www.facebook.com/'; // Replace with your Facebook login URL
  await launchURL(facebookUrl);
}


  void _launchLinkedInLogin() async {
    final String linkedInUrl = 'https://www.linkedin.com'; // Replace with your LinkedIn login URL
    await launchURL(linkedInUrl);
  }
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        AppLocalizations.of(context)?.translate('login_screen') ?? 'Login Screen',
      ),
      actions: <Widget>[
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu), // Hamburger icon
              onPressed: () {
                // Open the custom sidebar menu (Drawer)
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ],
    ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFB2BEF2),
                      Color(0xFF80DEEA),
                      Color(0xFF4DB6AC),
                      Color(0xFF26C69A),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)?.translate('sign_in') ??'Sign In',
                        style: TextStyle( 
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      buildForgotPassBtn(),
                      buildRememberCb(),
                      buildLoginBtn(),
                      // Add social media icons below the login button
             Padding(
              padding: EdgeInsets.symmetric(vertical: 10), // Adjust vertical spacing
              child: Text(
                "━━ OR ━━",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      // Handle the Gmail sign-in here
                launchURL('https://mail.google.com/mail'); // Replace with the Gmail login URL

                    },
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      size: 36,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      // Handle the Facebook sign-in here
                   launchURL('https://www.facebook.com'); // Replace with the LinkedIn login URL

                    },
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 36,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      // Handle the LinkedIn sign-in here
                  launchURL('https://www.linkedin.com'); // Replace with the LinkedIn login URL

                    },
                    child: FaIcon(
                      FontAwesomeIcons.linkedin,
                      size: 36,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
                      buildSignUpBtn(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showLanguageDialog,
        tooltip: 'Change Language',
        child: Icon(Icons.language),
      ),
    );
  }
  
  // Method to show the language selection dialog
  // Method to show the language selection dialog
  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)?.translate('change_language') ?? 'Change Language',),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Create a button for each language in the list
              for (Locale locale in widget.supportedLocales)
                ElevatedButton(
                  onPressed: () {
                    // Call the method to change the app's language using the correct context
                     _changeLanguage(context, locale);;
                    Navigator.of(context).pop();
                  },
                  child: Text(locale.languageCode.toUpperCase()),
                ),
            ],
          ),
        );
      },
    );
  }
   void _changeLanguage(BuildContext context, Locale locale) {
    MyApp.setLocale(context, locale);
  }

  // Method to change the app's language
}