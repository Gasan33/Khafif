import 'package:flutter/material.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';

class CaptenDetailsItem extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  final String imageUrl;
  const CaptenDetailsItem(
      {super.key,
      required this.name,
      required this.phone,
      required this.address,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 96,
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: customboxDecoration(16, Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              width: 80,
              margin: const EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  imageUrl,
                  // width: 96,
                  // height: 96,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  phone,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  address,
                  style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ],
            )
          ],
        ));
  }
}
