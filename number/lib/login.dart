import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'otp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  Future<void> sendOtp() async {
    EmailAuth emailAuth = EmailAuth(sessionName: "OTP Testing");
    bool result = await emailAuth.sendOtp(
      recipientMail: emailcontroller.value.text,
      otpLength: 5,
    );
    if (result) {
      print(' Otp');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OtpScreen(email: emailcontroller.value.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 0, 119, 216),
      //   title: const Text(
      //     "Login",
      //     style: TextStyle(
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: const Icon(Icons.arrow_back_ios_new)),
      // ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   height: 300,
            //   width: 400,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //     image: AssetImage("assets/images/Write.png",)
            //     )
            //   ),
            // ),

//

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                  'https://assets4.lottiefiles.com/packages/lf20_yupefrh2.json',
                  width: 330,
                  height: 330,
                  // fit: BoxFit.fill,
                ),
              ],
            ),

//

            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 1,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.email,
                        size: 25,
                        color: Colors.purple,
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      
                      hintText: 'Enter Your Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 25,
                        color: Colors.purple,
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                  ),
                  const SizedBox(height: 35),
                  InkWell(
                    onTap: () {
                      sendOtp();
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.purple[800],
                        border:
                            Border.all(color: Color.fromARGB(255, 42, 23, 45)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'Send OTP',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
