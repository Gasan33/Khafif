import 'package:flutter/material.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Languages/languages.dart';
import 'package:khafif/Views/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget button(String txt) {
    return txt == 'SKIP'
        ? InkWell(
            onTap: () {
              controller.jumpToPage(2);
            },
            child: SizedBox(
              //color: Colors.black,
              width: MediaQuery.of(context).size.width / 3,
              child: Container(
                height: 48,
                width: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    //color: Colors.grey,
                    border: Border.all(
                        width: 0.5, color: Colors.pinkAccent.shade700)),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: Text(
                        txt,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            },
            child: SizedBox(
              //color: Colors.black,
              width: MediaQuery.of(context).size.width / 3,
              child: Container(
                height: 48,
                width: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.pinkAccent.shade700,
                  //border: Border.all(width: 1, color: Colors.grey)
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                      child: Text(txt,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold))),
                ),
              ),
            ),
          );
  }

  Widget buildPage(
          {required Color color,
          required String urlImage,
          required String title,
          required String subTitle}) =>
      Scaffold(
        body: Container(
          color: color,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  urlImage,
                  fit: BoxFit.contain,
                  height: 150.0,
                  width: MediaQuery.of(context).size.width / 2,
                  //width: double.minPositive,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          padding:
              const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 40),
          height: MediaQuery.sizeOf(context).height * 0.5,
          decoration: const BoxDecoration(
              color: MyColors.backColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(48), topLeft: Radius.circular(48))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const WormEffect(
                      spacing: 16,
                      dotColor: Colors.grey,
                      activeDotColor: MyColors.buttonCOlor),
                  onDotClicked: (index) => controller.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    subTitle,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              isLastPage
                  ? Container(
                      // color: Colors.white,
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              side: const BorderSide(
                                  color: Colors.black, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              backgroundColor: MyColors.buttonCOlor,
                              minimumSize: const Size.fromHeight(64)),
                          onPressed: () async {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            "LET'S GO",
                            style: TextStyle(fontSize: 16.0),
                          )),
                    )
                  : Container()
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       button('SKIP'),
              //       // TextButton(
              //       //     onPressed: () => controller.jumpToPage(2),
              //       //     child: const Text('SKIP')),
              //       button('NEXT'),
              //       // TextButton(
              //       //     onPressed: () => controller.nextPage(
              //       //         duration: const Duration(milliseconds: 500),
              //       //         curve: Curves.easeInOut),
              //       //     child: const Text('NEXT')),
              //     ],
              //   ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backGroundColor,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        // padding: const EdgeInsets.only(bottom: 80),
        color: MyColors.backGroundColor,
        //  height: MediaQuery.sizeOf(context).height * 0.5,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) => {
                  setState(
                    () {
                      isLastPage = index == 2;
                    },
                  )
                },
                children: [
                  buildPage(
                      color: MyColors.backGroundColor,
                      urlImage: 'assets/images/fries.jpg',
                      title:
                          "${AppLocale.of(context).getTranslated("onBoardingTitle")}",
                      subTitle:
                          "${AppLocale.of(context).getTranslated("onBoardingSubTitle")}"),
                  buildPage(
                      color: MyColors.backGroundColor,
                      urlImage: 'assets/images/fries.jpg',
                      title:
                          "${AppLocale.of(context).getTranslated("onBoardingTitle")}",
                      subTitle:
                          "${AppLocale.of(context).getTranslated("onBoardingSubTitle")}"),
                  buildPage(
                      color: MyColors.backGroundColor,
                      urlImage: 'assets/images/fries.jpg',
                      title:
                          "${AppLocale.of(context).getTranslated("onBoardingTitle")}",
                      subTitle:
                          "${AppLocale.of(context).getTranslated("onBoardingSubTitle")}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
