import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Presintation/Widgets/Details_items/food_item_title.dart';
import 'package:khafif/Presintation/Widgets/global_item.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';
import 'package:khafif/Views/home_Screen.dart';
import 'package:khafif/Views/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required String urlImage,
  }) =>
      SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: Center(
          child: Image.asset(
            urlImage,
            fit: BoxFit.contain,
            height: 150.0,
            width: MediaQuery.of(context).size.width / 2,
            //width: double.minPositive,
          ),
        ),
      );

  Widget buildImage({required List<String> urlImage}) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.35,
      child: Scaffold(
        backgroundColor: MyColors.backGroundColor,
        body: Center(
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
              buildPage(urlImage: urlImage[0]),
              buildPage(urlImage: urlImage[1]),
              buildPage(urlImage: urlImage[2]),
            ],
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.05,
          color: MyColors.backGroundColor,
          child: Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: urlImage.length,
              effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
                  dotColor: MyColors.backColor,
                  activeDotColor: MyColors.buttonCOlor),
              onDotClicked: (index) => controller.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFlavorBar(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.20,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: ((context, index) {
            return const GlobalItem(
                label: "label", imageUrl: 'assets/images/fries.jpg');
          })),
    );
  }

  Widget buildDetailsWidget(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.black,
      padding: EdgeInsets.only(
          top: 8.0,
          left: 8.0,
          right: 8.0,
          bottom: MediaQuery.sizeOf(context).height * 0.15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildImage(
              urlImage: [
                'assets/images/fries.jpg',
                'assets/images/fries.jpg',
                'assets/images/fries.jpg',
              ],
            ),
            const FoodItemTitle(
              foodTitle: 'Caramel Popcorn',
              foodSubTitle: 'Hot italin pizza',
              price: '20',
              time: '60',
              calories: '88',
              points: '1000',
            ),
            globalTitle("Choose Flavor", context),
            buildFlavorBar(context),
          ],
        ),
      ),
    );
  }

  Widget buildCounterButton(
      String lable,
      double hi,
      double wd,
      double rad,
      Color buttonColor,
      Color textColor,
      bool isIcon,
      BuildContext context,
      var classObj) {
    return Container(
      height: hi,
      width: wd,
      margin: const EdgeInsets.all(8),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          //side: const BorderSide(color: Colors.black, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(rad),
          ),
          backgroundColor: buttonColor,
          minimumSize: Size.fromHeight(hi),
        ),
        onPressed: () async {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            globalButton('-', 32, 32, 8, Colors.black, Colors.white, false,
                context, const LoginScreen()),
            Text(
              lable,
              style: TextStyle(fontSize: 12.0, color: textColor),
            ),
            globalButton('+', 32, 32, 8, MyColors.buttonCOlor, Colors.black,
                false, context, const LoginScreen()),
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheet() {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.15,
      color: MyColors.backGroundColor,
      //padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            globalButton(
                'order now',
                72,
                MediaQuery.sizeOf(context).width * 0.55,
                16,
                Colors.black,
                Colors.white,
                false,
                context,
                const LoginScreen()),
            buildCounterButton(
                '04',
                72,
                MediaQuery.sizeOf(context).width * 0.35,
                16,
                Colors.white,
                Colors.grey,
                false,
                context,
                LoginScreen),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backGroundColor,
        appBar: customAppBar("", context, false),
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return buildDetailsWidget(context);
            } else {
              return buildDetailsWidget(context);
            }
          },
          child: showLoadingIndicator(),
        ),
        bottomSheet: buildBottomSheet());
  }
}
