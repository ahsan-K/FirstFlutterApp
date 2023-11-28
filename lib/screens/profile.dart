import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:galleryimage/galleryimage.dart';
import 'dart:developer';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => ProfileComponent();
}

class ProfileComponent extends State<Profile> {
  int _index = 0;
  bool _showCustomAppBar = false;
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> cardData = [
    {
      'title': 'Card 1',
      'description': "He'll want to use your yacht, and I don't want this thing smelling like fish.",
      'image':
          'https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg'
    },
    {
      'title': 'Card 2',
      'description': "He'll want to use your yacht, and I don't want this thing smelling like fish.",
      'image': 'https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg'
    },
    {
      'title': 'Card 3',
      'description': "He'll want to use your yacht, and I don't want this thing smelling like fish.",
      'image': 'https://wallpapers.com/images/featured/2ygv7ssy2k0lxlzu.jpg'
    },
    {
      'title': 'Card 1',
      'description': "He'll want to use your yacht, and I don't want this thing smelling like fish.",
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg'
    },
    {
      'title': 'Card 2',
      'description': "He'll want to use your yacht, and I don't want this thing smelling like fish.",
      'image':
          'https://media.cntraveller.com/photos/611bf0b8f6bd8f17556db5e4/1:1/w_2000,h_2000,c_limit/gettyimages-1146431497.jpg'
    },
    {
      'title': 'Card 3',
      'description': "He'll want to use your yacht, and I don't want this thing smelling like fish.",
      'image':
          'https://img.freepik.com/premium-photo/fantastic-view-kirkjufellsfoss-waterfall-near-kirkjufell-mountain-sunset_761071-868.jpg'
    },
  ];

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset >= 200) {
        log("asdasdas");
        setState(() {
          _showCustomAppBar = true;
        });
      } else {
        log("not");

        setState(() {
          _showCustomAppBar = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textStyle = TextStyle(color: Colors.white, fontSize: 15);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: _showCustomAppBar
              ? AppBar(
                  title: Center(
                    child: Text('Profile'),
                  ),
                  backgroundColor: Color.fromRGBO(93, 176, 117, 1),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      // Handle back button press
                    },
                  ),
                  actions: [
                      IconButton(
                        icon: Icon(Icons.logout),
                        onPressed: () {
                          // Handle back button press
                        },
                      )
                    ])
              : null,
          body: SafeArea(
            child: Column(children: [
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Container(
                      // color: Color.fromRGBO(93, 176, 117, 1),
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/getStarted.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24.0,
                            semanticLabel: 'Logout',
                          ),
                          Text("Profile",
                              style: textStyle.merge(TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25))),
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 24.0,
                            semanticLabel: 'Logout',
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 120,
                        // left: 100,
                        child: Container(
                          width: screenWidth,
                          // color: Colors.red,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 10,
                                color: Colors.white,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("./assets/images/avatar.jpg"),
                            ),
                          ),
                        )),
                  ],
                ),
              ),

              Align(
                  child: Column(
                children: [
                  Text("Victoria Robertson",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  Text("A mantra goes here",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold))
                ],
              )),

// Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
              Container(
                margin: EdgeInsets.only(top: 20),
                child: FlutterToggleTab(
                  width: 90, // width in percent
                  borderRadius: 30,
                  height: 50,
                  selectedIndex: _index,
                  unSelectedBackgroundColors: [
                    Color.fromRGBO(246, 246, 246, 1),
                    Color.fromRGBO(246, 246, 246, 1),
                  ],
                  selectedBackgroundColors: [Colors.white, Colors.white],
                  selectedTextStyle: TextStyle(
                      color: Color.fromRGBO(93, 176, 117, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  unSelectedTextStyle: TextStyle(
                      color: Color.fromRGBO(189, 189, 189, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  labels: ["Posts", "Photos"],
                  selectedLabelIndex: (index) {
                    setState(() {
                      _index = index;
                    });
                  },
                  isScroll: false,
                ),
              ),
              Expanded(child: _index == 0 ? Posts(list: cardData) : Photos(), flex: 1,)
              // _index == 0
              //     ? Posts(
              //         list: cardData,
              //       )
              //     : Photos(),
            ]
            ),
          )),
    );
  }
}

class Photos extends StatefulWidget {
  const Photos({Key? key}) : super(key: key);
  @override
  State<Photos> createState() => PhotosComponent();
}

class PhotosComponent extends State<Photos> {
  List<String> _list = [
    "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
    "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
    "https://wallpapers.com/images/featured/2ygv7ssy2k0lxlzu.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
    "https://media.cntraveller.com/photos/611bf0b8f6bd8f17556db5e4/1:1/w_2000,h_2000,c_limit/gettyimages-1146431497.jpg",
    "https://img.freepik.com/premium-photo/fantastic-view-kirkjufellsfoss-waterfall-near-kirkjufell-mountain-sunset_761071-868.jpg",
    "https://www.travelandleisure.com/thmb/KLPvXakEKLGE5AY2jVyovl3Md1k=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/iceland-BEAUTCONT1021-b1aeafa7ac2847a484cbca48d3172b6c.jpg",
    "https://w0.peakpx.com/wallpaper/265/481/HD-wallpaper-nature.jpg",
    "https://wallpapers.com/images/featured/2ygv7ssy2k0lxlzu.jpg",
  ];

  @override
  void initState() {
    super.initState();
    // _list.length == 0 ? fetchData() : null;
  }

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://picsum.photos/v2/list?page=2&limit=20'));
    if (response.statusCode == 200) {
      // API call successful
      final jsonData = json.decode(response.body);
      print(jsonData);

      setState(() {
        _list = jsonData;
        ;
      });
      // Process the data here
    } else {
      // API call failed
      print('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(_list.toString());
    return _list.length != 0
        ? Gallery(
            list: _list,
            title: "Gallery",
          )
        : Text("Loading...");
  }
}

class Posts extends StatelessWidget {
  const Posts({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final image = list[index]['image'] ?? '';
        return Container(
          margin:
              EdgeInsets.only(left: 20, right: 20, top: index == 0 ? 20 : 0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                    )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(list[index]['title']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        margin: EdgeInsets.only(bottom: 5),
                      ),
                      SizedBox( 
                        width: 200,                       
                        child: Text(list[index]['description']!, softWrap: true, textWidthBasis: TextWidthBasis.parent, maxLines: 3, overflow: TextOverflow.ellipsis,),
                      )
                    ],
                  )
                ],
              ),  
            ),
          ),
        );
      },
    );
  }
}

class Gallery extends StatelessWidget {
  final List<String> list;
  final String title;

  const Gallery({Key? key, required this.title, required this.list})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: GalleryImage(
                    numOfShowImages: 6,
                    imageUrls: list,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
