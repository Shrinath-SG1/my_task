import 'package:flutter/material.dart';

final _emailKey = GlobalKey<FormFieldState>();
final _passwordKey = GlobalKey<FormFieldState>();
enum mode { signUp, signIn }

class SignUpSignInContainer extends StatefulWidget {
  @override
  _SignUpSignInContainerState createState() => _SignUpSignInContainerState();
}

class _SignUpSignInContainerState extends State<SignUpSignInContainer> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _currentMode = mode.signIn;
    Size size = MediaQuery.of(context).size;
    Widget _formField() {
      var height = size.height;
      var width = size.width;
      return Form(
        // key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: width < 600 ? null : height * 0.055,
              width: width < 600 ? width * 0.85 : width * 0.7,
              decoration: BoxDecoration(
                color: Colors.brown[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                key: _emailKey,
                onChanged: (value) {
                  _emailKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Email';
                  }
                  return null;
                },
                controller: emailController,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: width < 600 ? width * 0.04 : width * 0.02,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: width < 600 ? null : height * 0.055,
              width: width < 600 ? width * 0.85 : width * 0.7,
              decoration: BoxDecoration(
                color: Colors.brown[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                key: _passwordKey,
                onChanged: (value) {
                  _passwordKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },
                controller: passwordController,
                style: TextStyle(color: Colors.white),
                // obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(
                      fontSize: width < 600 ? width * 0.04 : width * 0.02,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w600),
                ),
              )
            ])
          ],
        ),
      );
    }

    return Container(
      //color: Colors.green,
      height: size.height * 0.60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              _currentMode == mode.signIn ? 'Sign In' : 'Sign Up',
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
          ),
          _formField(),
          FlatButton(
              minWidth: size.width * 0.35,
              height: size.height * 0.058,
              color: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                if (_currentMode == mode.signIn) {
                } else {}
              },
              child: Text(
                (_currentMode == mode.signIn ? "Sign In" : 'Sign Up'),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.white),
              )),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 15, right: 20),
                  width: size.width * 0.20,
                  child: Divider(
                    thickness: 2,
                    height: 4,
                  )),
              Text(
                  _currentMode == mode.signIn
                      ? 'Or Sign In With'
                      : 'Or Sign Up With',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 20),
                  width: size.width * 0.20,
                  child: Divider(
                    thickness: 3,
                  )),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              onTap: () {},
              child: Image.network(
                'https://www.pngkit.com/png/full/178-1783296_g-transparent-circle-google-logo.png',
                height: size.height * 0.08,
                width: size.width * 0.13,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image.network(
                'https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png',
                height: size.height * 0.08,
                width: size.width * 0.20,
              ),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Don' + 't' + ' Have An Account?',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            TextButton(
                onPressed: () {

                },
                child: Text(
                  _currentMode == mode.signIn ? ' Sign Up' : 'Sign In',
                  style: TextStyle(
                      color: Colors.amber[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ))
          ]),
          SizedBox(
            height: size.height * 0.01,
          )
        ],
      ),
    );
  }
}
