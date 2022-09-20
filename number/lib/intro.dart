import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:number/login.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                  'https://assets5.lottiefiles.com/packages/lf20_0k4vnauu.json',
                  width: 360,
                  height: 360,
                  // fit: BoxFit.fill,
                ),
              ],
            ),
            SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.purple[800],
                      border:
                          Border.all(color: Color.fromARGB(255, 42, 23, 45)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        "Start",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
