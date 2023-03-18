import 'package:flutter/material.dart';
import 'package:zing/modules/dashboard/cartScreen.dart';
import 'package:zing/modules/dashboard/homePage.dart';
import 'package:zing/modules/dashboard/order_screen.dart';
import 'package:zing/modules/dashboard/profile_page.dart';
import 'package:zing/modules/screens/search%20page.dart';

import '../model/model.dart';
import '../utilities/lists.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  TextEditingController search = TextEditingController();

  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomePageAppBar(),
      body: currentTab[currentScreen],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
        child: Container(
          height: 44,
          padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.red.withOpacity(0.8),
                const Color.fromRGBO(244, 67, 54, 1),
              ]
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInkWell(Icons.home_filled , 0),
              buildInkWell(Icons.shopping_cart , 1),
              buildInkWell(Icons.person , 2),
              buildInkWell( Icons.shopping_bag, 3),
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildInkWell(IconData icon , int index) {
    return InkWell(
              onTap: (){
                setState(() {
                currentScreen = index;
                });
              },
              child: Icon(icon,
                color: Colors.white,
              ),
            );
  }

  AppBar buildHomePageAppBar() {
    return AppBar(
      backgroundColor: Colors.red,
      elevation: currentScreen == 2 ? 0 : 2,
      actions: [
        buildSearchTextfield(),
        buildCartIcon()
      ],
    );

  }

  Padding buildCartIcon() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () {
              if(currentScreen != 1)
                {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(whareItComes: false),
                  ));
                }
              else{
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderScreen(whareItComes: false),
                    ));
              }
            },
            child: currentScreen == 1? const Icon(Icons.shopping_bag):const Icon(Icons.shopping_cart_sharp)),
      );
  }

  Expanded buildSearchTextfield() {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: search,
            decoration: InputDecoration(
              hintText: "Search in Zing",
              contentPadding: const EdgeInsets.all(5),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1.5,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SearchPage(
                            productList: allProducts,
                          ),),);
            },
          ),
        ),
      );
  }

}
