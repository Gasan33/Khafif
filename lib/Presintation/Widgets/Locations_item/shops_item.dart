import 'package:flutter/material.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';

class ShopsItem extends StatelessWidget {
  const ShopsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                flex: 9,
                child: Text(
                  "Al -khalajiah Shop",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                )),
            Expanded(
                flex: 2,
                child: Text(
                  "2.5 km",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ),
    );
  }
}
