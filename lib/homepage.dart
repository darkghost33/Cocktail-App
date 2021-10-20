import 'dart:convert';

import 'package:cocktail_app/drink_detail.dart';
import 'package:flutter/material.dart';
import 'drink_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail';
  var res, drinks;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(Uri.parse(api));
    drinks = jsonDecode(res.body)["drinks"]; //print(res.body);
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.orange,
        Colors.brown,
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Cocktail For You"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Center(
            child: res != null
                ? ListView.builder(
                    itemCount: drinks.length,
                    itemBuilder: (context, index) {
                      var drink = drinks[index];
                      return ListTile(
                        leading: Hero(
                          tag: drink["idDrink"],
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(drink[
                                    "strDrinkThumb"] ??
                                "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1OCQbyxf7bEvykoY1uiinwAAAA%26pid%3DApi&f=1"),
                          ),
                        ),
                        title: Text(
                          "${drink["strDrink"]} ",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        subtitle: Text(
                          "${drink["idDrink"]} ",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DrinkDetail(drink: drink)));
                        },
                      );
                    },
                  )
                : CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )),
      ),
    );
  }
}
