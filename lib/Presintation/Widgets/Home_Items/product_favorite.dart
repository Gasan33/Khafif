import 'package:flutter/material.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Views/item_details_screen.dart';

class ProductFavorite extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  final String calories;
  final String price;
  final bool favorate;
  const ProductFavorite({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.calories,
    required this.price,
    required this.favorate,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ItemDetailsScreen()));
      },
      child: Container(
          width: MediaQuery.sizeOf(context).width * 0.50,
          height: MediaQuery.sizeOf(context).height * 0.25,
          margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          padding: const EdgeInsetsDirectional.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                subTitle,
                style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              Image.asset(
                imageUrl,
                height: MediaQuery.sizeOf(context).height * 0.15,
                width: MediaQuery.sizeOf(context).height * 0.30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.fireplace,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "$calories Calories",
                    style:
                        const TextStyle(color: Colors.orange, fontSize: 12.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$price sr",
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {},
                    child: favorate
                        ? Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              color: MyColors.buttonCOlor,
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ))
                        : Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.black,
                            )),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
