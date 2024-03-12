import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:picspile/Views/HomeScreen/HomeScreen.dart';
import 'package:picspile/Views/Navigation/navigation.dart';
import 'package:picspile/Views/SignUp/ChooseUsername.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffEEFFD2),
            Color(0xffBCFE8A),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      controller: _usernameController,
                      onChanged: (_) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          hintText: "Phone number, email address or username",
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0))),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z.]')),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        TextField(
                          controller: _passwordController,
                          onChanged: (_) {
                            setState(() {});
                          },
                          decoration: const InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0))),
                          obscureText: _hidePassword,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z.]'),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _hidePassword = !_hidePassword;
                                });
                              },
                              icon: (_hidePassword)
                                  ? Icon(PhosphorIcons.eye())
                                  : Icon(PhosphorIcons.eyeSlash())),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                    visible: valid(),
                    child: Text(
                      "${_usernameController.text} is not available",
                      style: const TextStyle(color: Colors.red),
                    )),
                IgnorePointer(
                  ignoring: valid(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Ink(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromRGBO(38, 177, 36, 1.0),
                        Color.fromRGBO(16, 107, 16, 1.0)
                      ], transform: GradientRotation(180))),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (_) => PageNavigationClass(),
                              ),
                              (_) => false);
                        },
                        child: const Center(
                            child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                      text: "Forgotten your login details?",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Get help with logging in.",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("OR"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
                Container(
                  height: 50.0,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("assets/facebook.png"))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                        text: "Don't have and account?",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Sign Up.",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const ChooseUsername()));
                                },
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  valid() {
    return _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }
}
