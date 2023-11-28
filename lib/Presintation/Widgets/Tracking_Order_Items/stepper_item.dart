import 'package:flutter/material.dart';
import 'package:khafif/Constants/mycolors.dart';

class StepperItem extends StatelessWidget {
  final String title;
  final int index;
  final int currentIndex;
  final VoidCallback onTap;
  final bool isLast;
  const StepperItem(
      {super.key,
      required this.index,
      required this.currentIndex,
      required this.onTap,
      required this.isLast,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return isLast
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: currentIndex >= index
                                  ? MyColors.buttonCOlor
                                  : Colors.black12),
                          color: index == currentIndex
                              ? MyColors.buttonCOlor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  Container(
                    width: 2,
                    // height: 2,
                    color: currentIndex >= index + 1
                        ? MyColors.buttonCOlor
                        : Colors.black12,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: MyColors.backColor),
              ),
            ],
          )
        : Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 30,
                        height: 30,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: currentIndex >= index
                                    ? Colors.black12
                                    : Colors.black12),
                            color: index == currentIndex
                                ? MyColors.buttonCOlor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(100)),
                        child: currentIndex > index
                            ? Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: MyColors.buttonCOlor),
                              )
                            : Container(),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      width: 2,
                      // height: 2,
                      color: currentIndex >= index + 1
                          ? MyColors.buttonCOlor
                          : Colors.black12,
                    ))
                  ],
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: MyColors.backColor),
                ),
              ],
            ),
          );
  }
}
