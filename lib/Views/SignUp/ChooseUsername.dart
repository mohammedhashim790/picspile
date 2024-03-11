import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picspile/Services/UserService/UserService.dart';
import 'package:picspile/Views/SignUp/CreatePassword.dart';

class ChooseUsername extends StatefulWidget {
  const ChooseUsername({super.key});

  @override
  State<ChooseUsername> createState() => _ChooseUsernameState();
}

class _ChooseUsernameState extends State<ChooseUsername> {
  TextEditingController _usernameController = TextEditingController();

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
                        "Choose Username",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        "You can always change it later",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: _usernameController,
                  onChanged: (_) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0))),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z.]')),
                  ],
                ),
              ),
              Visibility(
                  visible: valid(),
                  child: Text(
                    "${_usernameController.text} is not available",
                    style: TextStyle(color: Colors.red),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CreatePassword(username:_usernameController.value.text)));
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

            ],
          ),
        ),
      ),
    );
  }

  valid() {
    return users
        .where((element) => element.username
        .contains(_usernameController.text))
        .isNotEmpty &&
        _usernameController.text.isNotEmpty;
  }
}
