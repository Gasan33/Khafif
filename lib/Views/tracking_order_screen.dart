import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Presintation/Widgets/Tracking_Order_Items/stepper_item.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';

class TrackingOrderScreen extends StatefulWidget {
  const TrackingOrderScreen({super.key});

  @override
  State<TrackingOrderScreen> createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrderScreen> {
  int index = 0;
  bool inProcess = false;
  bool done = false;
  int _currentIndex = 0;

  Widget buildDivider(double endIndent) {
    return VerticalDivider(
      width: 30,
      endIndent: endIndent,
      color: Colors.orange[200],
      thickness: 2,
    );
  }

  Widget buildTrackList(String title) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepperItem(
            title: "Order Accepted",
            index: 0,
            currentIndex: _currentIndex,
            onTap: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            isLast: false,
          ),
          StepperItem(
            title: "Preparing",
            index: 1,
            currentIndex: _currentIndex,
            onTap: () {
              setState(() {
                _currentIndex = 1;
              });
            },
            isLast: false,
          ),
          StepperItem(
            title: "Ready",
            index: 2,
            currentIndex: _currentIndex,
            onTap: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            isLast: false,
          ),
          StepperItem(
            title: "Under Delivery",
            index: 3,
            currentIndex: _currentIndex,
            onTap: () {
              setState(() {
                _currentIndex = 3;
              });
            },
            isLast: false,
          ),
          StepperItem(
            title: "Delivered",
            index: 4,
            currentIndex: _currentIndex,
            onTap: () {
              setState(() {
                _currentIndex = 4;
              });
            },
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget buildTrackingOrderWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: MyColors.backGroundColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              "Tracking Order",
              style: TextStyle(
                  color: MyColors.buttonCOlor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Center(
            child: Text(
              "24242",
              style: TextStyle(
                  color: MyColors.backColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: buildTrackList("title")),
        ],
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
            return buildTrackingOrderWidget();
          } else {
            return buildTrackingOrderWidget();
          }
        },
        child: showLoadingIndicator(),
      ),
    );
  }
}
