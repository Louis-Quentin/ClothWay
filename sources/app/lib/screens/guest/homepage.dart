import 'package:flutter/material.dart';
import 'package:bis/screens/guest/panierpage.dart';
import 'package:bis/screens/guest/favorispage.dart';
import 'package:bis/screens/guest/newspage.dart';
import 'package:bis/screens/guest/profilpage.dart'; 
import 'package:bis/screens/guest/profil/page/profile_page.dart';
import 'package:bis/screens/guest/notificationpage.dart';
import 'package:bis/screens/guest/confidentialitypage.dart';
import 'package:bis/screens/guest/socialnetworkspage.dart';
import 'package:bis/screens/guest/parampage.dart';
import 'package:bis/screens/guest/profil/utils/user_preferences.dart';
import 'auth.dart';

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
          Icon(
            Icons.eco,
            color: Color.fromRGBO(0, 150, 0, 1),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
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
            ],
          ),
        ],
      ),
    );
  }

  Widget banniere(BuildContext context, double height) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/image/motif.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Jusqu\'à -50%',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Découvrez la nouvelle collection été !',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Action à effectuer lors du clic sur le bouton
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0), // Marge interne du bouton
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Achetez',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildHeader(BuildContext context) => Material(
    color: Colors.black,
    child: InkWell(
      onTap: (() async {
        await UserPreferences.init();
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
      }),
      child: Container(
      color: Colors.black,

      padding: EdgeInsets.only(
        top: 25 + MediaQuery.of(context).padding.top,
        bottom: 25
      ),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://media.istockphoto.com/id/1300972574/photo/millennial-male-team-leader-organize-virtual-workshop-with-employees-online.jpg?s=170667a&w=0&k=20&c=S9AVbcsSpY1e6vwbnrrZHJzlAtnuSQKtmk11fDItSHE="),
          ),
          SizedBox(height: 11),
          Text('Marc Sarl', style: TextStyle(fontSize: 30, color: Colors.white),),
          Text('marc.sarl@gmail.com', style: TextStyle(fontSize: 15, color: Colors.white)),
        ],
      ),
      ),
    ),
  );
  Widget buildMenuItems(BuildContext context) => Wrap(
    runSpacing: 15,
    children: [
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Home', style: TextStyle(fontSize: 20)),
        onTap: () { 
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.shop_2_outlined),
        title: const Text('Panier', style: TextStyle(fontSize: 20)),
        onTap: () { 
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PanierPage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.favorite_border_outlined),
        title: const Text('Favoris', style: TextStyle(fontSize: 20)),
         onTap: () { 
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FavorisPage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.emoji_nature),
        title: const Text('Eco News', style: TextStyle(fontSize: 20)),
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewsPage()));
        
        },
      ),
      const Divider(color: Color.fromARGB(255, 0, 0, 0)),
      ListTile(
        leading: const Icon(Icons.settings_applications),
        title: const Text('Parametres', style: TextStyle(fontSize: 20)),
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParamPage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.notification_add_outlined),
        title: const Text('Notifications', style: TextStyle(fontSize: 20)),
        onTap: () { 
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationPage()));
        
        },
      ),
      ListTile(
        leading: const Icon(Icons.facebook),
        title: const Text('Réseaux sociaux', style: TextStyle(fontSize: 20)),
        onTap: () { 
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SocialPage()));
        
        },
      ),
      ListTile(
        leading: const Icon(Icons.security_update_rounded),
        title: const Text('Confidentialité', style: TextStyle(fontSize: 20)),
        onTap: () { 
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ConfidentialityPage()));
        
        },
      ),
    ],
  );
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children : <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
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
          banniere(context, 250),
          Column(children: [
            searchBar(),
            seeAllWidget(),
            const SizedBox(height: 10),
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
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
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
                child: Row(children: [
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
                child: Row(children: [
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
        ]),
      ),
    );
  }
}
