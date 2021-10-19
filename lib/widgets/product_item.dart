import 'package:flutter/material.dart';
import 'package:furniture_app/util/image_show.dart';

import '../screens/details.dart';

class ProductItem extends StatelessWidget {
  final Map furniture;

  ProductItem({this.furniture});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Details();
              },
            ),
          );
        },
        child: Container(
          height: 140,
          width: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ImageFullScreenWrapperWidget(
              child: Image.asset(
                "${furniture["img"]}",
                // height: 140,
                // width: 140,
                fit: BoxFit.cover,
              ),
              dark: true,
            ),
          ),
        ),
      ),
    );
  }
}
