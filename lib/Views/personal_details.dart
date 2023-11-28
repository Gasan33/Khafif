import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Presintation/Widgets/Pesonal_Details_Items/capten_details_item.dart';
import 'package:khafif/Presintation/Widgets/Pesonal_Details_Items/points_item.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';
import 'package:khafif/Views/login_screen.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  Widget buildInfoRow() {
    return Container(
      width: double.infinity,
      height: 72,
      color: MyColors.backGroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildInfoContent("Settings", const Icon(Icons.settings)),
          buildInfoContent("My Info", const Icon(Icons.info)),
          buildInfoContent("Addresses", const Icon(Icons.location_city)),
          buildInfoContent("My Orders", const Icon(Icons.paypal)),
        ],
      ),
    );
  }

  Widget buildPointsContent() {
    return const SizedBox(
      width: double.infinity,
      height: 204,
      child: PointsItem(),
    );
  }

  Widget buildIconRow(String title, Icon icon) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            width: 8.0,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget buildPresonalDeatilsWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: MyColors.backGroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      margin: const EdgeInsets.only(bottom: 48),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CaptenDetailsItem(
              name: "Mohamed Ali",
              phone: "+9665XXXXXXXX",
              address: "Riyadh Alaezdehar",
              imageUrl: "assets/images/fries.jpg",
            ),
            buildInfoRow(),
            buildPointsContent(),
            buildIconRow(
                "invite Friend",
                const Icon(
                  Icons.person_add,
                  size: 24.0,
                )),
            buildIconRow(
                "Rate Us",
                const Icon(
                  Icons.rate_review_outlined,
                  size: 24.0,
                )),
            buildIconRow(
                "Feed Back",
                const Icon(
                  Icons.feedback,
                  size: 24.0,
                )),
            buildIconRow(
                "About us",
                const Icon(
                  Icons.info_outline,
                  size: 24.0,
                )),
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheet(String title) {
    return Container(
      width: double.infinity,
      height: 48,
      color: MyColors.backGroundColor,
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.red, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
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
            return buildPresonalDeatilsWidget(context);
          } else {
            return buildPresonalDeatilsWidget(context);
          }
        },
        child: showLoadingIndicator(),
      ),
      bottomSheet: buildBottomSheet("log out"),
    );
  }
}
