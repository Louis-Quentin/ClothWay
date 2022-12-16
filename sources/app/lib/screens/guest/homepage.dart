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
            'Catégories',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'InterFont',
            ),
          ),
          Text(
            'Tout voir',
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
                  color: Colors.black,
                  fontFamily: 'InterFont',
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

  Widget suggestion({String? description, String? image}) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Container(
            width: 140,
            child: Center(
              child: Text(
                description!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'InterFont',
                ),
              ),
            ),
          ),
          Icon(Icons.eco),
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
                hintText: 'Cherche ton produit',
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

  Widget featuresWidget() {
    return Container(
      height: 80,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          padding: const EdgeInsets.only(right: 40),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Pour vous',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'InterFont',
                  ),
                ),
                Text(
                  'Tout voir',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'InterFont',
                  ),
                ),
              ]),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(30, 30, 30, 30),
          actions: const [
            Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ]),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: ListView(children: [
          Container(
            child: Column(children: [
              searchBar(),
              seeAllWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categories(
                      image: 'assets/image/femme.jpeg',
                      name: 'femme',
                    ),
                    categories(
                      image: 'assets/image/homme.jpg',
                      name: 'homme',
                    ),
                    categories(
                      image: 'assets/image/enfant.jpeg',
                      name: 'enfant',
                    ),
                    categories(
                      image: 'assets/image/sport.jpg',
                      name: 'sport',
                    ),
                  ],
                ),
              ),
              featuresWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    suggestion(
                      image: 'assets/image/lacoste.jpeg',
                      description: 't-shirt noir Lacoste 42e',
                    ),
                    suggestion(
                      image: 'assets/image/nike.jpeg',
                      description: 't-shirt noir Nike 25e',
                    ),
                    suggestion(
                      image: 'assets/image/ck.jpg',
                      description: 't-shirt noir Calvin 35e',
                    ),
                    suggestion(
                      image: 'assets/image/uniqlo.jpg',
                      description: 't-shirt noir Uniqlo 27e',
                    ),
                  ])),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    suggestion(
                      image: 'assets/image/jordan.jpeg',
                      description: 'Nike Jordan4 180e',
                    ),
                    suggestion(
                      image: 'assets/image/puma.jpg',
                      description: 'Puma Cell viper 140e',
                    ),
                    suggestion(
                      image: 'assets/image/adidas.jpg',
                      description: 'Adidas Origins 160e',
                    ),
                    suggestion(
                      image: 'assets/image/fila.jpg',
                      description: 'Fila 120e',
                    ),
                  ])),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    suggestion(
                      image: 'assets/image/doudoune_nike.jpg',
                      description: 'Doudoune Nike rouge 225e',
                    ),
                    suggestion(
                      image: 'assets/image/tommy.jpg',
                      description: 'Doudoune Tommy rouge 250e',
                    ),
                    suggestion(
                      image: 'assets/image/north_face.jpg',
                      description: 'The North face rouge 275e',
                    ),
                    suggestion(
                      image: 'assets/image/schott.jpg',
                      description: 'Doudoune Schott rouge 200e',
                    ),
                  ])),
            ]),
          ),
        ]),
      ),
    );
  }
}
