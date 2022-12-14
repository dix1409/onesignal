import 'package:compareprivateplanesapp/pages/aircraft.dart';
import 'package:compareprivateplanesapp/pages/articles.dart';
import 'package:compareprivateplanesapp/pages/home.dart';
import 'package:compareprivateplanesapp/pages/main_aircraft.dart';
import 'package:compareprivateplanesapp/pages/main_articles.dart';
import 'package:compareprivateplanesapp/pages/main_premium.dart';
import 'package:compareprivateplanesapp/pages/premium.dart';
import 'package:compareprivateplanesapp/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cpp App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> pages = <Widget>[Home(),MainAircraft(),MainArticles(),MainPremium(),Settings()];


  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
      ),
      body: Center(
        child: pages[_selectedIndex],

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Image.asset("icons/home_icon.png",width: 30,height: 30),label: "Home"),
          BottomNavigationBarItem(icon: Image.asset("icons/aircraft_icon.png",width: 30,height: 30,), label: "AirCraft" ),
          BottomNavigationBarItem(icon: Image.asset("icons/articles_icon.png",width: 30,height: 30,), label: "Articles"),
          BottomNavigationBarItem(icon: Image.asset("icons/premium_icon.png",width: 30,height: 30,), label: "Premium"),
          BottomNavigationBarItem(icon: Image.asset("icons/settting_icon.png",width: 30,height: 30,), label: "Settings"),
        ],
        onTap: _onItemTapped,
        unselectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 14),
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
