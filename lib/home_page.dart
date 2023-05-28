import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart' as badge;
import 'package:marquee/marquee.dart';
import 'package:oonzoo/product_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> gridViewList = [
      "assets/images/img4.jpg",
      "assets/images/img4.jpg",
      "assets/images/img4.jpg",
      "assets/images/img4.jpg",
      "assets/images/img4.jpg",
      "assets/images/img4.jpg",
      "assets/images/img4.jpg",
      "assets/images/img4.jpg",
      "assets/images/img4.jpg",
      "assets/images/img4.jpg",
      "assets/images/img4.jpg",
      "assets/images/img4.jpg"
    ];
    List<String> listViewImgList = [
      "assets/images/img1.jpg",
      "assets/images/img1.jpg",
      "assets/images/img1.jpg",
      "assets/images/img1.jpg"
    ];
    int currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundColor: Colors.pink,
            child: Icon(Icons.person),
          ),
        ),
        title: const Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Shop for",
                  style: TextStyle(fontSize: 15),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            Text("All", style: TextStyle(fontSize: 12))
          ],
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.black26,
            ),
          ),
          badge.Badge(
            badgeContent: const Text(
              '0',
              style: TextStyle(fontSize: 8),
            ),
            showBadge: true,
            position: badge.BadgePosition.topEnd(top: 5, end: 10),
            badgeStyle: const badge.BadgeStyle(
              badgeColor: Colors.yellow,
              padding: EdgeInsets.all(6),
              elevation: 0,
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black26),
              onPressed: () {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black26,
            ),
          ),
          badge.Badge(
            badgeContent: const Text(
              '0',
              style: TextStyle(fontSize: 8),
            ),
            showBadge: true,
            position: badge.BadgePosition.topEnd(top: 5, end: 10),
            badgeStyle: const badge.BadgeStyle(
              badgeColor: Colors.yellow,
              padding: EdgeInsets.all(6),
              elevation: 0,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black26,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap:()=> Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const ProductScreen())
          ),
          child: Column(
            children: [
              Container(
                  height: 35,
                  color: Colors.black12,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined, size: 20),
                        Text("Select a location to see product avaliability"),
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Colors.black12,
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  height: 70,
                  color: Colors.yellow,
                  child: Image.asset("assets/images/img1.jpg"),
                ),
              ),
              const SizedBox(),
              CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,
                  viewportFraction: 1,
                ),
                items: [
                  "assets/images/carasoleImg2.jpg",
                  "assets/images/carasoleImg2.jpg",
                  "assets/images/carasoleImg2.jpg",
                  "assets/images/carasoleImg2.jpg"
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                          ),
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(i),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  itemCount: listViewImgList.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: Image.asset(listViewImgList[index].toString()),
                    ),
                  ),
                ),
              ),
              const Text("Shop By Category", style: TextStyle(fontSize: 15)),
              GridView.builder(
                  itemCount: gridViewList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(gridViewList[index].toString()),
                            Text(
                              'Product ${index + 1}',
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              const Text("SUMMER FASHION DEALS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(border: Border.all(width: 0)),
                  child: Image.asset("assets/images/img4.jpg"),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      //decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: Image.asset("assets/images/img3.jpg"),
                    ),
                  ),
                ),
              ),
              const Text("PARENTING TOOLS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: Image.asset("assets/images/img3.jpg"),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.yellow,
                height: 20,
                child: Marquee(
                  text: '% Deal Corner',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 50.0,
                  // pauseAfterRound: Duration(seconds: 0),
                  startPadding: 10.0,
                  // accelerationDuration: Duration(seconds: 0),
                  accelerationCurve: Curves.ease,
                  // decelerationDuration: Duration(milliseconds: 0),
                  decelerationCurve: Curves.easeOut,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          setState(() => currentIndex = value);
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Shopping',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(Icons.slow_motion_video),
          ),
          BottomNavigationBarItem(
            label: 'Parenting',
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline),
          ),
          BottomNavigationBarItem(
            label: 'Menu',
            icon: Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
    );
  }
}
