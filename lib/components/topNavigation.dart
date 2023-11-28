import 'package:flutter/material.dart';
import './searchInput.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(49, 49, 49, 100),
            Color.fromARGB(255, 239, 169, 39),
          ],
        )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Location",
                      style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(255, 255, 255, 100))),
                  Text("Bilzen, Tanjungbalai",
                      style: TextStyle(fontSize: 20, color: Colors.white))
                ]),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  radius: 25,
                )
              ],
            ),
            SearchInput()

          ],
        )
      );
  }
}
