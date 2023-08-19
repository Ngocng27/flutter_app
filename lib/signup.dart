import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home_page.dart';
import 'main.dart'; // Import your main.dart for MyApp.setLocale
import 'translations.dart'; // Import the AppLocalizations class

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String _passwordErrorText = '';
  String _confirmPasswordErrorText = '';

  bool _isPasswordValid = false;
  bool _isConfirmPasswordValid = false;

  // Function to check if the password meets the requirements
  bool _isPasswordValidated(String value) {
    // Password must contain at least 8 characters, 1 number, and 1 uppercase letter
    String pattern = r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  // Function to check if the confirm password matches the new password
  bool _isConfirmPasswordValidated(String value) {
    return value == _passwordController.text;
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
            fontWeight: FontWeight.bold,
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
                offset: Offset(0, 2),
              )
            ],
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff5ac18e),
              ),
              hintText: AppLocalizations.of(context)?.translate('email') ?? 'Email',
              hintStyle: TextStyle(color: Colors.black38),
            ),
          ),
        )
      ],
    );
  }

  // Rest of your code...

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)?.translate('password') ?? 'New Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
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
                offset: Offset(0, 2),
              )
            ],
          ),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            controller: _passwordController, // Set the controller
            onChanged: (value) {
              setState(() {
                _isPasswordValid = _isPasswordValidated(value);
                _passwordErrorText = '';
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff5ac18e),
              ),
              hintText: AppLocalizations.of(context)?.translate('password') ?? 'New Password',
              hintStyle: TextStyle(color: Colors.black38),
            ),
          ),
        ),
        Visibility(
          visible: _passwordErrorText.isNotEmpty,
          child: Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              _passwordErrorText,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNewPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)?.translate('confirm_new_password') ?? 'Confirm New Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
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
                offset: Offset(0, 2),
              )
            ],
          ),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            controller: _confirmPasswordController, // Set the controller
            onChanged: (value) {
              setState(() {
                _isConfirmPasswordValid = _isConfirmPasswordValidated(value);
                _confirmPasswordErrorText = '';
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff5ac18e),
              ),
              hintText: AppLocalizations.of(context)?.translate('confirm_new_password') ?? 'Confirm New Password',
              hintStyle: TextStyle(color: Colors.black38),
            ),
          ),
        ),
        Visibility(
          visible: _confirmPasswordErrorText.isNotEmpty,
          child: Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              _confirmPasswordErrorText,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
  
  @override
  // Rest of your code...


  Widget buildCreateAccBtn() {
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
        onPressed: () {
          // Check if both password and confirm password are valid
          _isPasswordValid = _isPasswordValidated(_passwordController.text);
          _isConfirmPasswordValid = _passwordController.text == _confirmPasswordController.text;

          if (_isPasswordValid && _isConfirmPasswordValid) {
            // Password validation passed, navigate to the home page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            // Password validation failed, update error messages
            setState(() {
              _passwordErrorText = !_isPasswordValid
                  ? AppLocalizations.of(context)?.translate('password_validation_message') ??
                      'Password must contain at least 8 characters, 1 number, and 1 uppercase letter'
                  : '';
              _confirmPasswordErrorText = !_isConfirmPasswordValid
                  ? AppLocalizations.of(context)?.translate('confirm_password_validation_message') ??
                      'Confirm password must match the new password'
                  : '';
            });
          }
        },
        child: Text(
          AppLocalizations.of(context)?.translate('create_account') ?? 'CREATE AN ACCOUNT',
          style: TextStyle(
            color:             Color(0xff5ac18e),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Color(0xFFB2EBF2),
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
                        AppLocalizations.of(context)?.translate('sign_up') ?? 'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      SizedBox(height: 10),
                      buildNewPassword(),
                      SizedBox(height: 10),
                      buildCreateAccBtn(),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Navigate back to the previous screen (LoginScreen)
                        },
                        child: Text(AppLocalizations.of(context)?.translate('go_back_to_login') ?? 'Go back to Login'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

