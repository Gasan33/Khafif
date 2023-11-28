import 'package:flutter/material.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';

class MyAddressesItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String zip;
  final Icon icon;
  const MyAddressesItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      required this.zip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: customboxDecoration(16, Colors.white),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: icon,
            ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        subTitle,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "ZIP($zip) ",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 8.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
