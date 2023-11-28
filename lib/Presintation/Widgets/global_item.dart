import 'package:flutter/material.dart';

class GlobalItem extends StatelessWidget {
  final String label;

  final String imageUrl;
  const GlobalItem({super.key, required this.label, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        //width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.25,
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          //color: Colors.black54,
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
            onTap: () {},
            //  Navigator.pushNamed(context, movieDetalScreen, arguments: movie),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(imageUrl),
                      colorFilter: ColorFilter.mode(
                          Colors.yellow.withOpacity(0.7), BlendMode.overlay))),
              child:
                  Align(alignment: Alignment.bottomCenter, child: Text(label)),
            )));
  }
}
