

import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
        actions: const [
           Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.black26,
            ),
          ),

           Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black26,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
       // currentIndex: currentIndex,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
         // setState(() => currentIndex = value);
        },
        items: const[
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
