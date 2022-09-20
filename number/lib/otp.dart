import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'home.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String? email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pin1 = TextEditingController();

  TextEditingController pin2 = TextEditingController();

  TextEditingController pin3 = TextEditingController();

  TextEditingController pin4 = TextEditingController();

  TextEditingController pin5 = TextEditingController();

  TextEditingController pin6 = TextEditingController();

  void verify(context) {
    String otpValue = pin1.value.text +
        pin2.value.text +
        pin3.value.text +
        pin4.value.text +
        pin5.value.text +
        pin6.value.text;
    EmailAuth emailAuth = EmailAuth(sessionName: 'Otp testing');
    bool res =
        emailAuth.validateOtp(recipientMail: widget.email!, userOtp: otpValue);
    if (res) {
      print('verify');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text(
            "OTP Verification",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                    'https://assets4.lottiefiles.com/private_files/lf30_msacsam1.json',
                    width: 200,
                    height: 200,
                    // fit: BoxFit.fill,
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    child: Row(
                  children: [
                    customPinCode(context, pin1),
                    const SizedBox(
                      width: 10,
                    ),
                    customPinCode(context, pin2),
                    const SizedBox(
                      width: 8,
                    ),
                    customPinCode(context, pin3),
                    const SizedBox(
                      width: 8,
                    ),
                    customPinCode(context, pin4),
                    const SizedBox(
                      width: 8,
                    ),
                    customPinCode(context, pin5),
                    const SizedBox(
                      width: 10,
                    ),
                    customPinCode(context, pin6),
                  ],
                )),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  onTap: () => verify(context),
                  child: const Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }

  SizedBox customPinCode(
      BuildContext context, TextEditingController controller) {
    return SizedBox(
      height: 50,
      width: 50,
      child: TextFormField(
        controller: controller,
        onChanged: (val) {
          if (val.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: '0'),
      ),
    );
  }
}
