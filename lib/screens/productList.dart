import 'dart:developer';

import 'package:flutter/material.dart';
import '../components/card.dart';
import '../providers/favouriteProvider.dart';
import '../providers/productsProvider.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouritProvider>(context);
    log(provider.get_favouritList.toString());
    return Material(
      child: SafeArea(
        child: Consumer<PoductProvider>(
          builder: (context, product, child) {
            var favouriteIDs =
                context.watch<FavouritProvider>().get_favouritList;
            // return HeaderAndFilter();
            return Column(
              children: [
                HeaderAndFilter(),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.black,
                                padding: EdgeInsets.all(10),
                                child: Text("T-shirts",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.black,
                                padding: EdgeInsets.all(10),
                                child: Text("T-shirts",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.black,
                                padding: EdgeInsets.all(10),
                                child: Text("T-shirts",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.black,
                                padding: EdgeInsets.all(10),
                                child: Text("T-shirts",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.black,
                                padding: EdgeInsets.all(10),
                                child: Text("T-shirts",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.black,
                                padding: EdgeInsets.all(10),
                                child: Text("T-shirts",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.black,
                                padding: EdgeInsets.all(10),
                                child: Text("T-shirts",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.black,
                                padding: EdgeInsets.all(10),
                                child: Text("T-shirts",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.black,
                                padding: EdgeInsets.all(10),
                                child: Text("T-shirts",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.6),
                      itemCount: product.get_productList.length,
                      itemBuilder: (context, index) {
                        bool isFavourite = favouriteIDs
                            .contains(product.get_productList[index]["id"]);

                        return ProductCard(
                          isFavourite: isFavourite,
                          name: product.get_productList[index]["name"],
                          rating: product.get_productList[index]["rating"],
                          company: product.get_productList[index]["company"],
                          price: product.get_productList[index]["price"],
                          image: product.get_productList[index]["image"],
                          discount:
                              product.get_productList[index]["discount"] ?? 0,
                          noWidth: true,
                          onFavourite: () => isFavourite
                              ? provider.removeFromFavourite(
                                  product.get_productList[index]["id"])
                              : provider.addToFavourite(
                                  product.get_productList[index]["id"]),
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class HeaderAndFilter extends StatelessWidget {
  const HeaderAndFilter({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                // Handle back button press
              },
              icon: Icon(Icons.arrow_back),
            ),
            Text(
              "Products",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            IconButton(
              onPressed: () {
                // Handle back button press
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
      ],
    );
  }
}
