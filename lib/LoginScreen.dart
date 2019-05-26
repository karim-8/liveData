import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_data/HomePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {


  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

        onPressed: () {
          //Hide keyboard
          FocusScope.of(context).requestFocus(new FocusNode());
          //HomePage
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );

        },
        child: Text("Login",

            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "images/images02.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
















//  final _usernameController = TextEditingController();
//  final _passwordController = TextEditingController();
//  final _passwordFocusNode = FocusNode();
//  final _usernameFocusNode = FocusNode();
//
//  bool _switchValue = false;
//
//  @override
//  Widget build(BuildContext context) {
//    // fixme code review large method
//    final logo = Padding(
//        padding: EdgeInsets.only(bottom: 80.0),
//        child: Hero(
//          tag: 'hero',
//          child: CircleAvatar(
//            backgroundColor: Colors.transparent,
//            radius: 70.0,
//            child: Image.asset("images/image01.png"),
//          ),
//        ));
//
//    final userName = Container(
//        margin: EdgeInsets.only(left: 20.0, right: 20.0),
//        decoration: BoxDecoration(
//            border: Border(
//                bottom: BorderSide(
//                    color: Colors.blue, width: 2, style: BorderStyle.solid))),
//        child: TextFormField(
//            focusNode: _usernameFocusNode,
//            onFieldSubmitted: (String) =>
//                FocusScope.of(context).requestFocus(_usernameFocusNode),
//            controller: _usernameController,
//            // maxLength: 20,
//            maxLines: 2,
//            enabled: true,
//            decoration: InputDecoration.collapsed(
//              hintStyle: TextStyle(fontSize: 20.0),
//              hintText: "UserName",
//            )));
//
//    final password = Container(
//        margin: EdgeInsets.only(left: 20.0, right: 20.0),
//        decoration: BoxDecoration(
//            border: Border(
//                bottom: BorderSide(
//                    color: Colors.blue, width: 2, style: BorderStyle.solid))),
//        child: TextFormField(
//            enabled: true,
//            focusNode: _passwordFocusNode,
//            obscureText: true,
//            onFieldSubmitted: (String) =>
//                FocusScope.of(context).requestFocus(_passwordFocusNode),
//            controller: _passwordController,
//            maxLines: 2,
//            decoration: InputDecoration.collapsed(
//              hintStyle: TextStyle(fontSize: 20.0),
//              hintText: "Password",
//            )));
//
//    Widget loginButton() {
//      return Container(
//          margin: EdgeInsets.only(left: 23.0, right: 23.0, top: 20),
//          child: ButtonTheme(
//            minWidth: 200.0,
//            height: 55.0,
//            child: RaisedButton(
//              color: Colors.blue,
//              onPressed: () {
//                FocusScope.of(context).requestFocus(new FocusNode());
//
//                onLoginSuccess();
//              },
//              child: Text(
//                "Login",
//                style: TextStyle(fontSize: 20, color: Colors.white),
//              ),
//            ),
//          ));
//    }
//
//    final rememberMe = Container(
//        margin: EdgeInsets.only(left: 20.0, right: 20.0),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            GestureDetector(
//              onTap: () => setState(() {
//                _switchValue = !_switchValue;
//                //todo: Remember user data
//                //setRememberMe();
//              }),
//              child: new Image.asset(
//                !_switchValue ? "images/empty_check.png" : "images/fill_check.png",
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.only(left: 5.0, right: 5.0),
//              child: GestureDetector(
//                child: Text(
//                  "Remember Me"),
//                 // style: Styles.LABEL_TEXT_STYLE,
//                onTap: () => setState(() {
//                  _switchValue = !_switchValue;
//                 //todo: Remember user data
//                 // setRememberMe();
//                }),
//              )),
//          ],
//        ));
//
////    final forgotLabel = GestureDetector(
//////        onTap: () {
//////          Navigator.push(context,
//////              MaterialPageRoute(builder: (context) => ForgetPassword()));
//////        },
////        child: Padding(
////          padding: const EdgeInsets.only(left: 23, top: 20),
////          child: Text(
////            Strings.loginForgetPassword(),
////            style: TextStyle(
////              fontSize: 16.0,
////              fontStyle: FontStyle.normal,
////              color: DARK_BLACK,
////              decoration: TextDecoration.underline,
////            ),
////          ),
////        ));
//
////    final createAccount = GestureDetector(
////        onTap: () {
////          Navigator.push(context,
////              MaterialPageRoute(builder: (context) => CreateAccounAs()));
////        },
////        child: Padding(
////          padding: const EdgeInsets.only(right: 23, top: 20),
////          child: Text(
////            Strings.loginCreateAccount(),
////            style: TextStyle(
////              fontSize: 16.0,
////              fontStyle: FontStyle.normal,
////              color: DARK_BLACK,
////              decoration: TextDecoration.underline,
////            ),
////          ),
////        ));
//
////    final lastRow = Row(
////      mainAxisAlignment: MainAxisAlignment.spaceBetween,
////      children: <Widget>[forgotLabel, createAccount],
////    );
//
//    return GestureDetector(
//      onTap: () {
//        FocusScope.of(context).requestFocus(new FocusNode());
//      },
//      child: Container(
//        decoration: BoxDecoration(
//          color: Colors.white,
////          image: DecorationImage(
////
////            image: AssetImage(APP_BACKGROUND),
////            fit: BoxFit.cover,
////          ),
//        ),
//        child: Center(
//          child: ListView(
//            shrinkWrap: true,
//            padding: EdgeInsets.only(left: 15.0, right: 15.0),
//            children: <Widget>[
//              SizedBox(height: 30.0),
//              logo,
//              SizedBox(height: 30.0),
//              userName,
//              SizedBox(height: 20.0),
//              password,
//              SizedBox(height: 15.0),
//              rememberMe,
//              SizedBox(height: 25.0),
//              loginButton(),
//              SizedBox(height: 25.0),
//              //lastRow
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
////  void setRememberMe() {
////    if (_switchValue) {
////      SharedPreference.setUsername(_usernameController.text.trim());
////      SharedPreference.setPassword(_passwordController.text.trim());
////      SharedPreference.setRememberMe(true);
////    } else {
////      SharedPreference.setUsername('');
////      SharedPreference.setPassword('');
////      SharedPreference.setRememberMe(false);
////    }
////  }
//
//  @override
//  void initState() {
//    super.initState();
//
////    if (SharedPreference.remember) {
////      _usernameController.text = SharedPreference.username;
////      _passwordController.text = SharedPreference.pass;
////      _switchValue = SharedPreference.remember;
////    }
//  }
//
//
//
//  void onLoginSuccess() {
////    Navigator.push(
////      context,
////      MaterialPageRoute(builder: (context) => HomePage()),
////    );
//  }
//
//  @override
//  void onSuccess(String msg) {}
//
//  @override
//  void dispose() {
//    //  loginBloc.dispose();
//    super.dispose();
//  }
//
//  //checking input validation
//
////  void isValidInputs() {
////    if (_usernameController.text.length > 0 &&
////        _passwordController.text.length > 0) {
////      showLoadingDialog();
////      setRememberMe();
////      _login(_usernameController.text, _passwordController.text);
////    } else {
////      showSnack(Strings.enterUserNamePass());
////    }
////  }
//
////  _login(String email, String password) {
////    endPoint
////        .setMethodType(RequestType.post)
////        .setNeedAuth(false)
////        .callStreamRequest(
////        API.jmtLogin,
////        json.encode({
////          'UserName': email,
////          'Password': password,
////          'fcmID': 'aasdasd',
////          'logoutFromAllSession': '1',
////        }),
////            (json) => UserModel.fromJson(json),
////        function: DEFAULT_API_FUNCTION)
////        .then((stream) {
////      stream.listen((data) => _handleLoginSuccess(data));
////    });
////  }
//
////  _handleLoginSuccess(UserModel user) async {
////    await hideDialog();
////
////    //PATIENT
////    if (validateResponceStatus(user.status)) {
////      AppConfig.shared.setUserData(user);
////      SharedPreference.setIsLogin(true);
////      if (user.rocketData == null) {
////        showSnack("Error Retriving rocket chat Login Data ");
////      } else {
////        Channels.loginForRocketChat(user.rocketData);
////      }
////      if (user.dataObject.AccessProfile == "0" &&
////          user.dataObject.UserType == "doctor") {
////        Navigator.push(
////          context,
////          MaterialPageRoute(builder: (context) => DoctorInformation()),
////        );
////      } else if (user.dataObject.AccessProfile == "0" &&
////          user.dataObject.UserType == "patient") {
////        Navigator.push(
////          context,
////          MaterialPageRoute(builder: (context) => PatientInformation()),
////        );
////      } else {
////
////        Navigator.pushReplacement(
////          context,
////          MaterialPageRoute(builder: (context) => HomePage()),
////        );
////      }
////    } else {
////      showSnack(user.mSG);
////    }
////  }
//
//  @override
//  Widget getAppbar() {
//    // TODO: implement getAppbar
//    return null;
//  }

}
