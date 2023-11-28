import 'package:flutter/material.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';

class PointsItem extends StatelessWidget {
  const PointsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: customboxDecoration(16, MyColors.buttonCOlor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 96,
            //color: const Color.fromRGBO(233, 30, 99, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "data",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.question_mark_rounded,
                          size: 24,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Text(
                      "data",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "data",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  height: double.infinity,
                  //color: Colors.black,
                  child: Image.asset(
                    "assets/images/fries.jpg",
                    // width: 96,
                    // height: 96,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              //height: MediaQuery.sizeOf(context).height * 0.09,
              //color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Image.asset(
                      "assets/images/fries.jpg",
                      // width: 96,
                      // height: 96,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
