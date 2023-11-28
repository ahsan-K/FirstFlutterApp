import 'dart:developer';

import 'package:coffee_app/components/customBtn.dart';
import 'package:flutter/material.dart';
import '../components/card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    void goToProductList() {
      log("message");
      Navigator.pushNamed(context, '/products');
    }

    return MaterialApp(
      home: Material(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    // alignment: Alignment.bottomLeft,
                    height: 536,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/banner.png'),
                            fit: BoxFit.cover)),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 100,
                          left: 20,
                          child: SizedBox(
                            width: 250,
                            child: Text("Fasion sale",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 4,
                                    wordSpacing: 3,
                                    height: 0.9)),
                          ),
                        ),
                        Positioned(
                            left: 20,
                            bottom: 50,
                            child: Container(
                              width: 160,
                              child: CustomBtn(
                                text: "Check",
                                onPressed: () => {},
                                type: "primary",
                                radius: 30,
                                height: 36,
                                fontSize: 15,
                              ),
                            ))
                      ],
                    )),
                // Promo(),
                BreadCrum(
                  mainTitle: "Sale",
                  subTitle: "Super summer sale",
                  onPressed: goToProductList,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          height: 300,
                          child: ProductCard(
                            name: "Evening Dress",
                            rating: 4.5,
                            company: "Dorothy Perkins",
                            price: 50,
                            image: "assets/images/product.png",
                            discount: 10,
                            noWidth: true,
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 300,
                          child: ProductCard(
                            name: "Evening Dress",
                            rating: 4.5,
                            company: "Dorothy Perkins",
                            price: 50,
                            image: "assets/images/product2.png",
                            discount: 10,
                            noWidth: true,
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 300,
                          child: ProductCard(
                            name: "Evening Dress",
                            rating: 4.5,
                            company: "Dorothy Perkins",
                            price: 50,
                            image: "assets/images/product4.png",
                            discount: 10,
                            noWidth: true,
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 300,
                          child: ProductCard(
                            name: "Evening Dress",
                            rating: 4.5,
                            company: "Dorothy Perkins",
                            price: 50,
                            image: "assets/images/product.png",
                            discount: 10,
                            noWidth: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BreadCrum(
                  mainTitle: "New",
                  subTitle: "You’ve never seen it before!",
                  onPressed: goToProductList,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          height: 300,
                          child: ProductCard(
                            name: "Evening Dress",
                            rating: 4.5,
                            company: "Dorothy Perkins",
                            price: 50,
                            image: "assets/images/product4.png",
                            discount: 10,
                            noWidth: true,
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 300,
                          child: ProductCard(
                            name: "Evening Dress",
                            rating: 4.5,
                            company: "Dorothy Perkins",
                            price: 50,
                            image: "assets/images/product2.png",
                            discount: 10,
                            noWidth: true,
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 300,
                          child: ProductCard(
                            name: "Evening Dress",
                            rating: 4.5,
                            company: "Dorothy Perkins",
                            price: 50,
                            image: "assets/images/product4.png",
                            discount: 10,
                            noWidth: true,
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 300,
                          child: ProductCard(
                            name: "Evening Dress",
                            rating: 4.5,
                            company: "Dorothy Perkins",
                            price: 50,
                            image: "assets/images/product.png",
                            discount: 10,
                            noWidth: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Text()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BreadCrum extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final VoidCallback onPressed;

  const BreadCrum({
    Key? key,
    required this.mainTitle,
    required this.subTitle,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mainTitle,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Text(
                  subTitle,
                  style: TextStyle(color: Color.fromRGBO(155, 155, 155, 100)),
                )
              ],
            ),
            InkWell(
              onTap: onPressed,
              child: Text("View all"),
            )
          ],
        ),
      ),
    );
  }
}
