import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:picspile/Services/UserService/UserService.dart';
import 'package:picspile/Views/HomeScreen/HomeScreen.dart';

class CreatePassword extends StatefulWidget {
  String username;
  CreatePassword({super.key,required this.username});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  TextEditingController _passwordController = TextEditingController();

  bool _hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(builder: (_) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Create a Password",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        "For securiy, your password must be six characters or more.",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
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
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 2.0))),
                      obscureText: _hidePassword,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z.]')),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(onPressed: (){
                        setState(() {
                          _hidePassword = !_hidePassword;
                        });
                      }, icon: (_hidePassword)?Icon(PhosphorIcons.eye()):Icon(PhosphorIcons.eyeSlash())),
                    )
                  ],
                ),
              ),
              Padding(
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> HomeScreen()));
                    },
                    child: const Center(
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  valid() {
    return
        _passwordController.text.isNotEmpty;
  }
}
