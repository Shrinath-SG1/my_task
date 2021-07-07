import 'package:flutter/material.dart';
final _emailKey = GlobalKey<FormFieldState>();
final _passwordKey = GlobalKey<FormFieldState>();
class SignUpSignInContainer extends StatefulWidget {
  const SignUpSignInContainer({Key? key}) : super(key: key);

  @override
  _SignUpSignInContainerState createState() => _SignUpSignInContainerState();
}

class _SignUpSignInContainerState extends State<SignUpSignInContainer> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget _formField() {
      var height = size.height;
      var width =size.width;
      return Form(
        // key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                validator: ( value) {
                  if (value==null||value.isEmpty) {
                    return 'Enter Email';
                  }
                  return null;
                },
                controller: emailController,
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
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              height: width < 600 ? null : height * 0.055,
              width: width < 600 ? width * 0.85 : width * 0.7,
              decoration: BoxDecoration(
                color:Colors.brown[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                key: _passwordKey,
                onChanged: (value) {
                  _passwordKey.currentState?.validate();
                },
                validator: (value) {
                  if (value==null||value.isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },
                controller: passwordController,
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
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontSize: 18, color: Colors.indigo,fontWeight: FontWeight.w600),
                    ),
                  )
                ])
          ],
        ),
      );
    }
    return Container(
      //color: Colors.green,
      height: size.height * 0.54,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          _formField(),
        ],
      ),
    );

  }
}
