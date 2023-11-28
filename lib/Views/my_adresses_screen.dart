import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Presintation/Widgets/My_Addresses_Item/my_addresses_item.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';
import 'package:khafif/Views/login_screen.dart';

class MyAddressesScreen extends StatefulWidget {
  const MyAddressesScreen({super.key});

  @override
  State<MyAddressesScreen> createState() => _MyAddressesScreenState();
}

class _MyAddressesScreenState extends State<MyAddressesScreen> {
  Widget buildMyAddressesWIdget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: MyColors.backGroundColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Center(
            child: Text(
              "My Address",
              style: TextStyle(
                  color: MyColors.buttonCOlor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return const MyAddressesItem(
                    icon: Icon(Icons.home),
                    title: "Home",
                    subTitle: "Almalaz Thamer Princes Street",
                    zip: "14251");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomSheet() {
    return Container(
      width: double.infinity,
      height: 128,
      // margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: MyColors.backGroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Center(
        child: globalButton(
            "+ Add New Adress",
            56,
            double.infinity,
            16,
            MyColors.buttonCOlor,
            Colors.black,
            false,
            context,
            const LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backGroundColor,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        leading: Container(
          width: 32.0,
          height: 32.0,
          //padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: MyColors.buttonCOlor,
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: MyColors.backColor,
                size: 16,
              ),
            ),
          ),
        ),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildMyAddressesWIdget();
          } else {
            return buildMyAddressesWIdget();
          }
        },
        child: showLoadingIndicator(),
      ),
      bottomSheet: buildBottomSheet(),
    );
  }
}
