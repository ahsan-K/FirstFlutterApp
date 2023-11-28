import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final double rating;
  final String company;
  final String name;
  final int price;
  final int discount;
  final dynamic onFavourite;
  final bool noWidth;
  final bool isFavourite;


  int _getDiscountedPrice() {
    final discountAmount = price * (discount / 100);
    return (price - discountAmount).toInt();
  }

  const ProductCard({
    Key? key,
    required this.image,
    required this.rating,
    required this.company,
    required this.name,
    required this.price,
    this.discount = 0,
    this.onFavourite,
    this.noWidth = false,
    this.isFavourite = false,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned(
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage(image),
                      height: 200,
                      width: noWidth ? double.infinity : 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(children: [
                    RatingBar.builder(
                      itemSize: 15,
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Text("(10)",
                        style: TextStyle(color: Color.fromRGBO(155, 155, 155, 100)))
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    company,
                    style: TextStyle(color: Color.fromRGBO(155, 155, 155, 100)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                if (discount != 0)
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: RichText(
                      text: TextSpan(
                          text: '\$${price}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(155, 155, 155, 100),
                              decoration: TextDecoration.lineThrough),
                          children: [
                            TextSpan(
                                text: '   \$${_getDiscountedPrice()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.red))
                          ]),
                    ),
                  ),
                if (discount == 0)
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text('\$${price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
              ],
            ),
          ),
           if (discount != 0)
            Positioned(
              top: 10,
              left: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.red,
                  child: Text("-${discount}%",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: InkWell(
                onTap: onFavourite,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(1),
                          spreadRadius: 50,
                          blurRadius: 70,
                          offset: Offset(0, 70),
                        ),
                      ],
                    ),
                    // onPressed: ()=>{},
                    padding: EdgeInsets.all(10),
                    // mini: true,
                    child: Icon(
                      Icons.favorite,
                      color: isFavourite ? Colors.red : Color.fromRGBO(155, 155, 155, 100),
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
