import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(237, 237, 237, 100),
      ),
      height: 50,
      // width: 200,
      margin: EdgeInsets.only(bottom: 10, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 24,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a search term',
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 239, 169, 39)),
              padding: EdgeInsets.all(12),
              child: Center(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ))
        ],
      ),
    );
  }
}
