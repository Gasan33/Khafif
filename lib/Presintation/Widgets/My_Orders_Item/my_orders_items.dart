import 'package:flutter/material.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';
import 'package:khafif/Views/tracking_order_screen.dart';

class MyOrdersItem extends StatelessWidget {
  const MyOrdersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TrackingOrderScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: customboxDecoration(8, Colors.white),
          child: const Row(
            children: [
              Expanded(
                flex: 2,
                child: Icon(
                  Icons.radio_button_on,
                  color: Colors.amber,
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Text(
                    "4566",
                    //maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  )),
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Not Piad",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "240 SAR",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: Text(
                    "Under Delivery",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
