import 'package:flutter/material.dart';
import 'package:todo_clone/Homepage.dart';
import 'package:todo_clone/common_widget/common_textfields.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usercontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    const String hardcoreuser = "user";
    const String hardcorepassword = "abc";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "TO DO",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Customtextfield(
              taskcontroller: usercontroller,
              hint: "username",
            ),
            Customtextfield(
              taskcontroller: passwordcontroller,
              hint: "password",
            ),
            ElevatedButton(
              // style: ButtonStyle(
              //     backgroundColor:
              //         MaterialStateProperty.all<Color>(Colors.amber[200]!)),
              onPressed: () {
                String entereduser = usercontroller.text;
                String enteredpass = passwordcontroller.text;
                if (entereduser == hardcoreuser &&
                    enteredpass == hardcorepassword) {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const Homepage(),
                  //     ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid username or Password")));
                  const Duration(seconds: 5);
                }
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
