import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:metropay_test/utilities/constants.dart';
import 'package:metropay_test/services/auth.dart';
import 'package:metropay_test/utilities/loading.dart';
import 'package:toast/toast.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
// final mobileNoController = TextEditingController();
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
  String eMail = '';
  String passWord = '';
  String error= '';

//String emailId,userName,/*passWord,*/confirmPassword;

//  Widget _buildNameTF() {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Text(
//          'Name',
//          style: kLabelStyle,
//        ),
//        SizedBox(height: 10.0),
//        Container(
//          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
//          height: 60.0,
//          child: TextField(
//            // controller: usernameController,
//            keyboardType: TextInputType.text,
//            onChanged: (Text){
//              userName = Text;
//            },
//            style: TextStyle(
//              color: Colors.white,
//              fontFamily: 'OpenSans',
//            ),
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              contentPadding: EdgeInsets.only(top: 14.0),
//              prefixIcon: Icon(
//                Icons.person,
//                color: Colors.white,
//              ),
//              hintText: 'Enter your Name',
//              hintStyle: kHintTextStyle,
//            ),
//          ),
//        ),
//      ],
//    );
//  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Form(
          key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children : <Widget>[
            Text(
              'Email',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
//          key: _formKey,
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (val) => val.isEmpty ? 'Enter an email' : null,
            onChanged: (val){
              setState(() => eMail = val);
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.alternate_email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
            SizedBox(height: 30.0),
            Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
//          key: _formKey,
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
            // controller: passwordController,
            obscureText: true,
            onChanged: (val){
              setState(() => passWord = val);
            },
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
    ]
        )
    )
      ],
    );
  }

//  Widget _buildMobileNumberTF() {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Text(
//          'Mobile Number',
//          style: kLabelStyle,
//        ),
//        SizedBox(height: 10.0),
//        Container(
//          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
//          height: 60.0,
//          child: TextField(
//            controller: mobileNoController,
//            keyboardType: TextInputType.phone,
//            style: TextStyle(
//              color: Colors.white,
//              fontFamily: 'OpenSans',
//            ),
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              contentPadding: EdgeInsets.only(top: 14.0),
//              prefixIcon: Icon(
//                Icons.phone,
//                color: Colors.white,
//              ),
//              hintText: 'Enter your Mobile Number',
//              hintStyle: kHintTextStyle,
//            ),
//          ),
//        ),
//      ],
//    );
//  }

//  Widget _buildPasswordTF() {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Text(
//          'Password',
//          style: kLabelStyle,
//        ),
//        SizedBox(height: 10.0),
//        Container(
//          key: _formKey,
//          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
//          height: 60.0,
//          child: TextFormField(
//            validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
//            // controller: passwordController,
//            obscureText: true,
//            onChanged: (val){
//              setState(() => passWord = val);
//            },
//            style: TextStyle(
//              color: Colors.white,
//              fontFamily: 'OpenSans',
//            ),
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              contentPadding: EdgeInsets.only(top: 14.0),
//              prefixIcon: Icon(
//                Icons.vpn_key,
//                color: Colors.white,
//              ),
//              hintText: 'Enter your Password',
//              hintStyle: kHintTextStyle,
//            ),
//          ),
//        ),
//      ],
//    );
//  }

//  Widget _buildConfirmPasswordTF() {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Text(
//          'Confirm Password',
//          style: kLabelStyle,
//        ),
//        SizedBox(height: 10.0),
//        Container(
//
//          alignment: Alignment.centerLeft,
//          decoration: kBoxDecorationStyle,
//          height: 60.0,
//          child: TextField(
//            // controller: confirmPasswordController,
//            onChanged: (Text){
//              confirmPassword = Text;
//            },
//            obscureText: true,
//            style: TextStyle(
//              color: Colors.white,
//              fontFamily: 'OpenSans',
//            ),
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              contentPadding: EdgeInsets.only(top: 14.0),
//              prefixIcon: Icon(
//                Icons.vpn_key,
//                color: Colors.white,
//              ),
//              hintText: 'Confirm your Password',
//              hintStyle: kHintTextStyle,
//            ),
//          ),
//        ),
//      ],
//    );
//  }

  Widget _buildSignupBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 4.0,
          onPressed: () async{
            if(_formKey.currentState.validate()){
              setState(() => loading = true);
              dynamic result = await _auth.registerWithEmailAndPassword(eMail, passWord);
              Navigator.pop(
              context,
            );
              if(result == null) {
                setState(() {
                  loading = false;
                  error = 'Please enter a valid email';
                  Toast.show(error, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                });
              }
            }
          },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
//        color: Colors.white,
        child: Text(
          'SIGNUP',
          style: TextStyle(
//            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
//                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 140.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'MetroPay',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
//                      SizedBox(height: 25.0),
//                      _buildNameTF(),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
//                      SizedBox(height: 25.0),
//                      _buildMobileNumberTF(),
//                      SizedBox(height: 30.0),
//                      _buildPasswordTF(),
//                      SizedBox(height: 25.0),
//                      _buildConfirmPasswordTF(),
                      SizedBox(height: 5.0),
                      _buildSignupBtn(),
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
