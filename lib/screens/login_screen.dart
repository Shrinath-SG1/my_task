import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task/widgets/signup_signIn_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
          height: size.height * 0.60,
          width: size.width,
          decoration: new BoxDecoration(
            color: const Color(0xff7c94b6),
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/bg.jpg',
              ),
            ),
          ),
        ),
        SafeArea(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Center(
                  child: Column(children: [
                    Container(
                      alignment: Alignment.topLeft,
                      height: size.height * 0.40,
                      child: Padding(
                        padding: EdgeInsets.only(top: 100, left: 20),
                        child: Text(
                          'Welcome!!',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    SignUpSignInContainer(),
                  ]),
                ),
              )),
        ),
      ],
    );
  }
}
