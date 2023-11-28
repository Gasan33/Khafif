import 'package:flutter/material.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Languages/languages.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';

import 'package:khafif/Views/home_Screen.dart';
import 'package:khafif/Views/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                "${AppLocale.of(context).getTranslated("loginLabel")}",
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "${AppLocale.of(context).getTranslated("loginSubTitle")}",
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: accontButton(const Icon(Icons.apple),
                    "${AppLocale.of(context).getTranslated("loginWithApple")}"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: accontButton(const Icon(Icons.g_mobiledata),
                    "${AppLocale.of(context).getTranslated("loginWithGoogle")}"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 32.0),
                child: buildTextFormField(
                    '+9665XXXXXXXX',
                    const Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    controller,
                    false),
              ),
              globalButton(
                  "${AppLocale.of(context).getTranslated("loginLabel")}",
                  72,
                  double.infinity,
                  16,
                  MyColors.buttonCOlor,
                  Colors.black,
                  false,
                  context,
                  const HomeScreen()),
              Row(
                children: [
                  Text(
                      "${AppLocale.of(context).getTranslated("dontHaveAccont")}"),
                  TextButton(
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                      },
                      child: Text(
                        "${AppLocale.of(context).getTranslated("singUpLabel")}",
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
