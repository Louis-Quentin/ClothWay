import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget seeAllWidget() {
    return Container(
      padding: const EdgeInsets.only(right: 30),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'See all',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget categories({String? name, String? image}) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140,
            child: Center(
              child: Text(
                name!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            width: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image!),
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(
        right: 30,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(children: [
          Material(
            borderRadius: BorderRadius.circular(30),
            shadowColor: Colors.green,
            elevation: 1.3,
            child: TextFormField(
              autofocus: false,
              decoration: const InputDecoration(
                hintText: 'Search your product',
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          )
        ]),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.green,
          actions: const [
            Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ]),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: ListView(
          children: [
            Container(
              child: Column(children: [
                searchBar(),
                seeAllWidget(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      categories(
                        image: 'assets/image/woman.png',
                        name: 'woman',
                      ),
                      categories(
                        image: 'assets/image/man.jpg',
                        name: 'men',
                      ),
                      categories(
                        image: 'assets/image/kids.png',
                        name: 'kids',
                      ),
                      categories(
                        image: 'assets/image/sports.png',
                        name: 'sports',
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 40),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'featured',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                      ]),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
