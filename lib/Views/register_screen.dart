import 'package:flutter/material.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Languages/languages.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';

import 'package:khafif/Views/home_Screen.dart';
import 'package:khafif/Views/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGroundColor,
      appBar: customAppBar('title', context, false),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: MyColors.backGroundColor,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${AppLocale.of(context).getTranslated("singUpLabel")}",
                //"Sing Up",
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "${AppLocale.of(context).getTranslated("singUpSubTitle")}",
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 32.0),
                child: buildTextFormField(
                    'your.name@gmail.com',
                    const Icon(
                      Icons.email,
                      color: MyColors.buttonCOlor,
                    ),
                    controller,
                    false),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 32.0),
                child: buildTextFormField(
                    "${AppLocale.of(context).getTranslated("fullName")}",
                    const Icon(
                      Icons.person_2,
                      color: MyColors.buttonCOlor,
                    ),
                    controller,
                    false),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 32.0),
                child: buildTextFormField(
                    '+9665XXXXXXXX',
                    const Icon(
                      Icons.phone,
                      color: MyColors.buttonCOlor,
                    ),
                    controller,
                    false),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: accontButton(const Icon(Icons.apple),
                    "${AppLocale.of(context).getTranslated("singUpWithApple")}"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: accontButton(const Icon(Icons.g_mobiledata),
                    "${AppLocale.of(context).getTranslated("singUpWithGoogle")}"),
              ),
              globalButton(
                  "${AppLocale.of(context).getTranslated("singUpLabel")}",
                  72,
                  double.infinity,
                  16,
                  MyColors.buttonCOlor,
                  Colors.black,
                  false,
                  context,
                  const HomeScreen()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "${AppLocale.of(context).getTranslated("allReadyHaveAccont")}"),
                  TextButton(
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                      child: Text(
                        "${AppLocale.of(context).getTranslated("loginLabel")}",
                        style:
                            const TextStyle(fontSize: 16.0, color: Colors.grey),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
