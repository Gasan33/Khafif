import 'package:flutter/material.dart';
import 'package:khafif/Constants/mycolors.dart';

class ComeningFood extends StatelessWidget {
  final String title;
  final String rating;
  final String price;
  final String imageUrl;
  const ComeningFood(
      {super.key,
      required this.title,
      required this.rating,
      required this.price,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width * 0.35,
        height: MediaQuery.sizeOf(context).height * 0.25,
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: double.infinity,
              color: Colors.green,
              child: Image.asset(
                imageUrl,
                width: MediaQuery.sizeOf(context).width * 0.1,
                height: MediaQuery.sizeOf(context).width * 0.1,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: MyColors.backColor,
                      size: 16.0,
                    ),
                    Text(
                      rating,
                      style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  " $price",
                  style: const TextStyle(fontSize: 12.0, color: Colors.red),
                ),
              ],
            )
          ],
        ));
  }
}
