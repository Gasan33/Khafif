import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Presintation/Widgets/Locations_item/shops_item.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';

class LocatonsScreen extends StatefulWidget {
  const LocatonsScreen({super.key});

  @override
  State<LocatonsScreen> createState() => _LoState();
}

class _LoState extends State<LocatonsScreen> {
  buildAppBar(String title) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: MyColors.backColor,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(color: MyColors.buttonCOlor),
          ),
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
        ));
  }

  Widget buildLocatinsWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: MyColors.backGroundColor,
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return const ShopsItem();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Locations"),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildLocatinsWidget();
          } else {
            return buildLocatinsWidget();
          }
        },
        child: showLoadingIndicator(),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 96,
        color: MyColors.buttonCOlor,
      ),
    );
  }
}
